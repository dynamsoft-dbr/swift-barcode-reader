//
//  main.swift
//
//  Created by Ling Xiao on 15/8/19.
//

import Foundation

var file: String = "/Applications/Dynamsoft/Barcode Reader 3.0 Trial/Images/AllSupportedBarcodeTypes.tif" // barcode file
//let namePtr = strdup(filePath.bridgeToObjectiveC().UTF8String)

var filePtr = strdup(file.cStringUsingEncoding(NSUTF8StringEncoding)!)
var fileName: UnsafeMutablePointer<CChar> = UnsafeMutablePointer(filePtr)
var result : pBarcodeResultArray = dbr_decodeBarcodeFile(fileName)

free(filePtr)

println("Total barcode: \(String(result.move().iBarcodeCount))\n.......")

var count = result.move().iBarcodeCount
var pBarcodeResult: pBarcodeResult = nil
var barcodeIndex = 1

// print barcode recognition results
for i in 0..<Int(count) {
    pBarcodeResult = result.move().ppBarcodes.advancedBy(i).move()
    println("Barcode: \(barcodeIndex++)")
    println("Page: \(String(pBarcodeResult.move().iPageNum))")
    var lFormat: __int64 = pBarcodeResult.move().llFormat
    var format = String.fromCString(GetFormatStr(lFormat))
    println("Type: \(format!)")
    println("Value: \(String.fromCString(pBarcodeResult.move().pBarcodeData)!)")
    println(".......")
    
}

// free C memory
dbr_release_memory(result)

