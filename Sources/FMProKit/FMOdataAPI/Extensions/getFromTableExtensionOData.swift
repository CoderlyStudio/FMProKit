//
//  File.swift
//
//
//  Created by Coderly Studio (Francesco De Marco, Gianluca Annina, Giuseppe Carannante) on 23/12/22.
//

import SwiftUI

public extension FMODataAPI {
    /// Fetches the first N records inside a specific table and it decodes them using a struct/class
    /// - Parameters:
    ///   - table: The name of the table in wich perform the action
    ///   - number: The number of element
    /// - Returns: An array of the generic type used to decode the records
    /// - Throws: an HTTPError.errorCode_404_notFound error when using the wrong table name
    /// - Throws: a FMProErrors.tableNameMissing error when the table parameter is empty
    /// - Throws: a FMProErrors.negativeNumber error when the number parameter is a negative number
    func getTopTable<T: Codable>(table: String, number: Int) async throws -> [T] {
        
        guard !table.isEmpty else {
            throw FMProErrors.tableNameMissing
        }
        guard number >= 0 else {
            throw FMProErrors.negativeNumber
        }
        
        let urlTmp = "\(baseUri)/\(table)?$top=\(number)"
        let data = try await executeRequest(urlTmp: urlTmp, method: .get)
        
        return try decodeJSONArray(data: data)
    }
    
    /// Fetches all the records except the first N records inside a specific table and it decodes them using a struct/class
    /// - Parameters:
    ///   - table: The name of the table in wich perform the action where is needed to fetch the rows
    ///   - number: The number of element wanted to skip
    /// - Returns: An array of Model type after fetching all the data
    /// - Returns: An array of the generic type used to decode the records
    /// - Throws: an HTTPError.errorCode_404_notFound error when using the wrong table name
    /// - Throws: a FMProErrors.tableNameMissing error when the table parameter is empty
    /// - Throws: a FMProErrors.negativeNumber error when the number parameter is a negative number
    func getSkipTable<T: Codable>(table: String, number: Int) async throws -> [T] {
        
        guard !table.isEmpty else {
            throw FMProErrors.tableNameMissing
        }
        guard number >= 0 else {
            throw FMProErrors.negativeNumber
        }
        
        let urlTmp = "\(baseUri)/\(table)?$skip=\(number)"
        let data = try await executeRequest(urlTmp: urlTmp, method: .get)
        
        return try decodeJSONArray(data: data)
    }
    
    ///  Fetch a record using its id and it decodes it using a struct/class
    /// - Parameters:
    ///   - table: The name of the table in wich perform the action
    ///   - id: The Primary key (PK) of the searched record
    /// - Returns: return a single object of the generic type used to decode the records
    /// - Throws: an HTTPError.errorCode_404_notFound error when using the wrong table name or the recordId doesn't exist
    /// - Throws: a FMProErrors.tableNameMissing error when the table parameter is empty
    func getRecord<T: Codable>(table: String, id: String) async throws -> T {
        
        guard !table.isEmpty else {
            throw FMProErrors.tableNameMissing
        }
        
        let urlTmp = "\(baseUri)/\(table)('\(id)')"
        let data = try await executeRequest(urlTmp: urlTmp, method: .get)
        
        return try decodeJSONSingleValue(data: data)
    }
    
    ///  Fetch a record using its id and it decodes it using a struct/class
    /// - Parameters:
    ///   - table: The name of the table in wich perform the action
    ///   - id: The Primary key (PK) of the searched record
    /// - Returns: return a single object of the generic type used to decode the records
    /// - Throws: an HTTPError.errorCode_404_notFound error when using the wrong table name or the recordId doesn't exist
    /// - Throws: a FMProErrors.tableNameMissing error when the table parameter is empty
    func getRecord<T: Codable>(table: String, id: UUID) async throws -> T {
        
        guard !table.isEmpty else {
            throw FMProErrors.tableNameMissing
        }
        
        let urlTmp = "\(baseUri)/\(table)('\(id.uuidString)')"
        let data = try await executeRequest(urlTmp: urlTmp, method: .get)
        
        return try decodeJSONSingleValue(data: data)
    }
    
    ///  Fetch a record using its id and it decodes it using a struct/class
    /// - Parameters:
    ///   - table: The name of the table in wich perform the action
    ///   - id: The Primary key (PK) of the searched record
    /// - Returns: return a single object of the generic type used to decode the records
    /// - Throws: an HTTPError.errorCode_404_notFound error when using the wrong table name or the recordId doesn't exist
    /// - Throws: a FMProErrors.tableNameMissing error when the table parameter is empty
    func getRecord<T: Codable>(table: String, id: Int) async throws -> T {
        
        guard !table.isEmpty else {
            throw FMProErrors.tableNameMissing
        }
        
        let urlTmp = "\(baseUri)/\(table)(\(id))"
        let data = try await executeRequest(urlTmp: urlTmp, method: .get)
        
        return try decodeJSONSingleValue(data: data)
    }
        
    /// Retrieves the number of element inside a table
    /// - Parameter table: The name of the table in wich perform the action
    /// - Returns: The number of elements inside the table
    /// - Throws: an HTTPError.errorCode_404_notFound error when using the wrong table name
    /// - Throws: a FMProErrors.tableNameMissing error when the table parameter is empty
    func getTableCount(table: String) async throws -> Int {
        guard !table.isEmpty else {
            throw FMProErrors.tableNameMissing
        }
        
        let urlTmp = "\(baseUri)/\(table)/$count"
        let data = try await executeRequest(urlTmp: urlTmp, method: .get)
        
        return try JSONDecoder().decode(Int.self, from: data)
    }

