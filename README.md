# Swift Barcode Reader
1D/2D Barcode Reader with Swift and Dynamsoft Barcode SDK.

Console App:

![image](http://www.codepool.biz/wp-content/uploads/2015/08/swift_barcode_console.png)

Cocoa App:

![image](http://www.codepool.biz/wp-content/uploads/2015/08/Swift_barcode_reader.png)

Installation
-------------
* Dynamsoft Barcode SDK for Mac: http://www.dynamsoft.com/Downloads/Dynamic-Barcode-Reader-Download.aspx
* XCode 6.4: https://developer.apple.com/xcode/downloads/

How to Run
----------
1. Open Xcode project file.
2. Drag **libDynamsoftBarcodeReader.dylib** from ``<Dynamsoft/Barcode Reader 3.0 Trial>/Redist/`` to the Swift project.
3. Build and run.

Note: you can modify the image path in the console project:

```Swift
var file: String = "/Applications/Dynamsoft/Barcode Reader 3.0 Trial/Images/AllSupportedBarcodeTypes.tif" // barcode file
```

Reference
---------
[Interacting with C APIs][1]

Blog
----
[How to Bridge C Code to Create Swift Barcode Reader on Mac][2]

[1]:https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/BuildingCocoaApps/InteractingWithCAPIs.html#//apple_ref/doc/uid/TP40014216-CH8-ID17
[2]:http://www.codepool.biz/swift-barcode-reader-bridge-c-code.html
