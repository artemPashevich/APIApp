//
//  ImageVC.swift
//  APIApp
//
//  Created by Артем Пашевич on 31.08.22.
//

import UIKit

class ImageVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
        
    private let imageUrl = "https://co10.nevseoboi.com.ua/posts/2012-03/1331721144-1269760-0053456_www.nevseoboi.com.ua.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getImage()
    }
    
    func getImage() {
        
        guard let url = URL(string: imageUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print(error)
                    // alert
                }
                if let data = data {
                    self?.imageView.image = UIImage(data: data)
                }
            }
        }.resume()
    }
  

}
