//
//  DetailsItemViewController.swift
//  heroTransitions
//
//  Created by Gerges on 24/11/2020.
//

import UIKit
import Hero

class DetailsItemViewController: UIViewController {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var image = UserDefaults.standard.string(forKey: "image")
    var itemName = UserDefaults.standard.string(forKey: "itemName")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemImage.image = UIImage(named: image!)
        nameLabel.text = itemName!
        
        // set hero Ids
        itemImage.heroID = image!
        nameLabel.heroID = itemName!
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        hero_dismissViewController()
    }
    
}
