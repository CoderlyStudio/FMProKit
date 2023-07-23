//
//  File.swift
//
//
//  Created by Coderly Studio (Francesco De Marco, Gianluca Annina, Giuseppe Carannante) on 23/12/22.
//

import SwiftUI
extension APIProtocol {
    /// Build and execute an HTTPRequest fetching all the data
    /// - Parameters:
    ///   - urlTmp: The final url
    ///   - method: The type of the HTTPMethod
    /// - Returns: returns the data fetched from the HTTP request
    func executeRequest(urlTmp: String, method: HTTPMethod, isData:Bool = false) async throws -> Data {
        guard let url = urlTmp.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let requestURL = URL(string: url) else {
            throw URLError(.badURL)
        }
        
        var request: URLRequest
        request = URLRequest(url: requestURL)
        request.addValue(authData, forHTTPHeaderField: "Authorization")
        request.httpMethod = method.rawValue
        
        self.request = request
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        responseJSON = data
        do {
            try (response as? HTTPURLResponse)?.checkResponseCode()
        } catch HTTPError.errorCode500InternalServerError {
            let messages = try! JSONDecoder().decode(MessagesModel.self, from: data)
            try checkResponseCode(messages: messages.messages)
        }
        
        return data
    }

    /// Build and execute an HTTPRequest fetching all the data
    /// - Parameters:
    ///   - urlTmp: The final url
    ///   - method: The type of the HTTPMethod
    ///   - data: the data converted to JSON file
    /// - Returns: returns the data fetched from the HTTP request
    func executeRequest<T: Codable>(urlTmp: String, method: HTTPMethod, data: T) async throws -> Data {
        guard let url = urlTmp.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let requestURL = URL(string: url) else {
            throw URLError(.badURL)
        }
        
        var request: URLRequest
        request = URLRequest(url: requestURL)
        request.addValue(authData, forHTTPHeaderField: "Authorization")
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        self.request = request
        
        let encoded = try JSONEncoder().encode(data)
        let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)
        
        responseJSON = data
        
        do {
            try (response as? HTTPURLResponse)?.checkResponseCode()
        } catch HTTPError.errorCode500InternalServerError {
            let messages = try! JSONDecoder().decode(MessagesModel.self, from: data)
            try checkResponseCode(messages: messages.messages)
        }

        return data
    }
}
