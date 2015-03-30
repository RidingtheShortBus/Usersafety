//
//  prUsersafety_ResetPassword.swift
//  TheGame
//
//  Created by Stephen Shellenberger on 3/29/15.
//  Copyright (c) 2015 Riding the ShortBus. All rights reserved.
//

import Foundation
import UIKit

class prUsersafety_ResetPassword
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
            || retCode as String == "RESET_PASSWORD_NOT_COMPLETED")
        {
            NSLog("Successful Call 01:" + retCode);
        }
        else if(retCode as String == "RESET_PASSWORD_COMPLETED")
        {
            NSLog("Successful Call 02:" + retCode);
            vc.performSegueWithIdentifier("idsegueUsersafety_ResetPasswordSent", sender: vc);
        }
        else
        {
            NSLog("Bad Call");
        }
    }
    
    func getPostQueryString(email: NSString) -> String
    {
        NSLog("FUNC{getPostQueryString()}");
        
        var post:NSString = "AJAX_SERVICE_CONTROL_KEY=RESET_GAMER_PASSWORD";
        post = post + "&email=\(email)";
        
        return post;
    }
}