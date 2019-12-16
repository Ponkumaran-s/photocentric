//
//  PhotoCenticCollectionViewCell.swift
//  checkphotocentric
//
//  Created by Ponkumar's Mac on 10/12/19.
//  Copyright © 2019 Ponkumar's Mac. All rights reserved.
//

import UIKit

class PhotoCenticCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    @IBOutlet weak var statusHeight: NSLayoutConstraint!
    @IBOutlet weak var titleHeight: NSLayoutConstraint!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var title: UILabel!


func setView(data : DataModel){
    
    self.image.image = data.image
    self.status.text = data.status
    self.title.text  = data.title
}
    
    func setframes(con : Int){
        statusHeight.constant = 20.5 
        titleHeight.constant = 20.5 * CGFloat(con)
     
    }
    
    
}
