//
//  ViewController.swift
//  TestWorkNetworkCoreData
//
//  Created by Genuine on 2/26/19.
//  Copyright © 2019 Genuine. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return justTestNumbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        
        cell.itemLabel.text = String(justTestNumbers[indexPath.item] )
        print(String(justTestNumbers[indexPath.item] ))
        return cell
    }
    
    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        httpGET()
        // Do any additional setup after loading the view, typically from a nib.
        
    }


}


var justTestNumbers = [1,2,3,4,5,6,7]

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemLabel: UILabel!
    
    @IBOutlet weak var itemImage: UIImageView!
    
}



