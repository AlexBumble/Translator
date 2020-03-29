//
//  NetworkLayer.swift
//  Translator
//
//  Created by Алексей Бузов on 29.03.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import  Foundation

protocol Networking {
    func request(
        srtingURL: String,
        queryItems: [String:Any?]?,
        complition: @escaping (Data?, Error?) -> Void)
    
    func decodeJson<T: Decodable>(type: T.Type, from: Data?) -> T?
}


final class NetworkLayer: Networking {
    
    func request(
        srtingURL: String,
        queryItems: [String:Any?]?,
        complition: @escaping (Data?, Error?) -> Void)
    {
        let queryItems = mapValuesToQueryItems(queryItems)
        var urlComponents = URLComponents(string: srtingURL)
        urlComponents?.queryItems = queryItems
        
        guard let url = urlComponents?.url else {
            print("Can't vrap urlComponents to url file:\(#file) line:\(#line).")
            return
        }
        
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, complition: complition)
        task.resume()
    }
    
    
    private func createDataTask(
        from requset: URLRequest,
        complition: @escaping (Data?, Error?) -> Void) ->URLSessionDataTask
    {
        return URLSession.shared.dataTask(with: requset)
        { (data, response, error) in
            DispatchQueue.main.async {
                complition(data, error)
            }
        }
    }
    
    private func mapValuesToQueryItems(_ source: [String:Any?]?) -> [URLQueryItem]? {
        guard let source = source else {
            return nil
        }
        
        let destination = source
            .filter({ $0.value != nil})
            .reduce(into: [URLQueryItem]()) { (result, item) in
                if let collection = item.value as? Array<Any?> {
                    let value = collection
                        .filter({ $0 != nil })
                        .map({"\($0!)"}).joined(separator: ",")
                    result
                        .append(URLQueryItem(name: item.key, value: value))
                } else if let value = item.value {
                    result.append(URLQueryItem(name: item.key, value: "\(value)"))
                }
        }
        
        if destination.isEmpty {
            return nil
        }
        return destination
    }
    
    func decodeJson<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from,
            let response = try? decoder.decode(type.self, from: data) else {
                print("Error decodeJson file:\(#file) line:\(#line).")
                return nil
                
        }
        return response
    }
    
}
