//
//  FMODataAPI.swift
//  FMApi
//
//  Created by Coderly Studio (Francesco De Marco, Gianluca Annina, Giuseppe Carannante) on 05/10/22.
//

import Foundation
import SwiftUI

/// The class responsible to interface with the Filemaker Database using OData and API calls
public class FMODataAPI: APIProtocol {
    /// a constant contains the server domain
    let hostname: String
    /// a constant contains the actual name of your database
    let database: String
    /// a variable is used to build the first common part URI for APIs
    let baseUri: String
    /// a variable contains the username credential to access the database
    var username: String
    /// a variable contains the password credential to access the database
    var password: String
    /// a variable contains the HTTP response in JSON format
    var responseJSON = Data()
    /// a variable describing the protocol version of OData
    var protocolVersion: ProtocolVersion
    /// used to access to the database
    var authData: String

    var request: URLRequest
    /// The class initializer used to setup all the information used to access and interface the Filemaker Database using OData.
    /// - Parameters:
    ///   - server: the URL of the Filemaker Database passed as a String
    ///   - database: the Database name of the Filemaker Database passed as a String
    ///   - username: the Username used to acces the Filemaker Database passed as a String
    ///   - password: the Password used to acces the Filemaker Database passed as a String
    /// - Attention: All the parameters has been encoded using _PercentEncoding_ with _urlQueryAllowed_
    public required init(server: String, database: String, username: String, password: String, version: ProtocolVersion = .v4 ) {
        self.protocolVersion = version
        self.hostname = server
        self.database = database
        self.username = username
        self.password = password
        self.baseUri = "https://\(hostname)/fmi/odata/\(version.rawValue)/\(database)"
        self.request = URLRequest(url: URL(string: "https://")!)
        self.authData = "Basic \((username + ":" + password).data(using: .utf8)!.base64EncodedString())"
    }

    /// Returns the last URLRequest called using the package
    /// - Returns: an URLRequest object
    public func getRequest() -> URLRequest? {
        return request
    }

    /// Update the credentials used to access the database
    /// - Parameters:
    ///   - username: a variable contains the username credential to access the database
    ///   - password: a variable contains the password credential to access the database
    public func updateUsernameAndPassword(username: String, password: String) {
        self.username = username
        self.password = password
        self.authData = "Basic \((username + ":" + password).data(using: .utf8)!.base64EncodedString())"
    }
    
    /// Returns the last response in JSON format using the package
    /// - Returns: an Object of Data type
    public func getResponseJSON() -> Data {
        return responseJSON
    }
    
    /// decode the generic struct as an array of generics
    /// - Parameter data: the data that needed to be decoded
    /// - Returns: a list of generics item
    public func decodeJSONArray<T: Codable>(data: Data) throws ->[T] {
            let fetchedData = try JSONDecoder().decode(JSONValue<T>.self, from: data)
            return fetchedData.value
    }
    
    /// decode the generic struct as a generic object
    /// - Parameter data: the data that needed to be decoded
    /// - Returns: a generics item
    public func decodeJSONSingleValue<T: Codable>(data: Data) throws -> T {
            let fetchedData = try JSONDecoder().decode(T.self, from: data)
            return fetchedData
    }
}
