//
//  AppDelegate.swift
//  DynamsoftBarcodeReader
//
//  Created by Ling Xiao on 15/8/20.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var btLoad: NSButton!
    @IBOutlet weak var btRead: NSButton!
    @IBOutlet weak var text: NSTextField!
    @IBOutlet weak var filePath: NSTextField!
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
    }
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func openPanel() {
        var openPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = false
        openPanel.canCreateDirectories = false
        openPanel.canChooseFiles = true
        openPanel.beginWithCompletionHandler { (result) -> Void in
            if result == NSFileHandlingPanelOKButton {
                if let path = openPanel.URL?.path {
                    self.filePath.stringValue = path
                }
            }
        }

    }
    
    @IBAction func onClick(sender: NSButton) {
        var title = sender.title
        switch(title) {
        case "Load Barcode File":
            dispatch_async(dispatch_get_main_queue()) {
                self.openPanel()
            }
            break
        case "Read Barcode":
            
            if self.filePath.stringValue == "" {
                text.stringValue = "Please add image path!"
                return
            }
                    
            println("default:" + self.filePath.stringValue)
            var dbr = DBR()
            text.stringValue = dbr.decodeFile(self.filePath.stringValue)!
            break
        default:
            break
        }
        
    }
}

