//
//  File.swift
//
//
//  Created by Coderly Studio (Francesco De Marco, Gianluca Annina, Giuseppe Carannante) on 24/12/22.
//

import Foundation

public extension FMDataAPI {
    /// The function is used to get N record from a starting Offset in the defined table
    /// - Parameters:
    ///   - table: The name of the table where is needed to fetch the rows
    ///   - offset: The starting point from where fetching data
    ///   - numberOfElements: The number of records that should be fetched
    /// - Returns: An array of Model type after fetching all the data
    func getTable<T: Codable>(table: String, offset: Int = 1, numberOfElements: Int = 100) async throws -> [T] {
        if table.isEmpty {
            throw FMProErrors.tableNameMissing
        }
        
        let urlTmp = "\(baseUri)/layouts/\(table)/records?_offset=\(offset)&_limit=\(numberOfElements)"
        do {
            let data = try await executeRequest(urlTmp: urlTmp, method: .get,isData: true)
            let fetchedData = try JSONDecoder().decode(DataModel<T>.self, from: data)
            return fetchedData.response.data.map { $0.fieldData }
        } catch HTTPError.errorCode401Unauthorized {
            try await fetchToken()
            return try await getTable(table: table, offset: offset, numberOfElements: numberOfElements)
        }
    }
}
