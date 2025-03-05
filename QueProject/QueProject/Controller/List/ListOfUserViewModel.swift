//
//  ListOfUserViewModel.swift
//  QueProject
//
//  Created by TrongQue on 26/2/25.
//

import Foundation

enum APIResult {
    case success
    case failure(NetworkError)
}

final class ListOfUserViewModel {
    
    private let userService: UserServiceProtocol
    let errorService: ErrorServiceProtocol
    var users: [User] = []
    
    init(userService: UserServiceProtocol = UserService.shared,
         errorService: ErrorServiceProtocol = ErrorService.shared) {
        self.userService = userService
        self.errorService = errorService
    }
    
    func fetchUsers(completion: @escaping (APIResult) -> Void) {
        Task {
            do {
                users = try await userService.getListUser()
                DispatchQueue.main.async {
                    completion(.success)
                }
            } catch let error as NetworkError {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    func numberOfitems() -> Int {
        return users.count
    }
    
    func getUserAvatarString(at index: Int) -> String {
        guard index < users.count else { return "" }
        return users[index].avatar ?? ""
    }
}
