//
//  PhotoCVC.swift
//  APIApp
//
//  Created by Артем Пашевич on 8.09.22.
//

import UIKit
import SwiftyJSON



class PhotoCVC: UICollectionViewController {
    
    var albumId: Int!
    var photos: [JSON] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = false
        fillCell()
    }

    override func viewWillAppear(_ animated: Bool) {
        let layout = UICollectionViewFlowLayout()
        let sizeWH = UIScreen.main.bounds.width / 2 - 5
        layout.itemSize = CGSize(width: sizeWH, height: sizeWH)
        collectionView.collectionViewLayout = layout
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCVCell", for: indexPath) as! PhotoCVCell
        cell.photo = photos[indexPath.row]
        cell.configureCell()
        cell.getThumbnail()
        return cell
    }

    func fillCell() {
        NetworkService.getPhotos(albumId: albumId) { result, error in
            if let result = result {
                self.photos = JSON(result).arrayValue
                self.collectionView.reloadData()
            }
        }
    }
}