    /// Retrieves the value of a field of a specific record
    /// - Parameters:
    ///   - table: The name of the table in wich perform the action
    ///   - id: The Primary key (PK) of the searched record
    ///   - field: The name of the field
    /// - Returns: return a single object of the generic type used to decode the records
    /// - Throws: an HTTPError.errorCode_404_notFound error when using the wrong table name, the wrong field name or the recordId doesn't exist
    /// - Throws: a FMProErrors.tableNameMissing error when the table parameter is empty
    func getField<T: Codable>(table: String, id: String, field: String) async throws -> T {
        guard !table.isEmpty else {
            throw FMProErrors.tableNameMissing
        }
        guard !field.isEmpty else {
            throw FMProErrors.fieldNameMissing
        }
        
        let urlTmp = "\(baseUri)/\(table)('\(id)')/\(field)"
        let data = try await executeRequest(urlTmp: urlTmp, method: .get)
        
        return try decodeJSONSingleValue(data: data)
    }
    
    /// Retrieves the value of a field of a specific record
    /// - Parameters:
    ///   - table: The name of the table in wich perform the action
    ///   - id: The Primary key (PK) of the searched record
    ///   - field: The name of the field
    /// - Returns: return a single object of the generic type used to decode the records
    /// - Throws: an HTTPError.errorCode_404_notFound error when using the wrong table name, the wrong field name or the recordId doesn't exist
    /// - Throws: a FMProErrors.tableNameMissing error when the table parameter is empty
    func getField<T: Codable>(table: String, id: UUID, field: String) async throws -> T {
        guard !table.isEmpty else {
            throw FMProErrors.tableNameMissing
        }
        
        guard !field.isEmpty else {
            throw FMProErrors.fieldNameMissing
        }
        
        let urlTmp = "\(baseUri)/\(table)('\(id.uuidString)')/\(field)"
        let data = try await executeRequest(urlTmp: urlTmp, method: .get)
        
        return try decodeJSONSingleValue(data: data)
    }
    
    /// Retrieves the value of a field of a specific record
    /// - Parameters:
    ///   - table: The name of the table in wich perform the action
    ///   - id: The Primary key (PK) of the searched record
    ///   - field: The name of the field
    /// - Returns: return a single object of the generic type used to decode the records
    /// - Throws: an HTTPError.errorCode_404_notFound error when using the wrong table name, the wrong field name or the recordId doesn't exist
    /// - Throws: a FMProErrors.tableNameMissing error when the table parameter is empty
    func getField<T: Codable>(table: String, id: Int, field: String) async throws -> T {
        guard !table.isEmpty else {
            throw FMProErrors.tableNameMissing
        }
        
        guard !field.isEmpty else {
            throw FMProErrors.fieldNameMissing
        }
        
        let urlTmp = "\(baseUri)/\(table)(\(id))/\(field)"
        let data = try await executeRequest(urlTmp: urlTmp, method: .get)
        
        return try decodeJSONSingleValue(data: data)
    }
   
    /// Retrieves the value of a field of a specific record as a binary Data
    /// - Parameters:
    ///   - table: The name of the table in wich perform the action
    ///   - id: The Primary key (PK) of the searched record
    ///   - field: The name of the field
    /// - Returns: return a single object of type Data
    /// - Throws: an HTTPError.errorCode_404_notFound error when using the wrong table name, the wrong field name or the recordId doesn't exist
    /// - Throws: a FMProErrors.tableNameMissing error when the table parameter is empty
    func getBinaryField(table: String, id: String, field: String) async throws -> Data {
        guard !table.isEmpty else {
            throw FMProErrors.tableNameMissing
        }
        
        guard !field.isEmpty else {
            throw FMProErrors.fieldNameMissing
        }
        
        let urlTmp = "\(baseUri)/\(table)('\(id)')/\(field)/$value"
        
        return try await executeRequest(urlTmp: urlTmp, method: .get)
    }
    
    /// Retrieves the value of a field of a specific record as a binary Data
    /// - Parameters:
    ///   - table: The name of the table in wich perform the action
    ///   - id: The Primary key (PK) of the searched record
    ///   - field: The name of the field
    /// - Returns: return a single object of type Data
    /// - Throws: an HTTPError.errorCode_404_notFound error when using the wrong table name, the wrong field name or the recordId doesn't exist
    /// - Throws: a FMProErrors.tableNameMissing error when the table parameter is empty
    func getBinaryField(table: String, id: UUID, field: String) async throws -> Data {
        guard !table.isEmpty else {
            throw FMProErrors.tableNameMissing
        }
        
        guard !field.isEmpty else {
            throw FMProErrors.fieldNameMissing
        }
        
        let urlTmp = "\(baseUri)/\(table)('\(id.uuidString)')/\(field)/$value"
        
        return try await executeRequest(urlTmp: urlTmp, method: .get)
    }
    
    /// Retrieves the value of a field of a specific record as a binary Data
    /// - Parameters:
    ///   - table: The name of the table in wich perform the action
    ///   - id: The Primary key (PK) of the searched record
    ///   - field: The name of the field
    /// - Returns: return a single object of type Data
    /// - Throws: an HTTPError.errorCode_404_notFound error when using the wrong table name, the wrong field name or the recordId doesn't exist
    /// - Throws: a FMProErrors.tableNameMissing error when the table parameter is empty
    func getBinaryField(table: String, id: Int, field: String) async throws -> Data {
        guard !table.isEmpty else {
            throw FMProErrors.tableNameMissing
        }

        guard !field.isEmpty else {
            throw FMProErrors.fieldNameMissing
        }
        
        let urlTmp = "\(baseUri)/\(table)(\(id))/\(field)/$value"
        
        return try await executeRequest(urlTmp: urlTmp, method: .get)
    }
}
