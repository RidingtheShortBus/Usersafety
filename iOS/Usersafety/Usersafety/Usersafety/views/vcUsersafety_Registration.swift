//
//  vcUsersafety_Registration.swift
//  Usersafety
//
//  Created by Stephen Shellenberger on 3/19/15.
//  Copyright (c) 2015 Riding the ShortBus. All rights reserved.
//

import UIKit

class vcUsersafety_Registration: UIViewController
{
    var processRegistration = prUsersafety_Registration();
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var confirmText: UITextField!
    @IBOutlet weak var gamertagText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
     
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

    @IBAction func actionbuttonUsersafety_CreateAccount(sender: UIButton) {
        var email:NSString = emailText.text;
        var password:NSString = passwordText.text;
        var confirm:NSString = confirmText.text;
        var gamertag:NSString = gamertagText.text;
        
        if(email != "" && gamertag != "" && password == confirm && password != "" && confirm != "")
        {
            var callHttp = CallHttp();
            callHttp.execute(self.processRegistration.getPostQueryString(email, password: password, gamertag: gamertag))
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
                            self.processRegistration.handleResponse(self, json: data);
                    });
                }
            }
        }
        else
        {
            var alertView:UIAlertView = UIAlertView();
            alertView.title = "Registration issue has occured!";
            alertView.message = "Please enter Email and Password";
            alertView.delegate = self;
            alertView.addButtonWithTitle("OK");
            alertView.show();
        }
    }
}
