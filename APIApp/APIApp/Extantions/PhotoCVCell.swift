//
//  PhotoCVCell.swift
//  APIApp
//
//  Created by Артем Пашевич on 8.09.22.
//

import UIKit

class PhotoCVCell: UICollectionViewCell {
    
    @IBOutlet weak var imageCell: UIImageView!
    
    func configureCell() {
        imageCell.image = #imageLiteral(resourceName: "default-placeholder")
    }
    
    func getThumbnail() {
        
        
    }
    
}
