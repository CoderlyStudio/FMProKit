//
//  FMDataAPI.swift
//  FilemakerAPI
//
//  Created by Coderly Studio (Francesco De Marco, Gianluca Annina, Giuseppe Carannante) on 06/10/22.
//

import Foundation

public class FMDataAPI: APIProtocol {
    /// a constant contains the server domain
    let hostname: String
    /// a constant contains the actual name of your database
    let database: String
    /// a variable is used to build the first common part URI for APIs
    let baseUri: String
    /// a constant contains the username credential to access the database
    var username: String
    /// a constant contains the password credential to access the database
    var password: String
    /// a variable contains the database credentials in the format "USERNAME:PASSWORD"
    var authData: String
    /// a variable contains the token that FileMaker generates to use the Data APIs
    var bearerToken: String
    /// a variable contains the HTTP request with headers, URL, AUTH and body
    var request: URLRequest
    /// a variable contains the HTTP response in JSON format
    var responseJSON = Data()
    /// the version that you want to use
    var protocolVersion: ProtocolVersion
     
    /// The class initializer used to setup all the information used to access and interface the Filemaker Database using OData.
    /// Once all the information has been collected the _BASE_URI_ is created using _HOSTNAME_ and _DATABASE_ meanwhile _USERNAME_ and _PASSWORD_ are used in order to create _AUTH_DATA_
    /// All the parameters has been encoded using _PercentEncoding_ with _urlQueryAllowed_
    /// - Parameters:
    ///   - server: the URL of the Filemaker Database passed as a String
    ///   - database: the Database name of the Filemaker Database passed as a String
    ///   - username: the Username used to acces the Filemaker Database passed as a String
    ///   - password: the Password used to acces the Filemaker Database passed as a String
    public required init(server: String, database: String, username: String, password: String, version: ProtocolVersion = .vLatest) {
        self.hostname = server
        self.database = database
        self.username = username
        self.password = password
        self.protocolVersion = version
        self.authData = ""
        self.baseUri = "https://\(hostname)/fmi/data/\(version.rawValue)/databases/\(database)"
        self.bearerToken = ""
        self.request = URLRequest(url: URL(string: "https://")!)
        self.request.setValue("Basic \(authData)", forHTTPHeaderField: "Authorization")
    }
  
    /// The function is used in order to retrieve the access token to the database
    func fetchToken() async throws {
        guard let stringURL = "https://\(self.hostname)/fmi/data/vLatest/databases/\(self.database)/sessions".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let tokenRequestURL = URL(string: stringURL) else {
            throw URLError(.badURL)
        }
        
        guard let basicAuth = (username + ":" + password).data(using: .utf8)?.base64EncodedString() else {
            throw AuthError.authorizationEncodingError
        }
        
        var tokenRequest = URLRequest(url: tokenRequestURL)
        tokenRequest.addValue("Basic \(basicAuth)", forHTTPHeaderField: "Authorization")
        tokenRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        tokenRequest.httpMethod = "POST"
        
        let (data, response) = try await URLSession.shared.data(for: tokenRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode != 401 else {
            throw FetchError.tokenRequestError
        }
        
        let fetchedData = try JSONDecoder().decode(Token.self, from: data)
        
        self.authData = "Bearer \(fetchedData.response?.token ?? "")"
    }

    /// Returns the last URLRequest called using the package
    /// - Returns: an URLRequest object
    public func getRequest() -> URLRequest {
        return request
    }

    // update and not set
    public func updateUsernameAndPassword(username: String, password: String) async throws {
        self.username = username
        self.password = password
        try await fetchToken()
    }
    
    /// Returns the last response in JSON format using the package
    /// - Returns: an Object of Data type
    public func getResponseJSON() -> Data {
        return responseJSON
    }
}
