//
//  prUsersafety_LoggedInData.swift
//  TheGame
//
//  Created by Stephen Shellenberger on 3/29/15.
//  Copyright (c) 2015 Riding the ShortBus. All rights reserved.
//

import Foundation
import UIKit

class prUsersafety_LoggedinData
{
    var parserJson = ParserJSON();
    
    func handleResponse(vc: UIViewController
                        , json: String)
    {
        NSLog("FUNC{handleResponse()}");
        
        self.parserJson.parseDictionary(json);
        let retCode = self.parserJson.getReturnCode();
        if(retCode as String == "AJAX_SERVICE_CONTROL_KEY_NOT_VALID"
            || retCode as String == "AJAX_SERVICE_CONTROL_KEY_NOT_FOUND"
            || retCode as String == "LOGGED_IN_DATA_NOT_FOUND")
        {
            NSLog("Successful Call 01:" + retCode);
        }
        else if(retCode as String == "LOGGED_IN_DATA_FOUND")
        {
            NSLog("Successful Call 02:" + retCode);
        }
        else
        {
            NSLog("Bad Call");
        }
    }
    
    func getPostQueryString() -> String
    {
        NSLog("FUNC{getPostQueryString()}");
        
        var post:NSString = "AJAX_SERVICE_CONTROL_KEY=LOGGED_IN_GAMER_DATA";
        
        return post;
    }
}
