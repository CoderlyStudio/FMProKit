//
//
//
//  Created by Coderly Studio (Francesco De Marco, Gianluca Annina, Giuseppe Carannante) on 02/10/22.
//

import Foundation

struct JSONValue <T: Codable>: Codable {
    var value: [T]
}

struct JSONSingleValue <T: Codable>: Codable {
    var value: T
}

public struct TableValue: Codable {
    var name: String?
    var kind: String?
    var url: String?
}

struct IndexValue: Codable {
    var indexName: String
}
