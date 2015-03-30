//
//  vcUsersafety_Login.swift
//  Usersafety
//
//  Created by Stephen Shellenberger on 3/19/15.
//  Copyright (c) 2015 Riding the ShortBus. All rights reserved.
//

import UIKit

class vcUsersafety_Login: UIViewController
{
    var processLogin = prUsersafety_Login();
    var processResetPassword = prUsersafety_LoginResetPassword();

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!

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

    @IBAction func actionbuttonUserSafety_PerformLogin(sender: UIButton)
    {
        var email:NSString = emailText.text;
        var password:NSString = passwordText.text;
        
        if(email != "" && password != "")
        {
            var callHttp = CallHttp();
            callHttp.execute(self.processLogin.getPostQueryString(email, password: password))
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
                        self.processLogin.handleResponse(self, json: data);
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
    
    @IBAction func actionbuttonUsersafety_CreateAccount(sender: UIButton) {
        self.performSegueWithIdentifier("idsegueUsersafety_CreateAccount", sender: self);
    }
   
    @IBAction func actionbuttonUsersafety_ResetPassword(sender: UIButton)
    {
        var email:NSString = emailText.text;
        
        if(email != "")
        {
            var callHttp = CallHttp();
            callHttp.execute(self.processResetPassword.getPostQueryString(email))
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
                        self.processResetPassword.handleResponse(self, json: data);
                    });
                }
            }
        }
        else
        {
            var alertView:UIAlertView = UIAlertView();
            alertView.title = "Registration issue has occured!";
            alertView.message = "Please enter Email";
            alertView.delegate = self;
            alertView.addButtonWithTitle("OK");
            alertView.show();
        }
    }
}
