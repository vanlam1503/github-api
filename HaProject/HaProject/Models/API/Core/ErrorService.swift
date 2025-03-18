//
//  ErrorService.swift
//  HaProject
//
//  Created by Ha on 26/2/25.
//

import Foundation
import UIKit

protocol ErrorServiceProtocol {
    func showError(from viewController: UIViewController, error: NetworkError)
}

final class ErrorService: ErrorServiceProtocol {
    
    static let shared = ErrorService()
    
    init() {}
    
    func showError(from viewController: UIViewController, error: NetworkError) {
        let alert = UIAlertController(title: "Error", message: error.errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController.present(alert, animated: true)
    }
}
