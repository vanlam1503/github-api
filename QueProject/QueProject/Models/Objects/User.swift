//
//  User.swift
//  QueProject
//
//  Created by TrongQue on 15/2/25.
//

import Foundation

struct User: Sendable, Hashable, Codable {
    var avatar: String?
    var name: String?
    var company: String?
    var id: Int?
    var location: String?

    enum CodingKeys: String, CodingKey {
        case avatar = "avatar_url"
        case name
        case company
        case id
        case location
    }
}
