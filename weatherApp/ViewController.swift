//
//  ViewController.swift
//  weatherApp
//
//  Created by Bondan Eko Prasetyo on 8/11/17.
//  Copyright © 2017 B-Soft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var BaseView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /*let jobTitle: UILabel = UILabel()
        jobTitle.text = "Hello World"
        jobTitle.numberOfLines = 0
        jobTitle.translatesAutoresizingMaskIntoConstraints = false
        Panel.addSubview(jobTitle)
        
        //MARK: Constraint - jobTitle
        //MARK: Leading
        Panel.addConstraint(NSLayoutConstraint(item: jobTitle, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: Panel, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: 1.0))
        
        Panel.addConstraint(NSLayoutConstraint(item: jobTitle, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: Panel, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: 1.0))*/
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func showForecast(_ sender: Any) {
        self.performSegue(withIdentifier: "goToForecast", sender: self )
    }
}
