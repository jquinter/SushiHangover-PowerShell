
NAME
    Add-CropFilter
    
SYNOPSIS
    Creates a filter for cropping images.
    
    
SYNTAX
    Add-CropFilter [[-filter] <__ComObject>] [[-image] <__ComObject>] [[-left] <Double>] [[-top] <Double>] [[-right] <Double>] [[-bottom] <Double>] [-passThru] [<CommonPar
    ameters>]
    
    
DESCRIPTION
    The Add-CropFilter function adds a Crop image filter to a filter collection.
    It creates a new filter collection if none exists. An image filter is Windows Image Acquisition (WIA) concept.
    Each filter represents a change to an image.
    
    Add-CropFilter does not crop images; it just creates a crop filter.
    To crop an image, use the Crop method of the Get-Image function, which uses a crop filter that Add-CropFilter creates, 
    or the Set-ImageFilter function, which applies the filters.
    
    All of the parameters of this function are optional. 
    Without parameters, Add-CropFilter creates an image filter collection.
    Then it creates a crop filter that is not specific to an image and will not crop image content (values for the Left, Top, Right, and Bottom parameters are 0).
    

RELATED LINKS
    Get-Image 
    Set-ImageFilter 
    Image Manipulation in PowerShell:
    http://blogs.msdn.com/powershell/archive/2009/03/31/image-manipulation-in-powershell.aspx 
    "ImageProcess object" in MSDN
    http://msdn.microsoft.com/en-us/library/ms630507(VS.85).aspx 
    "Filter Object" in MSDN 
    http://msdn.microsoft.com/en-us/library/ms630501(VS.85).aspx 
    "How to Use Filters" in MSDN
    http://msdn.microsoft.com/en-us/library/ms630819(VS.85).aspx 

REMARKS
    To see the examples, type: "get-help Add-CropFilter -examples".
    For more information, type: "get-help Add-CropFilter -detailed".
    For technical information, type: "get-help Add-CropFilter -full".

NAME
    Add-RotateFlipFilter
    
SYNOPSIS
    Creates a filter for rotating images.
    
    
SYNTAX
    Add-RotateFlipFilter [[-filter] <__ComObject>] [[-angle] <Int32>] [-flipHorizontal] [-flipVertical] [-passThru] [<CommonParameters>]
    
    
DESCRIPTION
    The Add-RotateFlipFilter function adds a RotateFlip filter to an image filter collection.
    It creates a new filter collection if none exists. 
    
    An image filter is Windows Image Acquisition (WIA) concept. 
    Each filter represents a change to an image. 
    
    Add-RotateFlipFilter does not rotate or flip images; it only creates a filter. 
    To rotate or flip images, use the FlipVertical, FlipHorizontal, RotateClockwise and 
    RotateCounterClockwise methods of the Get-Image function, or use the Set-ImageFilter function, 
    which applies the filters.
    
    Unlike other filter functions in the PSImageTools module, Add-RotateFlipFilter does not have an image parameter.
    RotateFlip filters are not specific to an image.
    
    All parameters of this function are optional. 
    If you use Add-RotateFlipFilter without parameters, it creates a RotateFlip filter that does not rotate or flip the image.
    

RELATED LINKS
    Set-ImageFilter 
    Image Manipulation in PowerShell:
    http://blogs.msdn.com/powershell/archive/2009/03/31/image-manipulation-in-powershell.aspx 
    "ImageProcess object" in MSDN
    http://msdn.microsoft.com/en-us/library/ms630507(VS.85).aspx 
    "Filter Object" in MSDN 
    http://msdn.microsoft.com/en-us/library/ms630501(VS.85).aspx 
    "How to Use Filters" in MSDN
    http://msdn.microsoft.com/en-us/library/ms630819(VS.85).aspx 

REMARKS
    To see the examples, type: "get-help Add-RotateFlipFilter -examples".
    For more information, type: "get-help Add-RotateFlipFilter -detailed".
    For technical information, type: "get-help Add-RotateFlipFilter -full".

