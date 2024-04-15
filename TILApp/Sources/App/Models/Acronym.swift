//
//  Acronym.swift
//
//
//  Created by Juan Francisco Bazan Carrizo on 30/03/2024.
//
import Vapor
import Fluent

final class Acronym: Model, Content {
    /// SCHEMA
    static let schema = "acronyms"
    
    @ID
    var id: UUID?
    
    @Field(key: "short")
    var short: String
    @Field(key: "long")
    var long: String
    
    
    // MARK: - INIT's
    init() {}
    
    init(id: UUID? = nil, short: String, long: String) {
        self.id = id
        self.short = short
        self.long = long
    }
}
