//
//  WebService.swift
//  ItunesSearcher
//
//  Created by Fernando Frances on 11/12/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import Foundation

final internal class WebService {
    private let session = URLSession(configuration: .default)
    private let baseURL = URL(string:"https://itunes.apple.com/search?")!
    private let decoder = JSONDecoder()
    
    func load(from endpoint:Endpoint, onSuccess: @escaping ([Artist]) -> Void, onError: @escaping (Error) -> Void) -> Void {
        let decoder = self.decoder
        let request = endpoint.request(with: baseURL)
        let task = session.dataTask(with: request.url!) { (data: Data?, response: URLResponse?, error: Error?) in
            OperationQueue.main.addOperation {
                //Decode de data and call onError or onSuccess
            }
        }
        task.resume()
    }
}
