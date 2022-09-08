//
//  NetworkService.swift
//  APIApp
//
//  Created by Артем Пашевич on 6.09.22.
//

import Alamofire
import Foundation
import SwiftyJSON

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
    
    
}
