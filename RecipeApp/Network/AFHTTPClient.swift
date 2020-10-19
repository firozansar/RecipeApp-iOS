//
//  AFHTTPClient.swift
//  RecipeApp
//
//  Created by Firoz Ansari on 14/10/2020.
//

import Alamofire
import RecipeAPI

public class AFHTTPClient: HTTPClient {

    public init() {}

    public func get(from url: URL, completion: @escaping (HTTPClient.Result) -> Void) {
        AF.request(url)
            .validate()
            .responseDecodable(of: RecipeList.self) { response in

                switch response.result {
                case let .success(value):
                    completion(.success(value))
                case let .failure(error):
                    completion(.failure(error))
                }
        }
    }
}
