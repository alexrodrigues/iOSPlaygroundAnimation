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
    
    @IBOutlet weak var ivCoverPrimary: UIImageView!
    @IBOutlet weak var ivCoverPrimaryFire: UIImageView!
    
    @IBOutlet weak var ivCoverSecundary: UIImageView!
    @IBOutlet weak var ivCoverSecundaryFire: UIImageView!
    
    @IBOutlet weak var vContainerSecondMoment: UIView!
    @IBOutlet weak var containerSecondMomentY: NSLayoutConstraint!
    @IBOutlet weak var sparklesY: NSLayoutConstraint!
    
    @IBOutlet weak var backgroundEther: UIImageView!
    
    @IBOutlet weak var ivSparklesLoop: UIImageView!
    
    private var tapGestureIvPrimary: UITapGestureRecognizer!
    
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
        
        self.perform(#selector(ViewController.startSparklesLoop), with: nil, afterDelay: 0.5)
    }
    
    @objc func startSparklesLoop() {
        ivSparklesLoop.alpha = 1.0
        ivSparklesLoop.animationImages = sparklesLoopArray
        ivSparklesLoop.animationDuration = 1.5
        ivSparklesLoop.startAnimating()
    }
}

