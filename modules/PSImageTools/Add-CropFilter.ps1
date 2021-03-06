#requires -version 2.0
function Add-CropFilter {    
    <#
    .Synopsis
    Creates a filter for cropping images.

    .Description
    The Add-CropFilter function adds a Crop image filter to a filter collection.
    It creates a new filter collection if none exists. An image filter is Windows Image Acquisition (WIA) concept.
    Each filter represents a change to an image.

    Add-CropFilter does not crop images; it just creates a crop filter.
    To crop an image, use the Crop method of the Get-Image function, which uses a crop filter that Add-CropFilter creates, 
    or the Set-ImageFilter function, which applies the filters.

    All of the parameters of this function are optional. 
    Without parameters, Add-CropFilter creates an image filter collection.
    Then it creates a crop filter that is not specific to an image and will not crop image content (values for the Left, Top, Right, and Bottom parameters are 0).

    .Parameter Filter
        Enter a filter collection (Wia.ImageProcess COM object).
        Each filter in the collection represents a unit of modification to a WiA ImageFile object.
        This parameter is optional. If you do not submit a filter collection, Add-CropFilter creates one for you.

    .Parameter Image
        Creates a crop filter for the specified image.
        Enter an image object, such as one returned by the Get-Image function.
        This parameter is optional.
        If you do not specify an image, Add-CropFilter creates a crop filter that is not image-specific.

        If you do not specify an image, you cannot specify percentage values (values less than 1) for the
        Left, Top, Right, or Bottom parameters.

    .Parameter Left
        Specifies the how much to crop from the left side of the image.
        The default value is zero (0). To specify pixels, enter a value greater than one (1).
        To specify a percentage, enter a value less than one (1), such as ".25".
        Percentages are valid only when the command includes the Image parameter.

    .Parameter Top
        Specifies the how much to crop from the top of the image.
        The default value is zero (0). To specify pixels, enter a value greater than one (1).
        To specify a percentage, enter a value less than one (1), such as ".25".
        Percentages are valid only when the command includes the Image parameter.

    .Parameter Right
        Specifies the how much to crop from the right side of the image.
        The default value is zero (0).
        To specify pixels, enter a value greater than one (1).
        To specify a percentage, enter a value less than one (1), such as ".25".
        Percentages are valid only when the command includes the Image parameter.
    .Parameter Bottom
        Specifies the how much to crop from the bottom of the image.
        The default value is zero (0).
        To specify pixels, enter a value greater than one (1).
        To specify a percentage, enter a value less than one (1), such as ".25".
        Percentages are valid only when the command includes the Image parameter.

    .Parameter Passthru
        Returns an object that represents the crop filter.
        By default, this function does not generate output.

    .Notes
        Add-CropFilter uses the Wia.ImageProcess object.

    .Example
        Add-CropFilter –right 45 –bottom 22 –passthru

    .Example
        $i = get-image .\Photo01.jpg
        Add-CropFilter –image $i –top .3 -passthru

    .Example
        C:\PS> $cf = Add-CropFilter –passthru
        C:\PS> ($cf.filters | select properties).properties | format-table Name, Value –auto

        Name       Value
        ----       -----
        Left           0 
        Top            0
        Right         45
        Bottom        22
        FrameIndex     0


    .Example
        $image = Get-Image .\Photo01.jpg            
        $image = $image | Set-ImageFilter -filter (Add-CropFilter -Image $image -Left .1 -Right .1 -Top .1 -Bottom .1 -passThru) -passThru                    
        $image.SaveFile(".\Photo02.jpg")
    .Link
        Get-Image
    .Link
        Set-ImageFilter
    .Link
        Image Manipulation in PowerShell:
        http://blogs.msdn.com/powershell/archive/2009/03/31/image-manipulation-in-powershell.aspx
    .Link
        "ImageProcess object" in MSDN
        http://msdn.microsoft.com/en-us/library/ms630507(VS.85).aspx
    .Link
        "Filter Object" in MSDN 
        http://msdn.microsoft.com/en-us/library/ms630501(VS.85).aspx
    .Link
        "How to Use Filters" in MSDN
        http://msdn.microsoft.com/en-us/library/ms630819(VS.85).aspx
    #>
    param(
    [Parameter(ValueFromPipeline=$true)]
    [__ComObject]
    $filter,
    
    [__ComObject]
    $image,
        
    [Double]$left,
    [Double]$top,
    [Double]$right,
    [Double]$bottom,
    
    [switch]$passThru                      
    )
    
    process {
        if (-not $filter) {
            $filter = New-Object -ComObject Wia.ImageProcess
        } 
        $index = $filter.Filters.Count + 1
        if (-not $filter.Apply) { return }
        $crop = $filter.FilterInfos.Item("Crop").FilterId                    
        $isPercent = $true
        if ($left -gt 1) { $isPercent = $false }
        if ($top -gt 1) { $isPercent = $false } 
        if ($right -gt 1) { $isPercent = $false } 
        if ($bottom -gt 1) { $isPercent = $false }
        $filter.Filters.Add($crop)
        if ($isPercent -and $image) {
            $filter.Filters.Item($index).Properties.Item("Left") = $image.Width * $left
            $filter.Filters.Item($index).Properties.Item("Top") = $image.Height * $top
            $filter.Filters.Item($index).Properties.Item("Right") = $image.Width * $right
            $filter.Filters.Item($index).Properties.Item("Bottom") = $image.Height * $bottom
        } else {
            $filter.Filters.Item($index).Properties.Item("Left") = $left
            $filter.Filters.Item($index).Properties.Item("Top") = $top
            $filter.Filters.Item($index).Properties.Item("Right") = $right
            $filter.Filters.Item($index).Properties.Item("Bottom") = $bottom                    
        }
        if ($passthru) { return $filter }         
    }
}
