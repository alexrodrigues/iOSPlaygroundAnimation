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
    
    @IBOutlet weak var ivCoverPrimary: UIImageView!
    @IBOutlet weak var ivCoverPrimaryFire: UIImageView!
    
    @IBOutlet weak var vContainerSecondMoment: UIView!
    
    private var tapGestureIvPrimary: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setupGestures()
        self.perform(#selector(ViewController.hideFirstMoment), with: nil, afterDelay: 2.0)
    }
    
    private func setupGestures() {
        tapGestureIvPrimary = UITapGestureRecognizer(target: self, action: #selector(ViewController.didTappedIvPrimary))
        tapGestureIvPrimary.numberOfTapsRequired = 1
        ivCoverPrimary.isUserInteractionEnabled = true
        ivCoverPrimary.addGestureRecognizer(tapGestureIvPrimary)
    }
    
    @objc func didTappedIvPrimary() {
        ivCoverPrimaryFire.alpha = 1.0
        ivCoverPrimaryFire.animationDuration = 1.5
        ivCoverPrimaryFire.animationImages = coverFormationArray
        ivCoverPrimaryFire.startAnimating()
    }
    
    @objc func hideFirstMoment() {
        UIView.animate(withDuration: 0.4, animations: {
            self.ivCoverPrimary.alpha = 0.0
            self.ivCoverPrimaryFire.alpha = 0.0
            self.vContainerSecondMoment.alpha = 1.0
        }) { (finished) in
            if (finished) {
                self.startCoverSecondMomementFireLoop()
            }
        }
    }
    
    @objc func startCoverSecondMomementFireLoop() {
        
    }
}

