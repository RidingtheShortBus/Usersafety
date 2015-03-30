//
//  InfoPlistBundle.swift
//  TheGame
//
//  Created by Stephen Shellenberger on 3/28/15.
//  Copyright (c) 2015 Riding the ShortBus. All rights reserved.
//

import Foundation

class InfoPlistBundle
{
    var dictionary = Dictionary<String, AnyObject>();
    
    init()
    {
        if let path = NSBundle.mainBundle().pathForResource("Info", ofType: "plist") {
            if let dict = NSDictionary(contentsOfFile: path) as? Dictionary<String, AnyObject> {
                self.dictionary = dict;
            }
        }
    }
    
    func getAttributeVal(name: String) -> String
    {
        var value:String = self.dictionary[name] as String;
        NSLog(":" + name + ":" + value + ":");
        return value;
    }
    
    // com.rtsb.usersafety.login.success.storyboard.id
    func getRtsbUserSafetyLoginSuccessStoryboardID() -> String
    {
        return self.getAttributeVal("com.rtsb.usersafety.login.success.storyboard.id");
    }
    
    // com.rtsb.usersafety.login.success.viewcontroller.id
    func getRtsbUserSafetyLoginSuccessViewcontrollerID() -> String
    {
        return self.getAttributeVal("com.rtsb.usersafety.login.success.viewcontroller.id");
    }
}