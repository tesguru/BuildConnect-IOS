import Foundation

enum APIError: Error{
    case invalidUrl
    case invalidResponse
    case requestFailed(Int)
}

final class APIClient{
    static let shared = APIClient()
    
    private let baseURL =
          "https://buildconnect-api.ivantage.africa/v1"
    
    private init(){
    }
    
   
        func get<Response: Decodable>(_ path: String) async throws -> Response {
            try await request(path, method: "GET", body:nil)
        }
    
    func post <Request: Encodable, Response: Decodable>(_ path: String, body: Request) async throws -> Response {
        let data = try JSONEncoder().encode(body)

                return try await request(
                    path,
                    method: "POST",
                    body: data
                )
    }
    
    private func request<Response: Decodable>(_ path: String, method: String, body: Data?) async throws -> Response {
        let urlRequest = try makeRequest(
            
                    path,
                    method: method,
                    body: body
               
        )
        let (data, response) = try await URLSession.shared.data(
                   for: urlRequest
               )
        try validate(response)
        let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase

                return try decoder.decode(Response.self, from: data)
        
        
    }
    
    private func validate(_ response: URLResponse) throws {
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
               }
        guard (200...299).contains(httpResponse.statusCode) else {
                  throw APIError.requestFailed(httpResponse.statusCode)
              }
       
        
    }
    private func makeRequest(_ path: String, method: String, body: Data? = nil) throws -> URLRequest{
        let cleanPath = path.hasPrefix("/")
                   ? String(path.dropFirst())
                   : path
        
        guard let url = URL(string: "\(baseURL)/\(cleanPath)") else{
            throw APIError.invalidUrl
        }
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue(
                   "application/json",
                   forHTTPHeaderField: "Accept"
               )
        
        if let body {
            request.setValue(
                            "application/json",
                            forHTTPHeaderField: "Content-Type"
                        )
                        request.httpBody = body
        }
        
        return request
    }

}

