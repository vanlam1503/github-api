//
//  ListOfUserViewModel.swift
//  HaProject
//
//  Created by Ha on 26/2/25.
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
        userService.getListUser { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let users):
                    self.users = users
                    completion(.success)
                case .failure(let error):
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
