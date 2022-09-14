//
//  AlbumCVCell.swift
//  APIApp
//
//  Created by Артем Пашевич on 7.09.22.
//

import UIKit

class AlbumCVCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
        
    func configureCell() {
        imageCell.image = #imageLiteral(resourceName: "images")
    }
    
}
