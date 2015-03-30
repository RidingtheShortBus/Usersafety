//
//  prUsersafety_Login.swift
//  TheGame
//
//  Created by Stephen Shellenberger on 3/29/15.
//  Copyright (c) 2015 Riding the ShortBus. All rights reserved.
//

import Foundation
import UIKit

class prUsersafety_Login
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
            || retCode as String == "RECORD_NOT_FOUND_BY_EMAIL"
            || retCode as String == "PASSWORD_DOES_NOT_MATCH"
            || retCode as String == "TOO_MANY_FAILED_LOGIN_ATTEMPTS"
            || retCode as String == "FORM_FIELDS_NOT_VALID"
            || retCode as String == "PASSWORD_DOES_NOT_MATCH")
        {
            NSLog("Successful Call 01:" + retCode);
        }
        else if(retCode as String == "TOO_MANY_FAILED_LOGIN_ATTEMPTS")
        {
            NSLog("Successful Call 02:" + retCode);
            vc.performSegueWithIdentifier("idsegueUsersafety_ResetPassword", sender: vc);
            
        }
        else if(retCode as String == "ACCOUNT_INACTIVE")
        {
            NSLog("Successful Call 03:" + retCode);
            vc.performSegueWithIdentifier("idsegueUsersafety_ActivateAccount", sender: vc);
            
        }
        else if(retCode as String == "USER_IS_AUTHENTICATED")
        {
            NSLog("Successful Call 04:" + retCode);
            var iplb = InfoPlistBundle();
            // Call Welcome ViewControll in Main Storyboard
            var mainstoryboard:UIStoryboard = UIStoryboard(name: iplb.getRtsbUserSafetyLoginSuccessStoryboardID(), bundle: nil);
            var vcWelcome:UIViewController = mainstoryboard.instantiateViewControllerWithIdentifier(iplb.getRtsbUserSafetyLoginSuccessViewcontrollerID()) as UIViewController;
            vc.presentViewController(vcWelcome, animated: false, completion: nil)
            
        }
        else
        {
            NSLog("Bad Call");
        }
    }
    
    func getPostQueryString(email: NSString
                            , password: NSString) -> String
    {
        NSLog("FUNC{getPostQueryString()}");
        
        var post:NSString = "AJAX_SERVICE_CONTROL_KEY=LOGIN_GAMER_BY_EMAIL";
        post = post + "&email=\(email)";
        post = post + "&password=\(password)";
        
        return post;
    }
}