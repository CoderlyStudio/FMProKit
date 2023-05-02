//
//  JSONFileFMData.swift
//  FilemakerAPI
//
//  Created by Coderly Studio (Francesco De Marco, Gianluca Annina, Giuseppe Carannante) on 06/10/22.
//

import Foundation

class DataModel<T: Codable>: Codable {
    var response: Table<T>
}

class Table<T: Codable>: Codable {
    var data: [FieldData<T>]
    var dataInfo: DataInfo
}

public class FieldData<T: Codable>: Codable {
    var fieldData: T
    var recordId: String
    var modId: String
}

class Query<T: Codable>: Codable {
    var query: [T]
    
    public init(query: [T]) {
        self.query = query
    }
}

class Insert<T: Codable>: Codable {
    var fieldData: T
    
    public init(fieldData: T) {
        self.fieldData = fieldData
    }
}

class DataInfo: Codable {
    var database: String
    var layout: String
    var table: String
    var totalRecordCount: Int
    var foundCount: Int
    var returnedCount: Int
}
