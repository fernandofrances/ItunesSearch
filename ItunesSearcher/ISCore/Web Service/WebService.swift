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
    
    func load(from endpoint:Endpoint, onSuccess: @escaping (SearchResult) -> Void, onError: @escaping (Error) -> Void) -> Void {
        let decoder = self.decoder
        let request = endpoint.request(with: baseURL)
        let task = session.dataTask(with: request.url!) { (data: Data?, response: URLResponse?, error: Error?) in
            OperationQueue.main.addOperation {
                if error == nil {
                    if let result = try? decoder.decode(SearchResult.self, from: data!){ onSuccess(result)
                    }else{
                        print("Error Decoding: \(String(data: data!, encoding: .utf8)!)")
                    }
                }else{
                    print("Decoding Error")
                }
            }
        }
        task.resume()
    }
}
