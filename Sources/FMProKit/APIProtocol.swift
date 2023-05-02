//
//  File.swift
//
//
//  Created by Coderly Studio (Francesco De Marco, Gianluca Annina, Giuseppe Carannante) on 29/11/22.
//

import Foundation

/// This protocol defines the basic structre and functions signature
protocol APIProtocol: ObservableObject {
    /// a constant contains the server domain
    var hostname: String { get }
    /// a constant contains the actual name of your database
    var database: String { get }
    /// a variable is used to build the first common part URI for APIs
    var baseUri: String { get }
    /// a constant contains the username credential to access the database
    var username: String { get }
    /// a constant contains the password credential to access the database
    var password: String { get }
    /// a variable contains the HTTP response in JSON format
    var responseJSON: Data { get set }
    /// extends the package instead of putting it inside the library
    var protocolVersion: ProtocolVersion { get set }
    /// Used for the Authorization HTTP firld
    var authData: String { get set }
    /// Store the last sent request
    var request: URLRequest { get set }
    /// Intizializer
    init(server: String, database: String, username: String, password: String, version: ProtocolVersion)
}
