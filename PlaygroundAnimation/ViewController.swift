//
//  ViewController.swift
//  PlaygroundAnimation
//
//  Created by Alex Rodrigues on 21/11/18.
//  Copyright © 2018 Alex Rodrigues. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let coverFormationArray: [UIImage] = [UIImage(named: "formacao_00024")!, UIImage(named: "formacao_00030")!, UIImage(named: "formacao_00033")!, UIImage(named: "formacao_00036")!, UIImage(named: "formacao_00039")!, UIImage(named: "formacao_00041")!, UIImage(named: "formacao_00044")!, UIImage(named: "formacao_00047")!, UIImage(named: "formacao_00048")!]
    
    let coverLoopArray: [UIImage] = [UIImage(named: "loop_00140")!, UIImage(named: "loop_00142")!, UIImage(named: "loop_00144")!, UIImage(named: "loop_00145")!, UIImage(named: "loop_00148")!, UIImage(named: "loop_00149")!, UIImage(named: "loop_00150")!, UIImage(named: "loop_00152")!, UIImage(named: "loop_00153")!, UIImage(named: "loop_00155")!,
                                     UIImage(named: "loop_00156")!, UIImage(named: "loop_00158")!, UIImage(named: "loop_00159")!, UIImage(named: "loop_00161")!,
                                     UIImage(named: "loop_00162")!, UIImage(named: "loop_00164")!]
    
    let sparklesLoopArray: [UIImage] = [UIImage(named: "faiscas_loop_00142")!, UIImage(named: "faiscas_loop_00145")!, UIImage(named: "faiscas_loop_00149")!,  UIImage(named: "faiscas_loop_00154")!, UIImage(named: "faiscas_loop_00158")!, UIImage(named: "faiscas_loop_00163")!, UIImage(named: "faiscas_loop_00167")!, UIImage(named: "faiscas_loop_00172")!, UIImage(named: "faiscas_loop_00175")!, UIImage(named: "faiscas_loop_00176")!, UIImage(named: "faiscas_loop_00179")!, UIImage(named: "faiscas_loop_00182")!, UIImage(named: "faiscas_loop_00184")!]
    
    let launchSmokeArray: [UIImage] = [UIImage(named: "faiscas_saida_00184")!, UIImage(named: "faiscas_saida_00185")!, UIImage(named: "faiscas_saida_00186")!, UIImage(named: "faiscas_saida_00189")!, UIImage(named: "faiscas_saida_00191")!, UIImage(named: "faiscas_saida_00193")!, UIImage(named: "faiscas_saida_00195")!, UIImage(named: "faiscas_saida_00197")!, UIImage(named: "faiscas_saida_00199")!, UIImage(named: "faiscas_saida_00201")!, UIImage(named: "faiscas_saida_00203")!, UIImage(named: "faiscas_saida_00206")!, UIImage(named: "faiscas_saida_00210")!, UIImage(named: "faiscas_saida_00212")!, UIImage(named: "faiscas_saida_00213")!, UIImage(named: "faiscas_saida_00216")!, UIImage(named: "faiscas_saida_00217")!, UIImage(named: "faiscas_saida_00219")!, UIImage(named: "faiscas_saida_00220")!, UIImage(named: "faiscas_saida_00223")!, UIImage(named: "faiscas_saida_00224")!, UIImage(named: "faiscas_saida_00226")!, UIImage(named: "faiscas_saida_00227")!, UIImage(named: "faiscas_saida_00229")!, UIImage(named: "faiscas_saida_00230")!, UIImage(named: "faiscas_saida_00232")!, UIImage(named: "faiscas_saida_00233")!, UIImage(named: "faiscas_saida_00235")!, UIImage(named: "faiscas_saida_00236")!, UIImage(named: "faiscas_saida_00238")!, UIImage(named: "faiscas_saida_00239")!]
    
    @IBOutlet weak var ivCoverPrimary: UIImageView!
    @IBOutlet weak var ivCoverPrimaryFire: UIImageView!
    
    @IBOutlet weak var ivCoverSecundary: UIImageView!
    @IBOutlet weak var ivCoverSecundaryFire: UIImageView!
    
    @IBOutlet weak var vContainerSecondMoment: UIView!
    @IBOutlet weak var containerSecondMomentY: NSLayoutConstraint!
    @IBOutlet weak var sparklesY: NSLayoutConstraint!
    
    @IBOutlet weak var backgroundEther: UIImageView!
    
    @IBOutlet weak var ivSparklesLoop: UIImageView!
    @IBOutlet weak var ivLaunchSmoke: UIImageView!
    
    @IBOutlet weak var ivArrow: UIImageView!
    
    private var tapGestureIvPrimary: UITapGestureRecognizer!
    private var swipeGestureIvSecundary: UISwipeGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setupGestures()
        
    }
    
    private func setupGestures() {
        tapGestureIvPrimary = UITapGestureRecognizer(target: self, action: #selector(ViewController.didTappedIvPrimary))
        tapGestureIvPrimary.numberOfTapsRequired = 1
        ivCoverPrimary.isUserInteractionEnabled = true
        ivCoverPrimary.addGestureRecognizer(tapGestureIvPrimary)
        
        
        swipeGestureIvSecundary = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.launchSmoke))
        swipeGestureIvSecundary.direction = .up
        ivCoverSecundary.isUserInteractionEnabled = true
        vContainerSecondMoment.isUserInteractionEnabled = true
        ivCoverSecundary.addGestureRecognizer(swipeGestureIvSecundary)
    }
    
    @objc func didTappedIvPrimary() {
        ivCoverPrimaryFire.alpha = 1.0
        ivCoverPrimaryFire.animationDuration = 1.0
        ivCoverPrimaryFire.animationImages = coverFormationArray
        ivCoverPrimaryFire.startAnimating()
        self.perform(#selector(ViewController.hideFirstMoment), with: nil, afterDelay: 0.98)
    }
    
    @objc func hideFirstMoment() {
        showBackground()
        UIView.animate(withDuration: 0.4, animations: {
            self.ivCoverPrimary.alpha = 0.0
            self.ivCoverPrimaryFire.alpha = 0.0
            
        }) { (finished) in
            if (finished) {
                self.ivCoverPrimaryFire.stopAnimating()
                self.startCoverSecondMomementFireLoop()
                self.perform(#selector(ViewController.moveSecondMomentCenter), with: nil, afterDelay: 0.8)
            }
        }
    }
    
    @objc func showBackground() {
        UIView.animate(withDuration: 0.8, animations: {
            self.vContainerSecondMoment.alpha = 1.0
            self.backgroundEther.alpha = 1.0
        }) { (finished) in
        
        }
    }
    
    @objc func startCoverSecondMomementFireLoop() {
        self.ivCoverSecundaryFire.animationDuration = 1.0
        self.ivCoverSecundaryFire.animationImages = coverLoopArray
        self.ivCoverSecundaryFire.startAnimating()
        showBackground()
    }
    
    @objc func moveSecondMomentCenter() {
        let heightScreen = UIScreen.main.bounds.height / 2
        let centerY = heightScreen - (self.vContainerSecondMoment.frame.size.height / 2)
        
        self.containerSecondMomentY.constant = centerY
        self.sparklesY.constant = centerY
        UIView.animate(withDuration: 1.0, animations: {
            self.view.layoutIfNeeded()
        })
        wobble()
        startSparklesLoop()
    }
    
    @objc func startSparklesLoop() {
        ivSparklesLoop.alpha = 1.0
        ivSparklesLoop.animationImages = sparklesLoopArray
        ivSparklesLoop.animationDuration = 1.5
        ivSparklesLoop.startAnimating()
        
        arrowUpDown()
        UIView.animate(withDuration: 0.5) {
            self.ivArrow.alpha = 1.0
        }
    }
    
    @objc func launchSmoke() {
        hideSparkles()
        UIView.animate(withDuration: 0.25) {
            self.ivArrow.alpha = 0.0
        }
        
        ivLaunchSmoke.alpha = 1.0
        ivLaunchSmoke.animationImages = launchSmokeArray
        ivLaunchSmoke.animationDuration = 1.5
        ivLaunchSmoke.startAnimating()
        
        self.containerSecondMomentY.constant = -450
        self.sparklesY.constant = -450
        UIView.animate(withDuration: 0.6) {
            self.view.layoutIfNeeded()
        }
        
        self.perform(#selector(ViewController.hideLaunchSmoke), with: nil, afterDelay: 1.3)
    }
    
    @objc func hideLaunchSmoke() {
        UIView.animate(withDuration: 0.2) {
            self.ivLaunchSmoke.alpha = 0.0
        }
    }
    
    @objc func wobble() {
        let midX = ivCoverSecundary.center.x
        let midY = ivCoverSecundary.center.y
        
        let animationY = CABasicAnimation()
        animationY.keyPath = "position"
        animationY.duration = 0.11
        animationY.repeatCount = HUGE
        animationY.autoreverses = true
        animationY.fromValue = CGPoint(x: midX + 3, y: midY - 6)
        animationY.toValue = CGPoint(x: midX - 3, y: midY + 6)
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.repeatCount = HUGE
        groupAnimation.autoreverses = true
        groupAnimation.animations = [animationY]
        ivCoverSecundary.layer.add(groupAnimation, forKey: "position")
        ivCoverSecundaryFire.layer.add(groupAnimation, forKey: "position")
    }
    
    func arrowUpDown() {
        let midX = ivArrow.center.x
        let midY = ivArrow.center.y
        
        let animationY = CABasicAnimation(keyPath: "position")
        animationY.duration = 0.9
        animationY.repeatCount = 99999999
        animationY.autoreverses = true
        animationY.fromValue = CGPoint(x: midX, y: midY - 10)
        animationY.toValue = CGPoint(x: midX, y: midY + 10)
        ivArrow.layer.add(animationY, forKey: "position")
    }
    
    func hideSparkles() {
        UIView.animate(withDuration: 0.3, animations: {
            self.ivSparklesLoop.alpha = 0.0
        }) { (finished) in
            if (finished) {
                self.ivSparklesLoop.stopAnimating()
            }
        }
        
    }
}

