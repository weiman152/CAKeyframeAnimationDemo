//
//  ViewController.swift
//  关键帧动画CAKeyframeAnimation
//
//  Created by iOS on 2018/5/22.
//  Copyright © 2018年 weiman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var purpleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redView.layer.cornerRadius = redView.frame.size.width/2.0
        redView.layer.masksToBounds = true
        purpleView.layer.cornerRadius = purpleView.frame.size.width/2.0
        purpleView.layer.masksToBounds = true
        
        animationOne()
        animationTwo()
    }

   
    //一个数组，提供了一组关键帧的值， 当使用path的 时候 values的值自动被忽略。
    func animationOne() {
        /*
         提供一组关键帧位置，使得动画view的中心依次落在这些关键点上，形成动画
         */
        let animation = CAKeyframeAnimation(keyPath: "position")
        let value1: NSValue = NSValue(cgPoint: CGPoint(x: 100, y: 100))
        let value2: NSValue = NSValue(cgPoint: CGPoint(x: 200, y: 100))
        let value3: NSValue = NSValue(cgPoint: CGPoint(x: 200, y: 200))
        let value4: NSValue = NSValue(cgPoint: CGPoint(x: 100, y: 200))
        let value5: NSValue = NSValue(cgPoint: CGPoint(x: 100, y: 300))
        let value6: NSValue = NSValue(cgPoint: CGPoint(x: 200, y: 400))
        animation.values = [value1, value2, value3, value4, value5, value6]
        
        animation.repeatCount = MAXFLOAT
        animation.autoreverses = true
        animation.duration = 4.0
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        animation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)]
        animation.delegate = self
        
        redView.layer.add(animation, forKey: nil)
    }
    
    func animationTwo() {
        
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        let value1 = NSValue(cgPoint: CGPoint(x: screenWidth/2.0, y: 0))
        let value2 = NSValue(cgPoint: CGPoint(x: screenWidth, y: 100))
        let value3 = NSValue(cgPoint: CGPoint(x: 0, y: screenHeight/2.0))
        let value4 = NSValue(cgPoint: CGPoint(x: screenWidth/2.0, y: screenHeight))
        animation.values = [value1,value2,value3,value4,value1]
        animation.repeatCount = MAXFLOAT
        animation.autoreverses = true
        animation.duration = 6.0
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        animation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)]
        animation.delegate = self
        
        purpleView.layer.add(animation, forKey: nil)
    }


}

extension ViewController: CAAnimationDelegate {
    
    
}

