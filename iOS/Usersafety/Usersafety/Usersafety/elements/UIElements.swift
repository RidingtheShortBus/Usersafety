//
//  UIElements.swift
//  TheGame
//
//  Created by Stephen Shellenberger on 3/24/15.
//  Copyright (c) 2015 Riding the ShortBus. All rights reserved.
//

import Foundation
import UIKit

class UIElements
{
    func messageLabel(message: String, uivc: UIViewController)
    {
        NSLog("FUNC{messageLabel()}");
        var label:UILabel = UILabel(frame: CGRectMake(100, 100, 200, 21));
        label.center = CGPointMake(160, 284);
        label.textAlignment = NSTextAlignment.Center;
        label.text = "------";
        uivc.view.addSubview(label);
    }
}