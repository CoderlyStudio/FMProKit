//
//  File.swift
//
//
//  Created by Coderly Studio (Francesco De Marco, Gianluca Annina, Giuseppe Carannante) on 23/12/22.
//

import SwiftUI

public extension FMODataAPI {
    /// The function handles a simple join using the passed table in input based on the id of the record
    /// - Parameters:
    ///   - table: The name of the table where is needed to fetch the rows
    ///   - id: The id of the specified record
    ///   - otherTables: The name of the second table where is needed to fetch the rows
    /// - Returns: An array of Model type after fetching all the data
    func getRelations<T: Codable>(table: String, id: String, otherTables: String...) async throws -> [T] {
        guard !table.isEmpty && !otherTables.isEmpty && !otherTables.first!.isEmpty else {
            throw FMProErrors.tableNameMissing
        }
        
        var urlTmp = "\(baseUri)/\(table)('\(id)')"
        for otherTable in otherTables {
            let otherTableFormatted = otherTable
            urlTmp += "/\(otherTableFormatted)"
        }
        
        let data = try await executeRequest(urlTmp: urlTmp, method: .get)
        return try decodeJSONArray(data: data)
    }
    /// The function handles a simple join using the passed table in input based on the id of the record
    /// - Parameters:
    ///   - table: The name of the table where is needed to fetch the rows
    ///   - id: The id of the specified record
    ///   - otherTables: The name of the second table where is needed to fetch the rows
    /// - Returns: An array of Model type after fetching all the data
    func getRelations<T: Codable>(table: String, id: UUID, otherTables: String...) async throws -> [T] {
        guard !table.isEmpty && !otherTables.isEmpty && !otherTables.first!.isEmpty else {
            throw FMProErrors.tableNameMissing
        }
        
        var urlTmp = "\(baseUri)/\(table)('\(id.uuidString)')"
        for otherTable in otherTables {
            let otherTableFormatted = otherTable
            urlTmp += "/\(otherTableFormatted)"
        }
        
        let data = try await executeRequest(urlTmp: urlTmp, method: .get)
        return try decodeJSONArray(data: data)
    }
    func getRelations<T: Codable>(table: String, id: Int, otherTables: String...) async throws -> [T] {
        guard !table.isEmpty && !otherTables.isEmpty && !otherTables.first!.isEmpty else {
            throw FMProErrors.tableNameMissing
        }
        
        var urlTmp = "\(baseUri)/\(table)(\(id))"
        for otherTable in otherTables {
            let otherTableFormatted = otherTable
            urlTmp += "/\(otherTableFormatted)"
        }
        
        let data = try await executeRequest(urlTmp: urlTmp, method: .get)
        return try decodeJSONArray(data: data)
    }
    /// The function handles a simple join using the passed table in input and a specified query
    /// - Parameters:
    ///   - listOfTables: a list of the names of the tables needed for the crossJoin query
    ///   - fetchedTable: the name of the table used to fetch all the data (must be the one used to decode in the model)
    ///   - query: An OData query used to filter the API call
    /// - Returns: An array of Model type after fetching all the data
    func getTableCrossJoin<T: Codable>(listOfTables: [String], fetchedTable: String, query: String) async throws -> [T] {
        var crossedJoinVariables = ""
        var tmpArray = listOfTables
        crossedJoinVariables.append(tmpArray.removeFirst())
        for table in tmpArray {
            crossedJoinVariables = crossedJoinVariables + "," + table
        }
        let urlTmp = "\(baseUri)/$crossjoin(\(crossedJoinVariables))?$\(query)&$expand=\(fetchedTable)($select=*)"
        
        let data = try await executeRequest(urlTmp: urlTmp, method: .get)
        return try decodeJSONArray(data: data)
    }
    /// The function handles a simple join using the passed table in input and a specified query
    /// - Parameters:
    ///   - listOfTables: a list of the names of the tables needed for the crossJoin query
    ///   - fetchedTable: the name of the table used to fetch all the data (must be the one used to decode in the model)
    /// - Returns: An array of Model type after fetching all the data
    func getTableCrossJoin<T: Codable>(listOfTables: [String], fetchedTable: String) async throws -> [T] {
        var crossedJoinVariables = ""
        var tmpArray = listOfTables
        crossedJoinVariables.append(tmpArray.removeFirst())
        for table in tmpArray {
            crossedJoinVariables = crossedJoinVariables + "," + table
        }
        let urlTmp = "\(baseUri)/$crossjoin(\(crossedJoinVariables))?$$expand=\(fetchedTable)($select=*)"
        
        let data = try await executeRequest(urlTmp: urlTmp, method: .get)
        return try decodeJSONArray(data: data)
    }
}
