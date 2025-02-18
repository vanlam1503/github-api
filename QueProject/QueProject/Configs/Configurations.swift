//
//  Configurations.swift
//  QueProject
//
//  Created by TrongQue on 13/2/25.
//

import Foundation

struct APIConfig {
    static var baseURL: String {
        guard let baseURL = Bundle.main.object(forInfoDictionaryKey: "BaseURL") as? String else {
            fatalError("BaseURL is not set in Info")
        }
        return baseURL
    }
}
