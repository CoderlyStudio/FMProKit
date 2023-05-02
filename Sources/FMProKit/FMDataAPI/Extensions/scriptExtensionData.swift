//
//  File.swift
//
//
//  Created by Coderly Studio (Francesco De Marco, Gianluca Annina, Giuseppe Carannante) on 24/12/22.
//

import Foundation
public extension FMDataAPI {
    /// Run a script created on the filemaker database
    /// - Parameters:
    ///   - table: the name of the table
    ///   - scriptName: the name of the script
    func runScript(table: String, scriptName: String) async throws -> ScriptDecoder {
        if table.isEmpty {
            throw FMProErrors.tableNameMissing
        }
        let urlTmp = "\(baseUri)/layouts/\(table)/script/\(scriptName)"
        
        do {
            let data = try await executeRequest(urlTmp: urlTmp, method: .get)
            return try JSONDecoder().decode(ScriptDecoder.self, from: data)
        } catch  HTTPError.errorCode401Unauthorized {
            try await fetchToken()
            return try await runScript(table: table, scriptName: scriptName)
        }
    }
}
