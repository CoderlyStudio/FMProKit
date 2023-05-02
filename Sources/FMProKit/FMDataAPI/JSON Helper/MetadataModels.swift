//
//  File.swift
//
//
//  Created by Coderly Studio (Francesco De Marco, Gianluca Annina, Giuseppe Carannante) on 08/12/22.
//

import Foundation

// MARK: - ProductInfoMetadata
public struct ProductInfoMetadata: Codable {
    let response: Response
    let messages: [Message]
}

// MARK: - Message
public struct Message: Codable {
    let code, message: String
}

// MARK: - Response
public struct Response: Codable {
    let productInfo: ProductInfo
}

// MARK: - ProductInfo
public struct ProductInfo: Codable {
    let name, buildDate, version, dateFormat: String
    let timeFormat, timeStampFormat: String
}

// MARK: - DatabasesMetadata
struct DatabasesMetadata: Codable {
    let response: ResponseDatabase
}

// MARK: - Response
struct ResponseDatabase: Codable {
    let databases: [Databases]
}

// MARK: - Databasis
public struct Databases: Codable {
    let name: String
}

public struct ScrpitsMetaData: Codable {
    let response: ResponseScripts
    let messages: [Message]
}

public struct ResponseScripts: Codable {
    let scripts: [Scripts]
}

public struct LayoutsMetaData: Codable {
    let response: ResponseLayouts
    let messages: [Message]
}

public struct ResponseLayouts: Codable {
    let layouts: [Layouts]
}

public class Scripts: Codable {
    var name: String
    var isFolder: Bool
    var folderScriptNames: [Scripts]?
}

public class Layouts: Codable {
    var name: String
    var table: String?
    var isFolder: Bool?
    var folderLayoutNames: [Layouts]?
}
