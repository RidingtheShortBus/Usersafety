//
//  ParserJSON.swift
//  TheGame
//
//  Created by Stephen Shellenberger on 3/28/15.
//  Copyright (c) 2015 Riding the ShortBus. All rights reserved.
//

import Foundation

class ParserJSON
{
    var dictionary: [String: AnyObject]!;
    
    init(){}
    
    func parseDictionary(json: String) -> [String: AnyObject]
    {
        NSLog("FUNC{parseDictionary()}");
        NSLog("JSON|" + json + "|");
        if let data = json.dataUsingEncoding(NSUTF8StringEncoding) {
            if let dictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: nil)  as? [String: AnyObject] {
                self.dictionary = dictionary;
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
        var retCode = self.dictionary[key.uppercaseString] as String
        if(retCode == "")
        {
            retCode = "NOT_VALUE"
        }
        NSLog("RETURN_CODE:{%@}",retCode);
        return retCode
    }
}