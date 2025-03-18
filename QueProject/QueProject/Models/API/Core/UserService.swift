//
//  UserService.swift
//  QueProject
//
//  Created by TrongQue on 15/2/25.
//

import Foundation

protocol UserServiceProtocol {
    func getListUser() async throws -> [User]
    func getUserDetail(id: Int) async throws -> User
}

final class UserService: UserServiceProtocol {
    
    static let shared = UserService()
    private let apiService: APIServiceProtocol
    
    init(apiService: APIServiceProtocol = APIService.shared) {
        self.apiService = apiService
    }
    
    func getListUser() async throws -> [User] {
        return try await apiService.requestAPI(request: .getList, responseType: [User].self)
    }
    
    func getUserDetail(id: Int) async throws -> User {
        return try await apiService.requestAPI(request: .getDetail(id: id), responseType: User.self)
    }
}
