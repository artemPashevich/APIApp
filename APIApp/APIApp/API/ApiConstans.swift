//
//  ApiConstans.swift
//  APIApp
//
//  Created by Артем Пашевич on 4.09.22.
//

import Foundation

class ApiConstants {
    
    static let serverPath = "http://localhost:3000/"
    
    static let postsPath = serverPath + "posts"
    static let postsPathURL = URL(string: postsPath)
    
    static let commentsPath = serverPath + "comments"
    static let commentsPathURL = URL(string: commentsPath)
    
    static let todosPath = serverPath + "todos"
    
}
