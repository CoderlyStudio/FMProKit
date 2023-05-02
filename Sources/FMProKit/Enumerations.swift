//
//  Extension.swift
//  FilemakerAPI
//
//  Created by Coderly Studio (Francesco De Marco, Gianluca Annina, Giuseppe Carannante) on 08/10/22.
//

import Foundation

/// Enumeration of all the possible filterOption of an OData query
public enum FilterOption: String {
    case equal = "eq"
    case notEqual = "ne"
    case greaterThen = "gt"
    case lessThen = "lt"
    case greaterEqual = "ge"
    case lessEqual = "le"
}

/// Enumeration of all the possible HTTP method of the protocol
public enum HTTPMethod: String {
    case get = "GET"
    case patch = "PATCH"
    case delete = "DELETE"
    case post = "POST"
}

// change the documentation
/// Enumeration of all the possible version of the protocol
public enum ProtocolVersion: String {
    case vLatest
    case v1
    case v2
    case v4
}
/// Enumeration of all the possible orderOption of an OData query
public enum Order: String {
    case desc
    case asc
}
