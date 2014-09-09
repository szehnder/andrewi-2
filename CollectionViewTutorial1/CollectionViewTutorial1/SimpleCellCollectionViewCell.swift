//
//  SimpleCellCollectionViewCell.swift
//  CollectionViewTutorial1
//
//  Created by Sean Zehnder on 9/9/14.
//  Copyright (c) 2014 Sean Zehnder. All rights reserved.
//

import UIKit

class SimpleCellCollectionViewCell: UICollectionViewCell {

    var label:UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.finalizeInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.finalizeInit()
    }
    
    func finalizeInit() {
        label = UILabel(frame: CGRectMake(0, 0, 30, 30))
        label!.text = "XX"
        label!.textColor = UIColor.whiteColor()
        label!.textAlignment = .Center
        self.addSubview(label!)
        
        //// diagnostic
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.whiteColor().CGColor
//        label!.layer.borderWidth = 1.0
//        label!.layer.borderColor = UIColor.greenColor().CGColor
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label!.frame = CGRectInset(self.bounds, 6, 6)
        
    }
    

}
