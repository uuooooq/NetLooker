//
//  AppDelegate.swift
//  NetLooker
//
//  Created by Wenter.Zhu on 2018/3/12.
//  Copyright © 2018年 Wenter.Zhu. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var status = NSStatusBar.system.statusItem(withLength: 200)
    var customMenu = NSMenu()
    var count = 1000
//    var timer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(), userInfo: nil, repeats: true)

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        status.target = self
        //status.action = #selector(statusBarClicked(_:))
        //设置状态图标
        //status.image = NSImage.init(named: NSImage.Name(rawValue: "QQ")
            
        
        status.button?.action = #selector(statusBarClicked(_:))
        status.button?.title = "上行\(count)"
        
        //设置应用图标
        NSApp.applicationIconImage = NSImage.init(named: NSImage.Name(rawValue: "QQ1"))
        //NSMenu
        customMenu.title = "Title"
        customMenu.addItem(withTitle: "关于我们", action: #selector(clickMenuItem(_:)), keyEquivalent: "g")
        customMenu.addItem(withTitle: "详细信息", action: #selector(clickMenuItem(_:)), keyEquivalent: "d")
        customMenu.addItem(withTitle: "退出", action: #selector(NSApp.terminate(_:)), keyEquivalent: "q")
        status.menu = customMenu
        
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
        //timer.invalidate()
    }
    
    @objc func statusBarClicked(_ sender:NSStatusItem){
        print("statusBarClicked")
        count = count + 10;
        status.button?.title = "上行\(count)"
    }
    @objc func clickMenuItem(_ sender:NSMenuItem){
        print(sender.title)
        count = count + 10;
        status.button?.title = "上行\(count)"
    }


}

