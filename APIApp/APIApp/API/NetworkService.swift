//
//  NetworkService.swift
//  APIApp
//
//  Created by Артем Пашевич on 6.09.22.
//

import Alamofire
import Foundation
import SwiftyJSON
import AlamofireImage

class NetworkService {
    
    static func deletePost(postID: Int, callback: @escaping (_ result: JSON?, _ error: Error?) -> Void) {
        let url = ApiConstants.postsPath + "/" + "\(postID)"
        
        AF.request(url, method: .delete, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                var jsonValue: JSON?
                var err: Error?
                
                switch response.result {
                    case .success(let data):
                        jsonValue = JSON(data)
                    case .failure(let error):
                        err = error
                }
                callback(jsonValue, err)
            }
    }
    
    static func getPost(userId: Int, callback: @escaping (_ result: JSON?, _ error: Error?) -> Void) {
        let url = ApiConstants.postsPath + "?userId=" + "\(userId)"
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                var jsonValue: JSON?
                var err: Error?
                
                switch response.result {
                    case .success(let data):
                        jsonValue = JSON(data)
                    case .failure(let error):
                        err = error
                }
                callback(jsonValue, err)
            }
        
    }
    
    static func getAlbums(userId: Int, callback: @escaping (_ result: JSON?, _ error: Error?) -> Void) {
        let url = ApiConstants.albumsPath + "?userId=" + "\(userId)"
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                var jsonValue: JSON?
                var err: Error?
                
                switch response.result {
                    case .success(let data):
                        jsonValue = JSON(data)
                    case .failure(let error):
                        err = error
                }
                callback(jsonValue, err)
            }
    }
    
    
    static func getPhotos(albumId: Int, callback: @escaping (_ result: JSON?, _ error: Error?) -> Void) {
        
        let url = ApiConstants.photosPath + "?albumId=" + "\(albumId)"
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                var jsonValue: JSON?
                var err: Error?
                
                switch response.result {
                    case .success(let data):
                        jsonValue = JSON(data)
                    case .failure(let error):
                        err = error
                }
                callback(jsonValue, err)
            }
    }
    
    
    static func getImage(imageUrl: String) -> Data? {
        
        guard let url = URL(string: imageUrl) else { return nil }
        var dataForImage: Data?
        
        URLSession.shared.dataTask(with: url) { data, _, error  in
            DispatchQueue.main.async {
                if let error = error {
                    print(error)
                    // alert
                }
                
                if let data = data {
                    dataForImage = data
                }
            }
        }.resume()
        
        return dataForImage
    }
    
    static func addPost(userId: Int, title: String, text: String,  callback: @escaping (_ result: JSON?, _ error: Error?) -> Void) {
        
        let url = ApiConstants.postsPath // + "?userId=" + "\(userId)"
        
        let parameters: Parameters = ["userId": userId,
                                      "title": title,
                                      "body": text]
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                var jsonValue: JSON?
                var err: Error?
//                print(response.request)
//                print(response.response)
                
                switch response.result {
                    case .success(let data):
                     jsonValue = JSON(data)
                    case .failure(let error):
                        err = error
                }
                callback(jsonValue, err)
            }
        
    }
    
}
