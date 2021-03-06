//
//  ViewController2.swift
//  heroTransitions
//
//  Created by Gerges on 21/11/2020.
//

import UIKit
import Hero

class ViewController2: UIViewController {
    
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var redButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondImage.heroID = "image"
        redButton.heroID = "red"
        secondImage.image = UIImage(named: "grill")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        hero_dismissViewController()
    }
    
    @IBAction func handlePan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: nil)
        let progress = translation.y / 2 / view.bounds.height
        switch sender.state {
        case .began:
            hero_dismissViewController()
        case .changed:
            Hero.shared.update(progress)
            let currentPosition = CGPoint(x: translation.x + secondImage.center.x, y: translation.y + secondImage.center.y)
            Hero.shared.apply(modifiers: [.position(currentPosition)], to: secondImage)
        default:
            // to dismiss for up and down direction
            Hero.shared.finish()
            // to dismiss for down direction only, must uncomment this if statement
//            if progress > 0.1 {
//                Hero.shared.finish()
//            } else {
//                Hero.shared.cancel()
//            }
        }
    }
    
}
