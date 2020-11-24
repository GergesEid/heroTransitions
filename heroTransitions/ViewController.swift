//
//  ViewController.swift
//  heroTransitions
//
//  Created by Gerges on 21/11/2020.
//

import UIKit
import Hero

class ViewController: UIViewController {
    
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var redView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heroImage.heroID = "image"
        redView.heroID = "red"
        heroImage.image = UIImage(named: "grill")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func imageButtonAction(_ sender: Any) {
        self.performSegue(withIdentifier: "second", sender: self)
    }
    
}

