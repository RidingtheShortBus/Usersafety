//
//  vcUsersafety_LoggedinData.swift
//  TheGame
//
//  Created by Stephen Shellenberger on 3/26/15.
//  Copyright (c) 2015 Riding the ShortBus. All rights reserved.
//

import UIKit

class vcUsersafety_LoggedinData: UIViewController
{
    var processLoggedinData = prUsersafety_LoggedinData();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.getLoggedinData();
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
    func getLoggedinData()
    {
        var callHttp = CallHttp();
        callHttp.execute(self.processLoggedinData.getPostQueryString())
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
                    self.processLoggedinData.handleResponse(self, json: data);
                });
            }
        }
    }
}
