//
//  File.swift
//
//
//  Created Coderly Studio (Francesco De Marco, Gianluca Annina, Giuseppe Carannante) on 23/12/22.
//

import SwiftUI

public extension FMODataAPI {
    /// Run a script created on the filemaker database
    /// - Parameters:
    ///   - scriptName: the name of the script
    ///   - scriptParameterValue: a generic value passed to the script that can be a String, a Numeric or an object
    func runScript<T: Codable>(scriptName: String, scriptParameterValue: T?) async throws -> ScriptResult {
        let urlTmp = "\(baseUri)/Script.\(scriptName)"
        
        if scriptParameterValue == nil {
            let data = try await executeRequest(urlTmp: urlTmp, method: .post)
            let fetchedData = try JSONDecoder().decode(Scripter.self, from: data)
            return fetchedData.scriptResult
        } else {
            let data = try await executeRequest(urlTmp: urlTmp, method: .post, data: ScriptCaller(scriptParameterValue: scriptParameterValue))
            let fetchedData = try JSONDecoder().decode(Scripter.self, from: data)
            return fetchedData.scriptResult
        }
    }
}