NAME
    Add-OverlayFilter
    
SYNOPSIS
    Creates a filter for overlaying images.
    
    
SYNTAX
    Add-OverlayFilter [[-filter] <__ComObject>] [[-image] <__ComObject>] [[-left] <Double>] [[-top] <Double>] [-passThru] [<CommonParameters>]
    
    
DESCRIPTION
    The Add-OverlayFilter function adds a Stamp filter of an image to a filter collection.
    The stamp filter lets you layer the specified image over another images.
    Add-OverlayFilter creates a new filter collection if none exists. 
    
    An image filter is Windows Image Acquisition (WIA) concept.
    Each filter represents a change to an image. 
    Add-OverlayFilter does not overlay images; it only creates a filter. 
    To overlay the image use the Set-ImageFilter function, which applies the filters.
    
    The Image parameter of Add-OverlayFilter is required. You cannot create a stamp (overlay) filter that is not specific to an image.
    

RELATED LINKS
    Get-Image 
    Set-ImageFilter 
    Image Manipulation in PowerShell:
    http://blogs.msdn.com/powershell/archive/2009/03/31/image-manipulation-in-powershell.aspx 
    "ImageProcess object" in MSDN
    http://msdn.microsoft.com/en-us/library/ms630507(VS.85).aspx 
    "Filter Object" in MSDN 
    http://msdn.microsoft.com/en-us/library/ms630501(VS.85).aspx 
    "How to Use Filters" in MSDN
    http://msdn.microsoft.com/en-us/library/ms630819(VS.85).aspx 

REMARKS
    To see the examples, type: "get-help Add-OverlayFilter -examples".
    For more information, type: "get-help Add-OverlayFilter -detailed".
    For technical information, type: "get-help Add-OverlayFilter -full".

NAME
    Set-ImageFilter
    
SYNOPSIS
    Applies an image filter to one or more images.
    
    
SYNTAX
    Set-ImageFilter [[-image] <Object>] [[-filter] <__ComObject[]>] [-passThru] [<CommonParameters>]
    
    
DESCRIPTION
    The Set-ImageFilter function changes an image by applying an image filter to the image.
    For example, to crop an image, you can apply a crop filter to the image.
    This strategy is particularly useful when you want to make the same change to many images, such as flipping them all vertically.
    
    You can change images without a filter by using the methods of the Get-Image function.
    For example, to crop an image, you can use the Crop method of Get-Image.
    Get-Image actually creates the filter for you and applies it.
    

RELATED LINKS
    Get-Image 
    Add-CropFilter 
    Add-OverlayFilter 
    Add-RotateFlipFilter 
    Add-ScaleFilter 
    Image Manipulation in PowerShell:
    http://blogs.msdn.com/powershell/archive/2009/03/31/image-manipulation-in-powershell.aspx 
    "ImageProcess object" in MSDN
    http://msdn.microsoft.com/en-us/library/ms630507(VS.85).aspx 
    "Filter Object" in MSDN 
    http://msdn.microsoft.com/en-us/library/ms630501(VS.85).aspx 
    "How to Use Filters" in MSDN
    http://msdn.microsoft.com/en-us/library/ms630819(VS.85).aspx 

REMARKS
    To see the examples, type: "get-help Set-ImageFilter -examples".
    For more information, type: "get-help Set-ImageFilter -detailed".
    For technical information, type: "get-help Set-ImageFilter -full".

NAME
    Add-ScaleFilter
    
SYNOPSIS
    Creates a filter for resizing images.
    
    
SYNTAX
    Add-ScaleFilter [[-filter] <__ComObject>] [[-image] <__ComObject>] [[-width] <Double>] [[-height] <Double>] [-DoNotPreserveAspectRatio] [-passThru] [<CommonParameters>
    ]
    
    
