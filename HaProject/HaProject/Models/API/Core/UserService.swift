//
//  UserService.swift
//  HaProject
//
//  Created by Ha on 15/2/25.
//

import Foundation

protocol UserServiceProtocol {
    func getListUser(completion: @escaping Completion<[User], NetworkError>)
    func getUserDetail(id: Int, completion: @escaping Completion<User, NetworkError>)
}

final class UserService: UserServiceProtocol {
    
    static let shared = UserService()
    private let apiService: APIServiceProtocol
    
    func getListUser(completion: @escaping (Result<[User], NetworkError>) -> Void) {
        apiService.requestAPI(request: .getList, responseType: [User].self, completion: completion)
    }
    
    func getUserDetail(id: Int, completion: @escaping (Result<User, NetworkError>) -> Void) {
        apiService.requestAPI(request: .getDetail(id: id), responseType: User.self, completion: completion)
    }

    init(apiService: APIServiceProtocol = APIService.shared) {
        self.apiService = apiService
    }
}
