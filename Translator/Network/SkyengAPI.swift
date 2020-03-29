//
//  SkyengAPI.swift
//  Translator
//
//  Created by Алексей Бузов on 29.03.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import Foundation

protocol Translatable {
    func translate(
        search: String,
        page: Int?,
        pageSize: Int?,
        completion: @escaping ((_ data: [PosibleTranslation]?,_ error: Error?) -> Void))
}

final class SkyengAPI: Translatable {
    
    let basePath = "https://dictionary.skyeng.ru/api/public/v1/words"
    private var network: Networking
    
    init() {
        self.network = NetworkLayer()
    }
    
    func translate(
        search: String,
        page: Int? = nil,
        pageSize: Int? = nil,
        completion: @escaping ((_ data: [PosibleTranslation]?,_ error: Error?) -> Void))
    {
        let path = "/search"
        let srtingURL = basePath + path
        let items: [String:Any?] = [
            "search" : search.encodeToJSON(),
            "page" : page?.encodeToJSON(),
            "pageSize" : pageSize?.encodeToJSON()
        ]
        
        network.request(srtingURL: srtingURL, queryItems: items) { (data, error) in
            if let error = error {
                print("Error received request data: \(error.localizedDescription)")
                completion(nil, error)
            }
            let decoded = self.network.decodeJson(type: [PosibleTranslation].self, from: data)
            completion(decoded, nil)
        }
    }
    
}
