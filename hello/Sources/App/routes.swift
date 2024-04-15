import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }
    
    // Get a "Hello, \(name)"
    app.get("hello", ":name") { req in
        guard let name = req.parameters.get("name") else {
            throw Abort(.internalServerError)
        }
        return "Hello, \(name)"
    }
    
    app.post("info") { req -> InfoResponse in
        let data = try req.content.decode(InfoData.self)
        return InfoResponse(request: data)
    }
}

struct InfoResponse: Content {
    let request: InfoData
}

struct InfoData: Content {
    let name: String
}
