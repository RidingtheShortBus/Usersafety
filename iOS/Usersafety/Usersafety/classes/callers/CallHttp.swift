//
//  HTTP.swift
//  TheGame
//
//  Created by Stephen Shellenberger on 3/20/15.
//  Copyright (c) 2015 Riding the ShortBus. All rights reserved.
//

import Foundation

class CallHttp {
    
    func execute(post:NSString, callback: (String, String?) -> Void)
    {
        var session = NSURLSession.sharedSession();
        var request = self.getRequest(post);
        var task = session.dataTaskWithRequest(request, completionHandler:
        {
            (data, response, error) -> Void in
            if error != nil
            {
                callback("", error.localizedDescription);
            }
            else
            {
                var result = NSString(data: data
                                    , encoding: NSASCIIStringEncoding)!
                callback(result, nil);
            }
        });
        task.resume();
    }
    
    func getRequest(post:NSString) -> NSMutableURLRequest
    {
        let url = NSURL(string: "http://drafted.guyverdesigns.lcl/_controls/CONTROL.php");
        var postData:NSData = post.dataUsingEncoding(NSASCIIStringEncoding)!;
        var postLength:NSString = String( postData.length );
        NSLog("PostData: %@",post);
        
        var request = NSMutableURLRequest(URL: url!);
        request.HTTPMethod = "POST";
        request.HTTPBody = postData;
        request.setValue(postLength, forHTTPHeaderField: "Content-Length");
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type");
        request.setValue("application/json", forHTTPHeaderField: "Accept");
    
        return request;
    }
}

    