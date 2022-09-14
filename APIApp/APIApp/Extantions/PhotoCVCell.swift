//
//  PhotoCVCell.swift
//  APIApp
//
//  Created by Артем Пашевич on 8.09.22.
//

import UIKit
import SwiftyJSON
import Alamofire
import AlamofireImage

class PhotoCVCell: UICollectionViewCell {
    
    @IBOutlet weak var imageCell: UIImageView!
    
    var photo: JSON!
    
    func configureCell() {
        imageCell.image = #imageLiteral(resourceName: "default-placeholder")
    }
    
    func getThumbnail() {
        if let thumbnailURL = photo["thumbnailUrl"].string {
            AF.request(thumbnailURL).responseImage { [weak self] response in
                if case .success(let image) = response.result {
                    self?.imageCell.image = image
                }
        }
    }
        
    }
    
}
