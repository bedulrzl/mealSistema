//
//  APIRouter.swift
//  FIlmApa
//
//  Created by TMLI IT DEV on 16/12/20.
//

import Foundation
import Alamofire

enum APIRouter: APIConfiguration {
    
    case meal(mealPage: String)
    case mealDetail(genreId: Int)
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .meal,
             .mealDetail:
            return .get
        }
    }
    // MARK: - Parameters
     var parameters: RequestParams {
        switch self {
        case .meal(let page):
            return.url(["c": page])
        case .mealDetail(let id):
            return.url(["i": String(id)])
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .meal:
            return "/filter.php"
        case .mealDetail:
            return "/lookup.php"
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.ProductionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Parameters
        switch parameters {
            
        case .body(let params):
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
            
        case .url(let params):
                let queryParams = params.map { pair  in
                    return URLQueryItem(name: pair.key, value: "\(pair.value)")
                }
                var components = URLComponents(string:url.appendingPathComponent(path).absoluteString)
                components?.queryItems = queryParams
                urlRequest.url = components?.url
        }
            return urlRequest
    }
}
