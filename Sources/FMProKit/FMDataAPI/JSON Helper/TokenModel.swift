//
//  TokenModel.swift
//  FilemakerAPI
//
//  Created by Coderly Studio (Francesco De Marco, Gianluca Annina, Giuseppe Carannante) on 06/10/22.
//

import Foundation

class TokenModel: Codable {
    var token: String?
}

class Token: Codable {
    var response: TokenModel?
}
