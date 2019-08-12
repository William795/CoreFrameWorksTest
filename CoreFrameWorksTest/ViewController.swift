//
//  ViewController.swift
//  CoreFrameWorksTest
//
//  Created by William Moody on 8/12/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit
import CoreGraphics

class ViewController: UIViewController {

    @IBOutlet weak var labelMove: UILabel!
    @IBOutlet weak var labelGrow: UILabel!
    @IBOutlet weak var labelSurprise: UILabel!
    @IBOutlet weak var tappButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        floatingButton()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func buttonTapped(_ sender: Any) {
        moveLabel()
    }
    
    func moveLabel() {
        labelMove.center = CGPoint(x: view.center.x + 20, y: view.center.y + 50)
    }
    
    func floatingButton() {
        // makes button appear "floating" by slightly moving it when the device is tilted can also do interesting things with shadows to give an object more depth
        let horizontalEffect = UIInterpolatingMotionEffect(
            keyPath: "center.x",
            type: .tiltAlongHorizontalAxis)
        horizontalEffect.minimumRelativeValue = -16
        horizontalEffect.maximumRelativeValue = 16
        
        let verticalEffect = UIInterpolatingMotionEffect(
            keyPath: "center.y",
            type: .tiltAlongVerticalAxis)
        verticalEffect.minimumRelativeValue = -16
        verticalEffect.maximumRelativeValue = 16
        
        let effectGroup = UIMotionEffectGroup()
        effectGroup.motionEffects = [ horizontalEffect,
                                      verticalEffect ]
        
        tappButton.addMotionEffect(effectGroup)
    }
}

