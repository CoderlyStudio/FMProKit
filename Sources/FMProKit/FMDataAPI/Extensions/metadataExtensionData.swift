//
//  File.swift
//
//
//  Created by Coderly Studio (Francesco De Marco, Gianluca Annina, Giuseppe Carannante) on 24/12/22.
//

import Foundation

public extension FMDataAPI {
    /// returns all the information related to the product
    /// - Returns: return a ProductInfo object
    func getProductInfo() async throws -> ProductInfo {
        let url = "https://\(hostname)/fmi/data/\(protocolVersion.rawValue)/productinfo"
        
        do {
            let data: Data = try await executeRequest(urlTmp: url, method: .get)
            let fetchedData = try JSONDecoder().decode(ProductInfoMetadata.self, from: data)
            
            return fetchedData.response.productInfo

        } catch HTTPError.errorCode401Unauthorized {
            try await fetchToken()
            return try await getProductInfo()
        }
    }
    
    /// returns all the names of the databases on the server
    /// - Returns: return a Databases object
    func getDBNames() async throws -> [Databases] {
        let url = "https://\(hostname)/fmi/data/\(protocolVersion.rawValue)/databases"

        do {
            let data: Data = try await executeRequest(urlTmp: url, method: .get)
            let fetchedData = try JSONDecoder().decode(DatabasesMetadata.self, from: data)
            
            return fetchedData.response.databases
        } catch HTTPError.errorCode401Unauthorized {
            try await fetchToken()
            return try await getDBNames()
        }
    }
    
    ///  Return a list of all the scripts on the database.
    /// - Parameters:
    /// - database: The name of the database
    /// - Returns: an array of Script object
    func getScripts(database: String) async throws -> [Scripts] {
         let urlTmp = "https://\(hostname)/fmi/data/vLatest/databases/\(database)/scripts"
        
        do {
            let data: Data = try await executeRequest(urlTmp: urlTmp, method: .get)
            let fetchedData = try JSONDecoder().decode(ScrpitsMetaData.self, from: data)
            return fetchedData.response.scripts
        } catch HTTPError.errorCode401Unauthorized {
            try await fetchToken()
            return try await getScripts(database: database)
        }
    }
    
    /// Returns a list of all the layouts inside a database
    /// - Parameters:
    /// - database: The name of the database
    /// - Returns: An array of Layouts object
    func getLayouts(database: String) async throws -> [Layouts] {
        let urlTmp = "https://\(hostname)/fmi/data/vLatest/databases/\(database)/layouts"

        do {
            let data: Data = try await executeRequest(urlTmp: urlTmp, method: .get)
            let fetchedData = try JSONDecoder().decode(LayoutsMetaData.self, from: data)
            
            return fetchedData.response.layouts
        } catch HTTPError.errorCode401Unauthorized {
            try await fetchToken()
            return try await getLayouts(database: database)
        }
    }
}
