//
//  ViewController.swift
//  CollectionViewTutorial1
//
//  Created by Sean Zehnder on 9/9/14.
//  Copyright (c) 2014 Sean Zehnder. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    let keys = ["A", "B", "C"]
    let items:Dictionary<String,AnyObject> = ["A":[1, 2, 3], "B":[2.1, 2.2, 2.3], "C":[3.1,3.2,3.3]]
    
    let cellIdentifier = "cellIdentifier"
    var myLayout:UICollectionViewFlowLayout?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.collectionView!.registerClass(SimpleCellCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        
        myLayout = UICollectionViewFlowLayout()
        myLayout!.minimumInteritemSpacing = 2.0
//        myLayout!.minimumLineSpacing = 12.0
        myLayout!.sectionInset = UIEdgeInsetsMake(2, 0, 2, 0)
//        myLayout!.scrollDirection = .Horizontal
        myLayout!.itemSize = CGSizeMake(80, 80)

        self.collectionView.collectionViewLayout = myLayout!
        
        //// diagnostic
        self.collectionView.layer.borderColor = UIColor.yellowColor().CGColor
        self.collectionView.layer.borderWidth = 1.0
    }


    // MARK: UICollectionViewDataSource Methods
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let keys = items.keys.array as [String]
        let key = keys[section]
        let dict = items as NSDictionary
        let arr = dict.valueForKey(key) as NSArray
        return arr.count
    }
    
    func getArrayForIndexPath(path:NSIndexPath) -> NSArray {
        let key = keys[path.section]
        let dict = items as NSDictionary
        let arr = dict.valueForKey(key) as NSArray
        return arr
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = self.collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as SimpleCellCollectionViewCell
        
        let arr = getArrayForIndexPath(indexPath)
        
        cell.label!.text = "\(arr.objectAtIndex(indexPath.row))"
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return keys.count
    }
    
    // MARK: UICollectionViewDelegate Methods
    
    
}

