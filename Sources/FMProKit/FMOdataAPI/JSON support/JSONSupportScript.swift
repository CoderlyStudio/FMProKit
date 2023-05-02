//
//  File.swift
//
//
//  Created by Coderly Studio (Francesco De Marco, Gianluca Annina, Giuseppe Carannante) on 05/12/22.
//

import Foundation

// MARK: - ScriptCaller
struct ScriptCaller<T: Codable>: Codable {
    let scriptParameterValue: T
}

// MARK: - ScriptResult
struct Scripter: Codable {
    let scriptResult: ScriptResult
}

// MARK: - ScriptResult
/// The result of the call of a script using API
/// The code indicates the status of the call
/// The resultParametere returns the value returned by the script if any
/// The message explains the error if any occured
public struct ScriptResult: Codable {
    let code: Int?
    let resultParameter: String?
    let message: String?
}
