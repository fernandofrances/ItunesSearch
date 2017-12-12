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
    private let baseURL = URL(string:"https://itunes.apple.com/")!
    private let decoder = JSONDecoder()
    
    func load<T: Decodable>(_ type: T.Type, from endpoint: Endpoint, onSuccess: @escaping (T) -> Void, onError: @escaping (Error) -> Void) -> Void {
        let decoder = self.decoder
        let request = endpoint.request(with: baseURL)
        let task = session.dataTask(with: request.url!) { (data: Data?, response: URLResponse?, error: Error?) in
            OperationQueue.main.addOperation {
                if error == nil {
                    if let result = try? decoder.decode(T.self, from: data!){ onSuccess(result)
                    }else{
                        print("Error Decoding: \(T.self)")
                    }
                }else{
                    print(error)
                }
            }
        }
        task.resume()
    }
}