DESCRIPTION
    The Add-ScaleFilter function adds a scale filter to an image filter collection.
    It creates a new filter collection if none exists. 
    
    An image filter is Windows Image Acquisition (WIA) concept.
    Each filter represents a change to an image. 
    
    Add-ScaleFilter does not resize images; it only creates a filter.
    To resize images, use the Resize method of the Get-Image function, or use the 
    Set-ImageFilter function, which applies the filters.
    
    The Width and Height parameters of this function are required and the Image 
    parameter is optional. If you specify an image, you can specify Width and Height 
    as percentages (values less than 1). If you do not specify an image, you 
    must specify the Width and Height in pixels (values greater than 1).
    

RELATED LINKS
    Get-Image 
    Set-ImageFilter 
    Image Manipulation in PowerShell:
    http://blogs.msdn.com/powershell/archive/2009/03/31/image-manipulation-in-powershell.aspx 
    "ImageProcess object" in MSDN
    http://msdn.microsoft.com/en-us/library/ms630507(VS.85).aspx 
    "Filter Object" in MSDN 
    http://msdn.microsoft.com/en-us/library/ms630501(VS.85).aspx 
    "How to Use Filters" in MSDN
    http://msdn.microsoft.com/en-us/library/ms630819(VS.85).aspx 

REMARKS
    To see the examples, type: "get-help Add-ScaleFilter -examples".
    For more information, type: "get-help Add-ScaleFilter -detailed".
    For technical information, type: "get-help Add-ScaleFilter -full".

NAME
    Get-ImageProperty
    
SYNOPSIS
    Gets the extended properties of images.
    
    
SYNTAX
    Get-ImageProperty [-Image] <Object> [<CommonParameters>]
    
    
DESCRIPTION
    The Get-ImageProperty function gets properties of an image in addition 
    to the properties of the object that Get-Image returns. 
    
    The input to Get-ImageProperty is the COM object that Get-Image returns.
    To use Get-ImageProperty, use the Get-Image function to get the image file.
    Then submit or pipe the output from Get-Image to Get-ImageProperty.
    
    You can use the extended properties to search and organize your image files.
    You can also use the properties with Copy-ImageIntoOrganizedFolder to sort the images into file system folders based on their property values.
    

RELATED LINKS
    Get-Image 
    Copy-ImageIntoOrganizedFolder 
    "Image Manipulation in PowerShell": http://blogs.msdn.com/powershell/archive/2009/03/31/image-manipulation-in-powershell.aspx 

REMARKS
    To see the examples, type: "get-help Get-ImageProperty -examples".
    For more information, type: "get-help Get-ImageProperty -detailed".
    For technical information, type: "get-help Get-ImageProperty -full".

NAME
    ConvertTo-Jpeg
    
SYNOPSIS
    Converts an image to a JPEG.
    
    
SYNTAX
    ConvertTo-Jpeg [[-Image] <Object>] [[-Quality] <Int32>] [<CommonParameters>]
    
    
DESCRIPTION
    The ConvertTo-JPEG function converts image files to JPEG file format.
    You can specify the desired image quality on a scale of 1 to 100.
    
    ConvertTo-JPEG takes only COM-based image objects of the type that Get-Image returns.
    To use this function, use the Get-Image function to create image objects for the image files, 
    then submit the image objects to ConvertTo-JPEG.
    
    The converted files have the same name and location as the original files but with a .JPG file name extension.
    If a file with the same name already exists in the location, ConvertTo-JPEG declares an error.
    

RELATED LINKS
    "Image Manipulation in PowerShell": http://blogs.msdn.com/powershell/archive/2009/03/31/image-manipulation-in-powershell.aspx 
    "ImageProcess object": http://msdn.microsoft.com/en-us/library/ms630507(VS.85).aspx 
    Get-Image 
    ConvertTo-Bitmap 

REMARKS
    To see the examples, type: "get-help ConvertTo-Jpeg -examples".
    For more information, type: "get-help ConvertTo-Jpeg -detailed".
    For technical information, type: "get-help ConvertTo-Jpeg -full".

NAME
    Copy-ImageIntoOrganizedFolder
    
SYNOPSIS
    Copies images into folders organized by characteristics that you specify.
    
    
