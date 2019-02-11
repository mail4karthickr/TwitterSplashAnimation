//
//  ViewController.swift
//  TwitterSplashScreenAnimation
//
//  Created by Karthick Ramasamy on 2/10/19.
//  Copyright © 2019 Karthick Ramasamy. All rights reserved.
//

import UIKit

func delay(seconds: Double, completion: @escaping ()-> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let splashView = SplashView(bezierPath: UIBezierPath.twitterShape(),
                                    backgroundColor: UIColor.blue)
        view.addSubview(splashView)
        
        delay(seconds: 2.0) {
            splashView.startAnimation()
        }
    }
}
