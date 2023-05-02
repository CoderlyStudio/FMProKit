//
//  File.swift
//
//
//  Created by Coderly Studio (Francesco De Marco, Gianluca Annina, Giuseppe Carannante) on 23/12/22.
//

import SwiftUI

public extension FMODataAPI {
    /// Delete the record inside a specific table using its id
    /// - Parameters:
    ///   - table: The name of the table in wich perform the action
    ///   - id: The Primary key (PK) of the searched record
    /// - Throws: an HTTPError.errorCode_404_notFound error when using the wrong table name or the record is missing
    /// - Throws: an HTTPError.errorCode_400_badRequest error when using the wrong data, or model, to update the table
    /// - Throws: a FMProErrors.tableNameMissing error when the table parameter is empty
    /// - Attention: This function is for Text id and not for the Numeric ones
    func deleteRecord(table: String, id: String) async throws {
        guard !table.isEmpty else {
            throw FMProErrors.tableNameMissing
        }
        
        let urlTmp = "\(baseUri)/\(table)('\(id)')"
        
        _ = try await executeRequest(urlTmp: urlTmp, method: .delete)
    }
    
    /// Delete the record inside a specific table using its id
    /// - Parameters:
    ///   - table: The name of the table in wich perform the action
    ///   - id: The Primary key (PK) of the searched record
    /// - Throws: an HTTPError.errorCode_404_notFound error when using the wrong table name or the record is missing
    /// - Throws: an HTTPError.errorCode_400_badRequest error when using the wrong data, or model, to update the table
    /// - Throws: a FMProErrors.tableNameMissing error when the table parameter is empty
    /// - Attention: This function is for UUID id and not for the Number or Text ones
    func deleteRecord(table: String, id: UUID) async throws {
        guard !table.isEmpty else {
            throw FMProErrors.tableNameMissing
        }
        
        let urlTmp = "\(baseUri)/\(table)('\(id.uuidString)')"
        
        _ = try await executeRequest(urlTmp: urlTmp, method: .delete)
    }
 
    /// Delete the record inside a specific table using its id
    /// - Parameters:
    ///   - table: The name of the table in wich perform the action
    ///   - id: The Primary key (PK) of the searched record
    /// - Throws: an HTTPError.errorCode_404_notFound error when using the wrong table name or the record is missing
    /// - Throws: an HTTPError.errorCode_400_badRequest error when using the wrong data, or model, to update the table
    /// - Throws: a FMProErrors.tableNameMissing error when the table parameter is empty
    /// - Attention: This function is for Numeric id and not for the Text ones
    func deleteRecord(table: String, id: Int) async throws {
        
        guard !table.isEmpty else {
            throw FMProErrors.tableNameMissing
        }
        
        let urlTmp = "\(baseUri)/\(table)(\(id))"
        
        _ = try await executeRequest(urlTmp: urlTmp, method: .delete)
    }
    
    /// Delete all the records inside a specific table matching a query
    /// - Parameters:
    ///   - table: The name of the table in wich perform the action
    ///   - query: An OData query used to filter the API call
    /// - Throws: an HTTPError.errorCode_400_badRequest error when the apex are not used correctly or in general the query is not correct
    /// - Throws: an HTTPError.errorCode_404_notFound error when the table name is not correct
    /// - Throws: a FMProErrors.tableNameMissing error when the table parameter is empty
    /// - Attention: the _?_ after the table name is already inserted
    /// - Attention: when inserting a filter clause write it this way: “$filter= conditions” Specify that condition should be defined this way: “searchedField confrontationOperator value”
    /// - Attention: in case of a Text, value must be in write in single quotes like this: ‘value’ , in case of a Number it doesn't need quotes.
    func deleteRecordUsingQuery(table: String, query: String) async throws {
        guard !table.isEmpty else {
            throw FMProErrors.tableNameMissing
        }
        
        let urlTmp = "\(baseUri)/\(table)?\(query)"
        
        _ = try await executeRequest(urlTmp: urlTmp, method: .delete)
    }

    /// Delete all the records inside a specific table matching a filter query
    /// - Parameters:
    ///   - table: The name of the table in wich perform the action
    ///   - field: The field used to filter the table
    ///   - value: The value of the field that need to match in the query
    ///   - filterOption: The filter option for the query
    /// - Throws: an HTTPError.errorCode_400_badRequest error when the apex are not used correctly or in general the query is not correct, the name of the field is not correct or missing
    /// - Throws: an HTTPError.errorCode_404_notFound error when The name of the table in wich perform the action is wrong
    /// - Throws: a FMProErrors.tableNameMissing error when the table parameter is empty
    func deleteRecord<T>(table: String, field: String, filterOption: FilterOption, value: T) async throws {
        guard !table.isEmpty else {
            throw FMProErrors.tableNameMissing
        }
        
        var urlTmp = ""
        if var _ = value as? String {
            urlTmp = "\(baseUri)/\(table)?$filter= \(field) \(filterOption.rawValue) '\(value)'"
        } else {
            urlTmp = "\(baseUri)/\(table)?$filter= \(field) \(filterOption.rawValue) \(value)"
        }
        
        _ = try await executeRequest(urlTmp: urlTmp, method: .delete)
    }
}
