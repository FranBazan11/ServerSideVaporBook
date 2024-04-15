//
//  CreateAcronym.swift
//
//
//  Created by Juan Francisco Bazan Carrizo on 30/03/2024.
//

import Foundation
import Fluent


struct CreateAcronym: AsyncMigration {
    func prepare(on database: FluentKit.Database) async throws {
        try await database.schema(Acronym.schema)
            // Define the ID column in the database.
            .id()
            // Define columns for short and long. Set the column type to string and mark the columns as required.
            .field("short", .string, .required)
            .field("long", .string, .required)
            .create()
    }
    
    func revert(on database: FluentKit.Database) async throws{
        try await database.schema(Acronym.schema).delete()
    }
}
