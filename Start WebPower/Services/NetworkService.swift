//
//  NetworkService.swift
//  Start WebPower
//
//  Created by Алик on 1/1/20.
//  Copyright © 2020 ALIK MOLDOVANU. All rights reserved.
//

import Foundation

protocol Networking {
    func request(path: String, params: [String: String]?, method: HTTPMethod, completion: @escaping (Data?, Error?) -> Void)
}

final class NetworkService: Networking {
    
    func request(path: String, params: [String: String]?, method: HTTPMethod, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = self.url(from: path, params: params) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        })
    }
    
    private func url(from path: String, params: [String: String]?) -> URL? {
        var components = URLComponents()
        components.scheme = API.scheme
        components.host = API.host
        components.path = API.path + path
        
        if let params = params, !(params.isEmpty) {
            components.queryItems = params.map{ URLQueryItem(name: $0, value: $1) }
        }
        return components.url
    }
}
