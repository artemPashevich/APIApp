//
//  AlbumsCollectionVC.swift
//  APIApp
//
//  Created by Артем Пашевич on 7.09.22.
//

import UIKit
import SwiftyJSON

class AlbumsCollectionVC: UICollectionViewController {

    var user: User?
    var alboms: [JSON] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = false
        getAlboms()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        alboms.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCVCell", for: indexPath) as! AlbumCVCell
        cell.configureCell()
        cell.titleLbl.text = alboms[indexPath.row]["title"].stringValue
        return cell
    }

    
    func getAlboms() {
        if let userId = user?.id {
            NetworkService.getAlbums(userId: userId) { result, error in
                if let result = result {
                    self.alboms = JSON(result).arrayValue
                    self.collectionView.reloadData()
                }
            }
        }
    }
   
    override func viewWillAppear(_ animated: Bool) {
        let layout = UICollectionViewFlowLayout()
        let sizeWH = UIScreen.main.bounds.width / 2 - 5
        layout.itemSize = CGSize(width: sizeWH, height: sizeWH)
        collectionView.collectionViewLayout = layout
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PhotoCVC") as! PhotoCVC
        vc.albumId = alboms[indexPath.row]["id"].int
        navigationController?.pushViewController(vc, animated: true)
    }
}
