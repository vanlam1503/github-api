//
//  Configurations.swift
//  QueProject
//
//  Created by TrongQue on 13/2/25.
//

import Foundation

@propertyWrapper
struct BundleProperty<T> {
    private let key: String
    
    init(key: String) {
        self.key = key
    }
    
    var wrappedValue: T {
        guard let value = Bundle.main.infoDictionary?[key] as? T else {
            fatalError("Key \(key) is not set in Info.plist")
        }
        return value
    }
}

extension Bundle {
    @BundleProperty(key: "BaseURL")
    static var baseURL: String
}

struct APIConfig {
    static var baseURL: String {
        Bundle.baseURL
    }
}
