//
//  File.swift
//
//
//  Created by Coderly Studio (Francesco De Marco, Gianluca Annina, Giuseppe Carannante) on 23/12/22.
//

import SwiftUI

public extension FMODataAPI {
    /// Create a new record inside a specific table
    /// - Parameters:
    ///   - table: The name of the table in wich perform the action
    ///   - data: The generic object that will be inserted in the table
    /// - Throws: a FMProErrors.tableNameMissing error when the table parameter is empty
    /// - Throws: an HTTPError.errorCode_400_badRequest error when using the wrong table name or when inserting wrong data inside the table
    func createRecord<T: Codable>(table: String, data: T) async throws {
        guard !table.isEmpty else {
            throw FMProErrors.tableNameMissing
        }
        
        let urlTmp = "\(baseUri)/\(table)"
        
        _ = try await executeRequest(urlTmp: urlTmp, method: .post, data: data)
    }
}
