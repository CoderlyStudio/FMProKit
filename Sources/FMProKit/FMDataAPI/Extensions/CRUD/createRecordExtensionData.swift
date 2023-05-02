//
//  File.swift
//
//
//  Created by Coderly Studio (Francesco De Marco, Gianluca Annina, Giuseppe Carannante) on 24/12/22.
//

import Foundation
public extension FMDataAPI {
    /// The function that creates a new element inside a specified table
    /// - Parameters:
    ///   - table: The name of the database table
    ///   - data: The object of generic type that will be pushed into the database
    /// - Throws: a CommonErrors.tableNameMissing error when the table parameter is empty
    /// - Throws: an HTTPError.errorCode_500_internalServerError error when using the wrong table name or when inserting wrong data inside the table
    func createRecord<T: Codable>(table: String, data: T) async throws {
        guard !table.isEmpty else {
            throw FMProErrors.tableNameMissing
        }
        
        let urlTmp = "\(baseUri)/layouts/\(table)/records"
        let insert = Insert(fieldData: data)
        
        do {
            _ = try await executeRequest(urlTmp: urlTmp, method: .post, data: insert)
        } catch HTTPError.errorCode401Unauthorized {
            try await fetchToken()
            try await createRecord(table: table, data: insert)
        }
    }
}
