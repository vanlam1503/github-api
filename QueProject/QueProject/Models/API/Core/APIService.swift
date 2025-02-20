//
//  APIService.swift
//  QueProject
//
//  Created by TrongQue on 15/2/25.
//

import Foundation
import Alamofire

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

enum APIRequest {
    case getList
    case getDetail(id: Int)
    
    var baseURL: String {
        return APIConfig.baseURL
    }
    
    var path: String {
        switch self {
        case .getList:
            return "/users"
        case .getDetail(let id):
            return "/users/\(id)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getList, .getDetail:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getList, .getDetail:
            return nil
        }
    }
    
    func mapToRequest() -> URLConvertible {
        let urlString = baseURL + path
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL")
        }
        return url
    }
}

enum NetworkError: Error {
    case badRequest
    case badResponse(message: String)
    case failedToDecodeResponse
    case requestFailed(Error)
}

final class APIService {
    static let shared = APIService()
    
    func requestAPI<T: Decodable>(
        request: APIRequest,
        responseType: T.Type
    ) async throws -> T {
        let method = Alamofire.HTTPMethod(rawValue: request.method.rawValue)
        let url = request.mapToRequest()
        let parameters = request.parameters
        
        let (data, response) = try await performRequest(url: url, method: method, parameters: parameters)
        try validateResponse(response, data: data)
        
        return try decodeData(data: data, to: T.self)
    }
    
    private func performRequest(
        url: URLConvertible,
        method: Alamofire.HTTPMethod,
        parameters: [String: Any]?
    ) async throws -> (Data, HTTPURLResponse) {
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(url, method: method, parameters: parameters).validate().responseData { response in
                switch response.result {
                case .success(let data):
                    if let httpResponse = response.response {
                        continuation.resume(returning: (data, httpResponse))
                    } else {
                        continuation.resume(throwing: NetworkError.badRequest)
                    }
                case .failure(let error):
                    continuation.resume(throwing: NetworkError.requestFailed(error))
                }
            }
        }
    }
    
    private func validateResponse(_ response: HTTPURLResponse, data: Data) throws {
        print(response.statusCode)
        guard (200...299).contains(response.statusCode) else {
            if let errorResponse = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
               let message = errorResponse["message"] as? String {
                throw NetworkError.badResponse(message: message)
            }
            throw NetworkError.badResponse(message: "Unknown error")
        }
    }
    
    private func decodeData<T: Decodable>(data: Data, to type: T.Type) throws -> T {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkError.failedToDecodeResponse
        }
    }
}
