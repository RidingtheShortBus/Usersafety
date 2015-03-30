//
//  vcUsersafety_ActivateAccount.swift
//  TheGame
//
//  Created by Stephen Shellenberger on 3/24/15.
//  Copyright (c) 2015 Riding the ShortBus. All rights reserved.
//

import UIKit

class vcUsersafety_ActivateAccount: UIViewController
{
    var processActivateAccount = prUsersafety_ActivateAccount();
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var activateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func actionbuttonUsersafety_ActivateAccount(sender: AnyObject)
    {
        var email:NSString = emailText.text;
        
        if(email != "")
        {
            var callHttp = CallHttp();
            callHttp.execute(self.processActivateAccount.getPostQueryString(email))
            {
                (data, error) -> Void in
                if (error != nil)
                {
                    NSLog("Non-Trapped Return: %@", error!);
                }
                else
                {
                    dispatch_async(dispatch_get_main_queue(),
                    { () -> Void in
                        self.processActivateAccount.handleResponse(self, json: data);
                    });
                }
            }
        }
        else
        {
            var alertView:UIAlertView = UIAlertView();
            alertView.title = "Activation issue has occured!";
            alertView.message = "Please enter Email";
            alertView.delegate = self;
            alertView.addButtonWithTitle("OK");
            alertView.show();
        }
    }
}
