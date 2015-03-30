//
//  prUsersafety_Registration.swift
//  TheGame
//
//  Created by Stephen Shellenberger on 3/29/15.
//  Copyright (c) 2015 Riding the ShortBus. All rights reserved.
//

import Foundation
import UIKit

class prUsersafety_Registration
{
    var parserJson = ParserJSON();
    
    func handleResponse(vc: UIViewController
                        , json: String)
    {
        NSLog("FUNC{handleResponse()}");
        
        self.parserJson.parseDictionary(json);
        let retCode = self.parserJson.getReturnCode();
        if(retCode == "AJAX_SERVICE_CONTROL_KEY_NOT_VALID"
            || retCode == "AJAX_SERVICE_CONTROL_KEY_NOT_FOUND"
            || retCode == "TASK_PERFORMED")
        {
            NSLog("Successful Call:" + retCode);
            vc.performSegueWithIdentifier("idsegueUsersafety_Validation", sender: vc);
        }
        else
        {
            NSLog("Bad Call");
        }
    }

    
    func getPostQueryString(email: NSString
                            , password: NSString
                            , gamertag: NSString) -> String
    {
        NSLog("FUNC{getPostQueryString()}");
        
        var post:NSString = "AJAX_SERVICE_CONTROL_KEY=CREATE_GAMER_REGISTRATION";
        post = post + "&email=\(email)";
        post = post + "&nickname=\(gamertag)";
        post = post + "&password=\(password)";
        post = post + "&firstname=BLANK";
        post = post + "&lastname=BLANK";
        post = post + "&city=BLANK";
        post = post + "&crossappl_configurations_sdesc_region=REGION_NC";
        post = post + "&crossappl_configurations_sdesc_country=COUNTRY_US";
        post = post + "&gamertag=\(gamertag)";
        post = post + "&crossappl_configurations_sdesc_gamerrole=GAMER_ROLE_GAMER";
        
        return post;
    }
}
