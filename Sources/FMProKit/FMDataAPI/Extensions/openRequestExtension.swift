//
//  File.swift
//
//
//  Created by Coderly Studio (Francesco De Marco, Gianluca Annina, Giuseppe Carannante) on 15/01/23.
//

import Foundation

public extension FMDataAPI {
    func executeRequest<T: Codable>(request: URLRequest, data: T) async throws -> Data {
        switch request.httpMethod {
        case "POST":
            if request.description.contains("/_find") {
                let query = Query(query: [data])
                do {
                    let encoded = try JSONEncoder().encode(query)
                    let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)

                    try (response as? HTTPURLResponse)?.checkResponseCode()
                    
                    return data
                } catch HTTPError.errorCode401Unauthorized {
                    try await fetchToken()
                    return try await executeRequest(request: request,data: data)
                }
            } else {
                fallthrough
            }
        default:
            let insert = Insert(fieldData: data)
            do {
                let encoded = try JSONEncoder().encode(insert)
                let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)
                
                try (response as? HTTPURLResponse)?.checkResponseCode()
                
                return data
            }catch HTTPError.errorCode401Unauthorized {
                try await fetchToken()
                return try await executeRequest(request: request,data: data)
            }
        }
    }
    
    func executeRequest(request: URLRequest) async throws -> Data {
        switch request.httpMethod {
        case "GET":
            do {
                let (data, response) = try await URLSession.shared.data(for: self.request)
                
                try (response as? HTTPURLResponse)?.checkResponseCode()
                
                return data
                
            } catch HTTPError.errorCode401Unauthorized {
                try await fetchToken()
                return try await executeRequest(request: request)
            }
        case "DELETE":
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                
                try (response as? HTTPURLResponse)?.checkResponseCode()
                
                return data
                
            }catch HTTPError.errorCode401Unauthorized {
                try await fetchToken()
                return try await executeRequest(request: request)
            }
        default:
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                
                try (response as? HTTPURLResponse)?.checkResponseCode()
                return data
            } catch HTTPError.errorCode401Unauthorized {
                try await fetchToken()
                return try await executeRequest(request: request)
            }
        }
    }
}
