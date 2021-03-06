function Get-SystemFont() {
    <#
    .Synopsis
        Gets the fonts associated with different system items (e.g. captions, menus, icons)
    .Description
        Uses the static properties of the type System.Windows.SystemFont
        to retrieve all of the fonts associated with different system items.
        If the System.Windows.SystemFont type is not found, the PresentationCore 
        assembly will be automatically loaded
    .Example
        # Get All System Fonts
        Get-SystemFont
    #>
    if (-not ("Windows.SystemFonts" -as [Type])) {
        Add-Type -AssemblyName "PresentationCore"
    }       

    [Windows.SystemFonts] | 
        Get-Member -static -type Property |
        Where-Object { $_.Name -like "*Family" } |
        Foreach-Object {
                $_.Name | Select-Object @{
                    Name='Purpose'
                    Expression={$_.Substring(0, $_.IndexOf("FontFamily"))}
                }, @{
                    Name='Font'
                    Expression={[Windows.SystemFonts]::"$_"}
                }             
        }
}