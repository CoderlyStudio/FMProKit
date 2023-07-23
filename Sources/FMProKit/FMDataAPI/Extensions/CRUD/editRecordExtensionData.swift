//
//  File.swift
//
//
//  Created by Coderly Studio (Francesco De Marco, Gianluca Annina, Giuseppe Carannante) on 24/12/22.
//

import Foundation

public extension FMDataAPI {
    /// The function is used to filter records and edit the ones that match the condition
    /// - Parameters:
    ///   - table: The name of the table where we want to edit the data
    ///   - findData: The data matching the record to change in the database
    ///   - editData: The new data to overwrite
    /// - Throws: a CommonErrors.tableNameMissing error when the table parameter is empty
    /// - Throws: an HTTPError.errorCode_500_internalServerError error when using the wrong table name or when inserting wrong data inside the table
    func editRecord<T: Codable>(table: String, findData: T, editData: T) async throws {
        if table.isEmpty {
            throw FMProErrors.tableNameMissing
        }
        
        let recordToEdit = try await findRecordIds(table: table, data: findData)
        
        for edit in recordToEdit {
            let url = "\(baseUri)/layouts/\(table)/records/\(edit)"
            let insert = Insert(fieldData: editData)
            
            do {
                let data = try await executeRequest(urlTmp: url, method: .patch, data: insert)
                let _ = try JSONDecoder().decode(FMErrorSupport.self, from: data)
                
            } catch HTTPError.errorCode401Unauthorized {
                try await fetchToken()
                try await editRecord(table: table, findData: findData, editData: editData)
            }
        }
    }
}
