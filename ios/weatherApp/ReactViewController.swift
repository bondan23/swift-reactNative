//
//  ReactViewController.swift
//  weatherApp
//
//  Created by Bondan Eko Prasetyo on 8/11/17.
//  Copyright © 2017 B-Soft. All rights reserved.
//

import UIKit
import React

class ReactViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Hello")
        let jsCodeLocation = URL(string: "http://localhost:8081/index.ios.bundle?platform=ios")
        let mockData:NSDictionary = [
            "scores":
            [
                ["name":"Alex", "value":"42"],
                ["name":"Joel", "value":"10"]
            ]
        ]
        
        let rootView = RCTRootView(
            bundleURL: jsCodeLocation,
            moduleName: "WeatherApp",
            initialProperties: mockData as [NSObject : AnyObject],
            launchOptions: nil
        )
        
        self.view = rootView
    }

}
