//
//  CollectionVC.swift
//  APIApp
//
//  Created by Артем Пашевич on 31.08.22.
//

import UIKit

enum StartAction: String, CaseIterable {
    case downlandImage = "Downland Image"
    case users = "Users"
}


class CollectionVC: UICollectionViewController {
    
    private let actions = StartAction.allCases

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        actions.count
    }

    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellStart", for: indexPath) as! StartPageCollectionViewCell
    
        cell.labelStrart.text = actions[indexPath.row].rawValue
    
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let action = actions[indexPath.row]
        switch action {
            case .downlandImage:
                 performSegue(withIdentifier: "ImageVC", sender: nil)
            case .users:
                 performSegue(withIdentifier: "UsersTableVC", sender: nil)
        }
    }

}


extension CollectionVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width - 20
        return CGSize(width: width, height: width / 2)
    }
}
