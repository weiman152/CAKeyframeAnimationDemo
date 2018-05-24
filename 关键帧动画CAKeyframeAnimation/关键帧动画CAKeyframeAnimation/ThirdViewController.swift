//
//  ThirdViewController.swift
//  关键帧动画CAKeyframeAnimation
//
//  Created by iOS on 2018/5/22.
//  Copyright © 2018年 weiman. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var greenView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置这个属性，会改变greenView的原始frame
        greenView.layer.anchorPoint = CGPoint.zero
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func start(_ sender: UIButton) {
        animation()
        animationTopLeft()
    }
    
    /// 按照中心点抖动
    func animation() {
        
        let animati = CAKeyframeAnimation(keyPath: "transform.rotation")
        // rotation 旋转，需要添加弧度值
        // 角度转弧度
        animati.values = [angle2Radion(angle: -50), angle2Radion(angle: 50), angle2Radion(angle: -50)]
        animati.repeatCount = MAXFLOAT
        
        orangeView.layer.add(animati, forKey: nil)
    }
    
    /// 按照左上角抖动
    func animationTopLeft() {
        let animati = CAKeyframeAnimation(keyPath: "transform.rotation")
        // rotation 旋转，需要添加弧度值
        // 角度转弧度
        animati.values = [angle2Radion(angle: -100), angle2Radion(angle: 50), angle2Radion(angle: -50)]
        animati.repeatCount = MAXFLOAT
        
        greenView.layer.add(animati, forKey: nil)
    }
    
    func angle2Radion(angle: Float) -> Float {
        return angle / Float(180.0 * Double.pi)
    }


}




