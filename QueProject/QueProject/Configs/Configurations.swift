//
//  Configurations.swift
//  QueProject
//
//  Created by TrongQue on 13/2/25.
//

import Foundation

struct APIConfig {
    static var baseURL: String {
        #if DEV
            return "https://api.github.dev.com"
        #elseif STG
            return "https://api.github.stg.com"
        #else
            return "https://api.github.com"
        #endif
    }
}
