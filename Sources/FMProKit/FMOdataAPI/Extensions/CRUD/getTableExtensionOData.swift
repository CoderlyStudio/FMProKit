//
//  File.swift
//
//
//  Created by Coderly Studio (Francesco De Marco, Gianluca Annina, Giuseppe Carannante) on 23/12/22.
//

import SwiftUI

public extension FMODataAPI {
    /// Fetches all the records inside a specific table and it decodes them using a struct/class
    /// - Parameters:
    ///   - table: The name of the table in wich perform the action
    /// - Returns: An array of the generic type used to decode the records
    /// - Throws: an HTTPError.errorCode_404_notFound error when using the wrong table name
    /// - Throws: a FMProErrors.tableNameMissing error when the table parameter is empty
    func getTable<T: Codable>(table: String) async throws -> [T] {
        guard !table.isEmpty else {
            throw FMProErrors.tableNameMissing
        }
        
        return try await executeQueryGet(query: "\(table)")
    }
    
    /// Fetches all the records inside a specific table matching a query and it decodes them using a struct/class
    /// - Parameters:
    ///   - table: The name of the table in wich perform the action
    ///   - query: An OData query used to filter the API call
    /// - Returns: An array of the generic type used to decode the records
    /// - Throws: an HTTPError.errorCode_400_badRequest error when the apex are not used correctly or in general the query is not correct
    /// - Throws: an HTTPError.errorCode_404_notFound error when the table name is not correct
    /// - Throws: a FMProErrors.tableNameMissing error when the table parameter is empty
    /// - Attention: the _?_ after the table name is already inserted
    /// - Attention: when inserting a filter clause write it this way: “$filter= conditions” Specify that condition should be defined this way: “searchedField confrontationOperator value”
    /// - Attention: value is ‘value’ in case of a Text meanwhile value in case of a Number
    func getTable<T: Codable>(table: String, query: String) async throws -> [T] {
        
        guard !table.isEmpty else {
            throw FMProErrors.tableNameMissing
        }
        
        let urlTmp = "\(baseUri)/\(table)?\(query)"
        let data = try await executeRequest(urlTmp: urlTmp, method: .get)
        
        return try decodeJSONArray(data: data)
    }

    /// Fetches all the records inside a specific table matching a filter query and it decodes them using a struct/class
    /// - Parameters:
    ///   - table: The name of the table in wich perform the action
    ///   - field: The field used to filter the table
    ///   - value: The value of the field that need to match in the query
    ///   - filterOption: The filter option for the query
    /// - Returns: An array of the generic type used to decode the records
    /// - Throws: an HTTPError.errorCode_400_badRequest error when the apex are not used correctly or in general the query is not correct, the name of the field is not correct or missing
    /// - Throws: an HTTPError.errorCode_404_notFound error when The name of the table in wich perform the action is wrong
    /// - Throws: a FMProErrors.tableNameMissing error when the table parameter is empty
    func getTable<T: Codable, U>(table: String, field: String, filterOption: FilterOption, value: U) async throws -> [T] {
        guard !table.isEmpty else {
            throw FMProErrors.tableNameMissing
        }
        
        var urlTmp = ""
        if var _ = value as? String {
            urlTmp = "\(baseUri)/\(table)?$filter= \(field) \(filterOption.rawValue) '\(value)'"
        } else {
            urlTmp = "\(baseUri)/\(table)?$filter= \(field) \(filterOption.rawValue) \(value)"
        }
        
        let data = try await executeRequest(urlTmp: urlTmp, method: .get)
        
        return try decodeJSONArray(data: data)
    }
    
    /// Fetches all the records inside a specific table matching an order query and it decodes them using a struct/class
    /// - Parameters:
    ///   - table: The name of the table in wich perform the action
    ///   - fieldName: The name of the field
    ///   - order: The order the field will be returned (desc/asc)
    /// - Returns: An array of the generic type used to decode the records
    /// - Throws: an HTTPError.errorCode_400_badRequest error when the name of the field is not correct or missing
    /// - Throws: an HTTPError.errorCode_404_notFound error when The name of the table in wich perform the action is wrong
    /// - Throws: a FMProErrors.tableNameMissing error when the table parameter is empty
    func getTable<T: Codable>(table: String, fieldName: String, order: Order) async throws -> [T] {
        guard !table.isEmpty else {
            throw FMProErrors.tableNameMissing
        }
        
        let urlTmp = "\(baseUri)/\(table)?$orderby=\(fieldName) \(order.rawValue)"
        let data = try await executeRequest(urlTmp: urlTmp, method: .get)
        
        return try decodeJSONArray(data: data)
    }
}
