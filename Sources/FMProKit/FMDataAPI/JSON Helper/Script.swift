//
//  File.swift
//
//
//  Created by Coderly Studio (Francesco De Marco, Gianluca Annina, Giuseppe Carannante) on 28/03/23.
//

import Foundation

// MARK: - ScriptDecoder
public struct ScriptDecoder: Codable {
    let response: ScriptResponse
    let messages: [Message]
}

// MARK: - Response
struct ScriptResponse: Codable {
    let scriptError: String
}
