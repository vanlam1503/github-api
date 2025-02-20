//
//  UserService.swift
//  QueProject
//
//  Created by TrongQue on 15/2/25.
//

import Foundation

final class UserService {
    
    static let shared = UserService()
    
    func getListUser() async throws -> [User] {
        return try await APIService.shared.requestAPI(request: .getList, responseType: [User].self)
    }
    
    func getUserDetail(id: Int) async throws -> User {
        return try await APIService.shared.requestAPI(request: .getDetail(id: id), responseType: User.self)
    }
}
