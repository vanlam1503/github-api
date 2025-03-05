//
//  APIService.swift
//  QueProject
//
//  Created by TrongQue on 15/2/25.
//

import Foundation
import Alamofire

protocol APIServiceProtocol {
    func requestAPI<T: Decodable>(request: APIRequest, responseType: T.Type) async throws -> T
}

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
    
    func makeRequestURL() -> URLConvertible {
        let urlString = baseURL + path
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL")
        }
        return url
    }
}

enum NetworkError: Error {
    case unknowError
    case errorFromSever(statusCode: Int, message: String)
    case badResponse
    case failedToDecodeResponse
    case requestFailed(Error)
    case severError(statusCode: Int)
    case noInternetConnection
    case timeout
    
    var errorMessage: String {
        switch self {
        case .errorFromSever(let statusCode, let message):
            return "Status Code: \(statusCode) \n \(message)"
        case .severError(let statusCode):
            return "Status Code: \(statusCode) \n Server Error"
        case .failedToDecodeResponse:
            return "Failed to decode response"
        case .badResponse:
            return "Bad response"
        case .requestFailed(let error):
            return error.localizedDescription
        case .noInternetConnection:
            return "No internet connection"
        case .timeout:
            return "Request timeout"
        default:
            return "Unknown Error"
        }
    }
}

final class APIService: APIServiceProtocol {
    
    static let shared = APIService()
    
    init() {}
    
    func requestAPI<T: Decodable>(
        request: APIRequest,
        responseType: T.Type
    ) async throws -> T {
        let method = Alamofire.HTTPMethod(rawValue: request.method.rawValue)
        let url = request.makeRequestURL()
        let parameters = request.parameters
        
        let (data, _) = try await performRequest(url: url, method: method, parameters: parameters)
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
                        do {
                            try self.validateResponse(httpResponse, data: data)
                            continuation.resume(returning: (data, httpResponse))
                        } catch {
                            continuation.resume(throwing: NetworkError.badResponse)
                        }
                    } else {
                        continuation.resume(throwing: NetworkError.badResponse)
                    }
                case .failure(let error):
                    let networkError = self.handleNetworkError(error: error)
                    continuation.resume(throwing: networkError)
                }
            }
        }
    }
    
    private func validateResponse(_ response: HTTPURLResponse, data: Data) throws {
        let statusCode = response.statusCode
        switch statusCode {
        case 200...299: return
        case 500...599:
            throw NetworkError.severError(statusCode: statusCode)
        default:
            var serverMessage: String {
                if let errorResponse = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                let message = errorResponse["message"] as? String {
                    return message
                }
                return "Unknown error"
            }
            throw NetworkError.errorFromSever(statusCode: statusCode, message: serverMessage)
        }
    }
    
    private func handleNetworkError(error: AFError) -> NetworkError {
        if let urlError = error.underlyingError as? URLError {
            print("URLError code:", urlError.code.rawValue)
            switch urlError.code {
            case .notConnectedToInternet:
                return .noInternetConnection
            case .timedOut:
                return .timeout
            default:
                return .requestFailed(error)
            }
        }
        return .requestFailed(error)
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
