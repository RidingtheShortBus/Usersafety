//
//  JSONParser.swift
//  TheGame
//
//  Created by Stephen Shellenberger on 3/20/15.
//  Copyright (c) 2015 Riding the ShortBus. All rights reserved.
//

import Foundation

class JSONParser
{
    var jsonary: [String: AnyObject]!;
    
    init(){}
    
    func parseDictionary(jsonString: String) -> [String: AnyObject]
    {
        NSLog("FUNC{parseDictionary()}");
        NSLog("JSON|" + jsonString + "|");
        if let data = jsonString.dataUsingEncoding(NSUTF8StringEncoding) {
            if let jsonary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: nil)  as? [String: AnyObject] {
                self.jsonary = jsonary;
            }
        }
        return [String: AnyObject]()
    }
    
    func getReturnCode() -> String
    {
        NSLog("FUNC{getReturnCode()}");
        var retVal = self.getReturnValue("RETURN_CODE")
        return retVal
    }
    
    func getReturnValue(key : String) -> String
    {
        NSLog("FUNC{getReturnValue()}");
        var retCode = self.jsonary[key.uppercaseString] as String
        if(retCode == "")
        {
            retCode = "NOT_VALUE"
        }
        NSLog("RETURN_CODE:{%@}",retCode);
        return retCode
    }
}