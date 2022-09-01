//
//  Todos.swift
//  APIApp
//
//  Created by Артем Пашевич on 1.09.22.
//

import Foundation

struct Todo: Codable {
    let userId: Int
    let id: Int
    let title: String?
    let completed: Bool
}
