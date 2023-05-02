//
//  File.swift
//
//
//  Created by Coderly Studio (Francesco De Marco, Gianluca Annina, Giuseppe Carannante) on 23/12/22.
//

import SwiftUI

public extension FMODataAPI {
    /// Return all the Metadata saved inside the database as Data. The data are encoded as an XML file
    /// - Returns: the encoded XML file
    func getMetadataAsData() async throws -> Data {
        let urlTmp = "\(baseUri)/$metadata"
        let data = try await executeRequest(urlTmp: urlTmp, method: .get)
        
        return data
    }
    
    /// Return all the Metadata saved inside the database as String
    /// - Returns: the XML file as a string
    func getMetadataAsString() async throws -> String? {
        let urlTmp = "\(baseUri)/$metadata"
        let data = try await executeRequest(urlTmp: urlTmp, method: .get)
        
        return String(data: data, encoding: String.Encoding.utf8)
    }

    /// Returns an array of TableValue that contains all the informations of all the tables inside the database
    /// - Returns: Returns an array of TableValue that contains all the informations of all the tables inside the database
    func getListOfTables() async throws -> [TableValue] {
        let urlTmp = "\(baseUri)"
        let data = try await executeRequest(urlTmp: urlTmp, method: .get)
        
        return try decodeJSONArray(data: data)
    }
}
