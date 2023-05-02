import SwiftUI

public extension FMODataAPI {
    /// Create inside the database schema a new table using the tableName and a list of columns with the properties
    /// - Parameters:
    ///   - tableName: the name of the table
    ///   - listOfColumns: the list of columns
    /// - Throws: an HTTPError.errorCode_400_badRequest error when the name of table already exist or someone else is modifying the schema already
    /// - Throws: a CommonErrors.tableNameMissing error when the table parameter is empty
    /// - Throws: a CommonErrors.emptyListOfFields error when the listOfColumns parameter is empty
    func createNewTable(tableName: String, listOfColumns: [CreationTableField]) async throws {
        guard !listOfColumns.isEmpty else {
            throw FMProErrors.emptyListOfFields
        }
        guard !tableName.isEmpty else {
            throw FMProErrors.tableNameMissing
        }
        
        let tmpTable = NewDBTable(tableName: tableName, fields: listOfColumns)
        let urlTmp = "\(baseUri)/FileMaker_Tables"
        
        _ = try await executeRequest(urlTmp: urlTmp, method: .post, data: tmpTable)
    }

    /// Add a list of columns to an existent table
    /// - Parameters:
    ///   - tableName: the name of the table
    ///   - listOfColumns: the list of columns
    /// - Throws: an HTTPError.errorCode_400_badRequest error when the name of field already exist or someone else is modifying the schema already
    /// - Throws: a CommonErrors.tableNameMissing error when the table parameter is empty
    /// - Throws: a CommonErrors.emptyListOfFields error when the listOfColumns parameter is empty
    func addColumnToTable(tableName: String, listOfColumns: [CreationTableField]) async throws {
        guard !tableName.isEmpty else {
            throw FMProErrors.tableNameMissing
        }
        guard !listOfColumns.isEmpty else {
            throw FMProErrors.emptyListOfFields
        }
        
        let fields = AddFieldToTable(fields: listOfColumns)
        let urlTmp = "\(baseUri)/FileMaker_Tables/\(tableName)"
        
        _ = try await executeRequest(urlTmp: urlTmp, method: .patch, data: fields)
    }
    
    /// Deletes the table using its name
    /// - Parameter tableName: the name of the table
    /// - Throws: an HTTPError.errorCode_404_notFound error when the name of table is wrong or someone else is modifying the schema already
    /// - Throws: a CommonErrors.tableNameMissing error when the table parameter is empty
    func deleteTable(tableName: String) async throws {
        guard !tableName.isEmpty else {
            throw FMProErrors.tableNameMissing
        }
        
        let urlTmp = "\(baseUri)/FileMaker_Tables/\(tableName)"
        
        _ = try await executeRequest(urlTmp: urlTmp, method: .delete)
    }

    /// Delete a column using its name from a specified table
    /// - Parameters:
    ///   - tableName: the name of the table
    ///   - fieldName: the name of the column
    /// - Throws: an HTTPError.errorCode_404_notFound error when the name of table is wrong, the field name is wrong or someone else is modifying the schema already
    /// - Throws: a CommonErrors.tableNameMissing error when the table parameter is empty
    /// - Throws: a CommonErrors.fieldNameMissing error when the fieldname parameter is empty
    func deleteColumnFromTable(tableName: String, fieldName: String) async throws {
        guard !tableName.isEmpty else {
            throw FMProErrors.tableNameMissing
        }
        guard !fieldName.isEmpty else {
            throw FMProErrors.fieldNameMissing
        }
        
        let urlTmp = "\(baseUri)/FileMaker_Tables/\(tableName)/\(fieldName)"
        
        _ = try await executeRequest(urlTmp: urlTmp, method: .delete)
    }
    
    /// Create an index for a specified table
    /// - Parameters:
    ///   - tableName: the name of the table
    ///   - index: the name of the index
    /// - Throws: an HTTPError.errorCode_404_notFound error when the name of table doesn't exist
    /// - Throws: an HTTPError.errorCode_400_badRequest error when the name of the field doesn't exist,the field is already an index or someone else is modifying the schema already
    /// - Throws: a CommonErrors.tableNameMissing error when the table parameter is empty
    /// - Throws: a CommonErrors.indexNameMissing error when the index parameter is empty
    func creatFieldIndex(tableName: String, index: String) async throws {
        guard !tableName.isEmpty else {
            throw FMProErrors.tableNameMissing
        }
        guard !index.isEmpty else {
            throw FMProErrors.indexNameMissing
        }
        
        let index = IndexValue(indexName: index)
        let urlTmp = "\(baseUri)/FileMaker_Indexes/\(tableName)"
        
        _ = try await executeRequest(urlTmp: urlTmp, method: .post, data: index)
    }
    
    /// Delete an index from a table using its name
    /// - Parameters:
    ///   - tableName: the name of the table
    ///   - index: the name of the index
    /// - Throws: an HTTPError.errorCode_400_badRequest error when the name of the field doesn't exist,the field is not an index or someone else is modifying the schema already
    /// - Throws: a CommonErrors.tableNameMissing error when the table parameter is empty
    /// - Throws: a CommonErrors.indexNameMissing error when the index parameter is empty
    func deleteIndexFromTable(tableName: String, index: String) async throws {
        guard !tableName.isEmpty else {
            throw FMProErrors.tableNameMissing
        }
        guard !index.isEmpty else {
            throw FMProErrors.indexNameMissing
        }
        
        let urlTmp = "\(baseUri)/FileMaker_Indexes/\(tableName)/\(index)"
        
        _ = try await executeRequest(urlTmp: urlTmp, method: .delete)
    }
}
