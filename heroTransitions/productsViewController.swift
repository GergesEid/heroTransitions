//
//  productsViewController.swift
//  heroTransitions
//
//  Created by Gerges on 24/11/2020.
//

import UIKit
import Hero

class productsViewController: UIViewController {
    
    @IBOutlet weak var productsCollectionView: UICollectionView!
    
    var imagesDataArray = ["cheeseImage","coffeeImage","hamborgerImage","strawberryImage"]
    var nameDataArray = ["Cheese","Coffee","Camborger","Strawberry"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
}

extension productsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // UICollection view Delegate & data source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesDataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : productsCollectionViewCell = productsCollectionView.dequeueReusableCell(withReuseIdentifier: "productsCollectionViewCell", for: indexPath) as! productsCollectionViewCell
        
        cell.proImage.image = UIImage(named: imagesDataArray[indexPath.row])
        cell.nameLabel.text = nameDataArray[indexPath.row]
        
        // set hero Ids
        cell.proImage.heroID = imagesDataArray[indexPath.row]
        cell.nameLabel.heroID = nameDataArray[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let size = CGSize(width: (self.productsCollectionView.frame.size.width / 2) - 15, height: 150)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        UserDefaults.standard.setValue(imagesDataArray[indexPath.row], forKey: "image")
        UserDefaults.standard.setValue(nameDataArray[indexPath.row], forKey: "itemName")
        self.performSegue(withIdentifier: "detailsItem", sender: self)
    }
}