SYNTAX
    Copy-ImageIntoOrganizedFolder [-Path] <String[]> [-Property] <String[]> [-Filter <String>] [-Include <String[]>] [-Exclude <String[]>] [-Recurse] [-HideProgress] [<Com
    monParameters>]
    
    Copy-ImageIntoOrganizedFolder [-Path] <String[]> [-ScriptBlock] <ScriptBlock[]> [-Filter <String>] [-Include <String[]>] [-Exclude <String[]>] [-Recurse] [-HideProgres
    s] [<CommonParameters>]
    
    
DESCRIPTION
    The Copy-ImageIntoOrganizedFolder function uses properties or script blocks that you specify to create folders on disk. 
    Then it copies the image files into the correct folders based on their property values.
    
    Use the Path parameter to specify the image files to copy. 
    The Include, Exclude, Filter, and Recurse parameters qualify the Path parameter. 
    These parameter work in Copy-ImageIntoOrganizedFolders in the same way that they work in the Get-ChildItem cmdlet.
    
    Use the Property and ScriptBlock parameters to establish criteria for organizing the image files into folders.
    
    Copy-ImageIntoOrganizedFolder calls both the Get-Image and Get-ImageProperty functions on every image that you submit.
    Therefore, you can use the basic properties that Get-Image gets or the extended properties that Get-ImageProperty gets to organize your images.
    

RELATED LINKS
    Get-Image 
    Get-ImageProperty 
    Get-ChildItem 

REMARKS
    To see the examples, type: "get-help Copy-ImageIntoOrganizedFolder -examples".
    For more information, type: "get-help Copy-ImageIntoOrganizedFolder -detailed".
    For technical information, type: "get-help Copy-ImageIntoOrganizedFolder -full".

NAME
    Get-Image
    
SYNOPSIS
    Gets information about images.
    
    
SYNTAX
    Get-Image [-file] <String> [<CommonParameters>]
    
    
DESCRIPTION
    Get-Image gets an object that represents each image file. 
    The object has many properties and methods that you can use to edit images in Windows PowerShell.
    

RELATED LINKS
    "Image Manipulation in PowerShell": http://blogs.msdn.com/powershell/archive/2009/03/31/image-manipulation-in-powershell.aspx 
    Add-CropFilter 
    Add-ScaleFilter 
    Add-RotateFlipFilter 
    Get-ImageProperties 

REMARKS
    To see the examples, type: "get-help Get-Image -examples".
    For more information, type: "get-help Get-Image -detailed".
    For technical information, type: "get-help Get-Image -full".

NAME
    ConvertTo-Bitmap
    
SYNOPSIS
    Converts an image to a bitmap (.bmp) file.
    
    
SYNTAX
    ConvertTo-Bitmap [[-Image] <Object>] [[-Quality] <Int32>] [-HideProgress] [-Remove] [<CommonParameters>]
    
    
DESCRIPTION
    The ConvertTo-Bitmap function converts image files to .bmp file format.
    You can specify the desired image quality on a scale of 1 to 100.
    
    ConvertTo-Bitmap takes only COM-based image objects of the type that Get-Image returns.
    To use this function, use the Get-Image function to create image objects for the image files, 
    then submit the image objects to ConvertTo-Bitmap.
    
    The converted files have the same name and location as the original files but with a .bmp file name extension. 
    If a file with the same name already exists in the location, ConvertTo-Bitmap declares an error.
    

RELATED LINKS
    "Image Manipulation in PowerShell": http://blogs.msdn.com/powershell/archive/2009/03/31/image-manipulation-in-powershell.aspx 
    "ImageProcess object": http://msdn.microsoft.com/en-us/library/ms630507(VS.85).aspx 
    Get-Image 
    ConvertTo-JPEG 

REMARKS
    To see the examples, type: "get-help ConvertTo-Bitmap -examples".
    For more information, type: "get-help ConvertTo-Bitmap -detailed".
    For technical information, type: "get-help ConvertTo-Bitmap -full".




