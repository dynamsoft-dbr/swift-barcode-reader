//
//  dbr.swift
//  DynamsoftBarcodeReader
//
//  Created by Ling Xiao on 15/8/20.
//

import Foundation

class DBR {
    func decodeFile(file: String)->String? {
        
        var filePtr = strdup(file.cStringUsingEncoding(NSUTF8StringEncoding)!)
        var fileName: UnsafeMutablePointer<CChar> = UnsafeMutablePointer(filePtr)
        var result : pBarcodeResultArray = dbr_decodeBarcodeFile(fileName)
        
        free(filePtr)
        
        println("Total barcode: \(String(result.move().iBarcodeCount))\n.......")
        
        var count = result.move().iBarcodeCount
        var barcodeIndex = 1
        var results: String = ""
        // print barcode recognition results
        for i in 0..<Int(count) {
            var pBarcodeResult = result.move().ppBarcodes.advancedBy(i).move()
            
            results += "Barcode: \(barcodeIndex++)\n"
            results += "Page: \(String(pBarcodeResult.move().iPageNum))\n"
            
            var lFormat: __int64 = pBarcodeResult.move().llFormat
            var format = String.fromCString(GetFormatStr(lFormat))
            
            results += "Type: \(format!)\n"
            results += "Value: \(String.fromCString(pBarcodeResult.move().pBarcodeData)!)\n"
            results += ".......\n"
            
        }
        
        // free C memory
        dbr_release_memory(result)

        return results
    }
}


