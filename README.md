![FMPKgitBanner](https://user-images.githubusercontent.com/129211821/235753747-12615a14-c8e9-4429-9874-55c55ad18a9d.png)


![GitHub](https://img.shields.io/badge/Data--Version-vLatest-green) ![GitHub](https://img.shields.io/badge/OData--Version-v4-brightgreen) ![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fstarsite%2FSwiftFM%2Fbadge%3Ftype%3Dplatforms)

---


# FMProKit - an easier way to communicate with FileMaker 

[![](https://img.shields.io/badge/FMProKit-info-informational)](#)

FMProKit is a swift package that lets you easily communicate with a FileMaker database using both OData and FileMaker Data protocols

## Overview

Thanks to FMProkit, it is possible to use:
* The basic CRUD (CRUD is an acronym that refers to the four functions that are considered necessary to implement a persistent storage application: create, read, update and delete.);
* Run scripts from the server itself;
* Retrieve the metadata;
* Call some custom query;
* And only for OData the possibility to modify the database schema.

---

### Index

- [Concepts](#arrows_counterclockwise-asyncawait)
  - [Async/await](#arrows_counterclockwise-asyncawait)
  - [Generics](#busts_in_silhouette-generics)
  - [Codable](#currency_exchange-codable)
  - [DocC](#books-docc)
  - [Error Handling](#warning-error-handling)
  - [Testing](#test_tube-testing)
- [How To Use](#-how-to-use)
- [Before you start](#before-you-start)


---

### Examples
  
  - [Fetch an entire table](#fetch-an-entire-table)
  - [Create a new record](#create-a-new-record)
  - [Delete a record](#delete-a-record)
  - [Edit a record](#edit-a-record)
  - [Fetch data using a query](#fetch-data-using-a-query)
  - [Get metadata](#get-metadata)

---

### :arrows_counterclockwise: Async/await

[![](https://img.shields.io/badge/Swift%20Concurrency-info-informational)](https://docs.swift.org/swift-book/LanguageGuide/Concurrency.html)

This package uses modern and Swift built-in support `async/await` to run asynchronous and parallel code in a structured way.
_Asynchronous_ code can be suspended and resumed later, allowings your program continue to make progress on short-term operations like updating its UI while continuing to work on long-running operations like fetching data over the network or parsing files.
_Parallel_ code means multiple pieces of code run simultaneously, for example each core in a processor can run a different piece of code at the same time, completing different tasks.

---

### :busts_in_silhouette: Generics

[![](https://img.shields.io/badge/Swift%20Generics-info-informational)](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)

`Generic` code enables you to write flexible, reusable functions and types that can work with any type.
_Generics_ are one of the most powerful features of Swift, and much of the Swift standard library is built with generic code, for example, Swift’s Array and Dictionary types are both generic collections. You can create an array that holds Int values, or an array that holds String values, or indeed an array for any other type that can be created in Swift. Similarly, you can create a dictionary to store values of any specified type, and there are no limitations on what that type can be.

In `FMProKit` this is foundamental to create a package completely detached from a particular data model allowing to work with any type and how many fields your projects need.

---

### :currency_exchange: Codable

[![](https://img.shields.io/badge/Codable-info-informational)](https://developer.apple.com/documentation/swift/codable)

`Codable` is a type that can convert itself into and out of an external representation.
Codable is a type alias for the `Encodable` and `Decodable` protocols. When you use Codable as a type or a generic constraint, it matches any type that conforms to both protocols.

We use `Codable` structures to extract data from `JSON` files and to convert yours data in `JSON` to send to FileMaker.

---

### :books: DocC

[![](https://img.shields.io/badge/DocC-info-informational)](https://developer.apple.com/documentation/docc)

The `DocC documentation compiler` converts Markdown-based text into rich documentation for Swift and Objective-C projects, and displays it right in the Xcode documentation window.

We used it to explain for each method its parameters, what it does and what it returns, if it does.
With `DocC` there is an entire structured documentation aviable for you already in the package without external links.

---

### :warning: Error Handling
[![](https://img.shields.io/badge/Error%20Handling-ino-informational)](#https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html)

To better handle errors in our package, we implemented custom enumerations by extending the `Error` protocol.

These custom errors allow us to avoid crashes and appropriately handle all possible HTTP responses that the server returns. Thanks to this type of implementation when using the functions it will only be necessary to use a `do catch` block so as to avoid any blocking errors. Any server errors or incorrect requests will be shown in the console with related HTTP code.

---

### :test_tube: Testing

[![](https://img.shields.io/badge/Testing-in%20progress-critical)](#)

Our functions are designed to use `FileMaker API` in the most efficient and easiest way possible, reducing the error possibility. 
To achieve this goal we tested in many different ways almost every function.

`Testing` allows us to avoid crashes and handle an incredible variety of errors that will be shown to you in case something went wrong.
This is a very long and complex process and requires time. Every feedback or crash report is fundamental to improving FMProKit.

---

### 🗳 How To Use

[![](https://img.shields.io/badge/Swift%20Package%20Manager-info-informational)](https://www.swift.org/package-manager/)

* Xcode -> File -> Add Packages
* Insert this link `https://github.com/The-Pier/FMProKit`
* Add an `import FMProKit` statement
* Initialize an OData or Data object

 ```swift
 import FMProKit 
 
 //YOUR CLASS/STRUCT/VIEW/CODE
 
 //OData API init
 let api:FMODataAPI = FMODataAPI(server: "serverName", database: "dbName", username: "username", password: "password")
 
 //Data API init
 let api:FMDataAPI = FMDataAPI(server: "serverName", database: "dbName", username: "username", password: "password")
 
 ``` 
* **You're ready to use FileMaker API like a Pro!** :sunglasses:
---

# Before You Start

In order to convert your objects to JSON and vice versa, they must conform to the [`Codable`](#currency_exchange-codable) protocol.

Make sure that the `fields` in the database table are represented with the same `name` and `type` in your Swift structure/class.
If there is an inconsistency between name and/or type, this will cause an `encodeError` or a `decodeError`, depending on the operation performed.

### Watch out
If you use `images` within the FileMaker database, in Swift, the corresponding field must be of type `Data`.

`Dates`, instead, must be of type `String` in order to be used in Swift.

Remember that in order to use the `OData` protocol, it is necessary to grant permissions in FileMaker as follows:

* File -> Manage -> Security
* Advanced Settings -> Extended Privileges
* Look for `fmodata` and set privileges

---

# Examples

**Remember**: since they are asynchronous calls, they must always be used within `Task` or `.task` structures. 



Let's see some examples of functions inside our kit.


### Fetch an entire table
To fetch all the records from a table, use the code below:

 ```swift
Task{
    do{
        //OData API
        let list:[yourType] = try await api.getTable(table: "tableName")
 
        //Data API
        let list:[yourType] = try await api.getTable(table: "tableName")
        
    }catch{
        print(error)
    }
}
 ``` 
### Create a new record
To create a new record, use the code below:

 ```swift

 let object = YourObject()
 
 Task{
    do{
        //OData API
        try await api.createRecord(table: "tableName", data: object)
 
        //Data API
       try await api.createRecord(table: "tableName", data: object)
       
    }catch{
        print(error)
    }
 }
 ``` 
 
### Delete a record
To delete a record, use the code below:

 ```swift
Task{
    do{
        //OData API
        try await api.deleteRecord(table: "tableName", id: "recordId")
 
        //Data API
        try await api.deleteRecord(table: "tableName", id: objectToDelete)
        
    }catch{
        print(error)
    }
 }
 ``` 
 
### Edit a record
To edit a record, use the code below:

 ```swift
 
 let object = YourObject()
  
Task{
    do{
        //OData API
        try await api.editRecord(table: "tableName", id: "recordId", data: object)
 
        //Data API
        try await api.editRecord(table: "tableName", findData: objectToEdit, editData: object)
    
    }catch{
        print(error)
    }
}
 ``` 
  
### Fetch data using a query
To fetch a record using a query, use the code below:

 ```swift
 Task{
    do{
        //OData API
        try await api.getTable(table: "tableName", query: "query")
 
        //Data API
        try await api.getTable(table: "tableName", query: "query")
        
    }catch{
        print(error)
    }
 }
 ``` 
 
### Get metadata
To the metadata, use the code below:

 ```swift
 Task{
    do{
        //OData API
        let metadata: Metadata = try await api.getMetadataAsData()
 
        //Data API
        let metadata: Data = try await api.getMetadataAsData()
    
    }catch{
        print(error)
    }
 }
 ``` 
 
 And this are just some of the possible functions it is possible to use thanks to FMProKit

---

More to come... **Stay Tuned!** :smirk:
