//
//  SecondViewController.swift
//  关键帧动画CAKeyframeAnimation
//
//  Created by iOS on 2018/5/22.
//  Copyright © 2018年 weiman. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var yellowView: UIView!
    
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blueView.layer.cornerRadius = blueView.frame.size.width/2.0
        blueView.layer.masksToBounds = true
        greenView.layer.cornerRadius = greenView.frame.size.width/2.0
        greenView.layer.masksToBounds = true
        yellowView.layer.cornerRadius = yellowView.frame.size.width/2.0
        yellowView.layer.masksToBounds = true
        animationPathBlue()
        animationGreen()
        animationYellow()
        
    }

    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    /// 使用path的方式实现动画
    /*
     这是一个 CGPathRef 对象，默认是空的，当我们创建好CAKeyframeAnimation的实例的时候，可以通过制定一个自己定义的path来让 某一个物体按照这个路径进行动画。这个值默认是nil 当其被设定的时候 values 这个属性就被覆盖
     */
    
    /// 沿着圆周运动
    func animationPathBlue() {
        
        // 创建动画对象
        let animation = CAKeyframeAnimation(keyPath: "position")
        // 创建一个CGPathRef对象，就是动画的路线
        let path = CGMutablePath()
        //  自动沿着弧度移动
        path.addEllipse(in: CGRect(x: 0, y: 50, width: screenWidth, height: 100))
        
        animation.path = path
        animation.autoreverses = true
        animation.repeatCount = MAXFLOAT
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        animation.duration = 3.0
        animation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)]
        animation.delegate = self
        
        blueView.layer.add(animation, forKey: nil)
    }
    
    /// 沿着直线运动
    func animationGreen() {
        // 创建动画对象
        let animation = CAKeyframeAnimation(keyPath: "position")
        // 创建一个CGPathRef对象，就是动画的路线
        let path = CGMutablePath()
        // 设置开始位置
        path.move(to: CGPoint(x: 0, y: 150))
        // 沿着直线移动
        /*
         Z字轨迹
         */
        path.addLine(to: CGPoint(x: screenWidth, y: 150))
        path.addLine(to: CGPoint(x: 0, y: 200))
        path.addLine(to: CGPoint(x: screenWidth, y: 200))
        path.addLine(to: CGPoint(x: 0, y: 200))
        path.addLine(to: CGPoint(x: screenWidth, y: 150))
        
        animation.path = path
        animation.autoreverses = true
        animation.repeatCount = MAXFLOAT
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        animation.duration = 6.0
        animation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)]
        animation.delegate = self
        
        greenView.layer.add(animation, forKey: nil)
    }
    
    /// 曲线运动
    func animationYellow() {
        // 创建动画对象
        let animation = CAKeyframeAnimation(keyPath: "position")
        // 创建一个CGPathRef对象，就是动画的路线
        let path = CGMutablePath()
        // 设置开始位置
        path.move(to: CGPoint(x: 0, y: screenHeight))
        // 沿着曲线移动
        path.addCurve(to:       CGPoint(x: screenWidth, y: screenHeight/2.0),
                      control1: CGPoint(x: screenWidth/4.0, y: screenHeight/4.0),
                      control2: CGPoint(x: screenWidth/2.0, y: screenHeight/2.0))
        
//        path.addCurve(to:       CGPoint(x: 150.0, y: 275.0),
//                      control1: CGPoint(x: 250.0, y: 275.0),
//                      control2: CGPoint(x: 90.0, y: 120.0))
//
//        path.addCurve(to:       CGPoint(x: 250.0, y: 275.0),
//                      control1: CGPoint(x: 350.0, y: 275.0),
//                      control2: CGPoint(x: 110.0, y: 120.0))
//
//        path.addCurve(to:       CGPoint(x: 350.0, y: 275.0),
//                      control1: CGPoint(x: 450.0, y: 275.0),
//                      control2: CGPoint(x: 130.0, y: 120.0))
        
        animation.path = path
        animation.autoreverses = true
        animation.repeatCount = MAXFLOAT
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        animation.duration = 3.0
        animation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)]
        animation.delegate = self
        
        yellowView.layer.add(animation, forKey: nil)
        
    }

}

extension SecondViewController: CAAnimationDelegate {
    
}









