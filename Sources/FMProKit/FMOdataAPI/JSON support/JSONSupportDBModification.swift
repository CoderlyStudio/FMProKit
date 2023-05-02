//
//  File.swift
//
//
//  Created by Coderly Studio (Francesco De Marco, Gianluca Annina, Giuseppe Carannante) on 04/12/22.
//

import Foundation

// MARK: - NewDBTable
/// A struct used to create a new Table inside a FM Database using OData
struct NewDBTable: Codable {
    let tableName: String
    let fields: [CreationTableField]
}

/// A struct used to create a list of fields inside a FM Database using OData
struct AddFieldToTable: Codable {
    let fields: [CreationTableField]
}

// MARK: - Field
/// A struct used to create a new fields inside a FM Database using OData
public struct CreationTableField: Codable {
    let name, type: String
    let primary, unique: Bool
    let fieldDefault: String
    let nullable, global: Bool
    let externalSecurePath: String

    enum CodingKeys: String, CodingKey {
        case name, type, primary, unique
        case fieldDefault = "default"
        case nullable, global, externalSecurePath
    }
    
    public init(name: String, type: DBType, primary: Bool = false, unique: Bool = false, fieldDefault: DefaultType = .empty, nullable: Bool = false, global: Bool = false, externalSecurePath: String = "") {
        self.name = name
        self.type = type.rawValue
        self.primary = primary
        self.unique = unique
        self.fieldDefault = fieldDefault.rawValue
        self.nullable = nullable
        self.global = global
        
        if type == .blob {
            self.externalSecurePath = externalSecurePath
        } else {
            self.externalSecurePath = ""
        }
    }
    
    public init(name: String, customType: String, primary: Bool = false, unique: Bool = false, fieldDefault: DefaultType = .empty, nullable: Bool = false, global: Bool = false, externalSecurePath: String = "") {
        self.name = name
        self.type = customType
        self.primary = primary
        self.unique = unique
        self.fieldDefault = fieldDefault.rawValue
        self.nullable = nullable
        self.global = global
        
        if customType == "BLOB" {
            self.externalSecurePath = externalSecurePath
        } else {
            self.externalSecurePath = ""
        }
    }
}

/// An enumeration showing all the type of the fields in FileMaker
public enum DBType: String {
    case numeric = "NUMERIC"
    case decimal = "DECIMAL"
    case int = "INT"
    case date = "DATE"
    case time = "TIME"
    case timestamp = "TIMESTAMP"
    case varChar = "VARCHAR"
    case characterVarying = "CHARACTER VARYING"
    case blob = "BLOB"
    case varBinary = "VARBINARY"
    case longVarBinary = "LONGVARBINARY"
    case binaryVarying = "BINARY VARYING"
    case null = "NULL"
}

/// An enumeration showing all the value of default of a field in FileMaker
public enum DefaultType: String {
    case user = "USER"
    case username = "USERNAME"
    case currentUser = "CURRENT_USER"
    case currentDate = "CURRENT_DATE"
    case curDate = "CURDATE"
    case currentTime = "CURRENT_TIME"
    case curTime = "CURTIME"
    case currentTimestamp = "CURRENT_TIMESTAMP"
    case curTimestamp = "CURTIMESTAMP"
    case empty = ""
}
