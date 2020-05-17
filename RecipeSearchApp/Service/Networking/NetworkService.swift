//
//  NetworkService.swift
//  RecipeSearchApp
//
//  Created by rau4o on 5/8/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import Moya

class NetworkService {
    
    static let shared = NetworkService()
    private let provider = MoyaProvider<RecipeNetworking>()
    
    func fetchRecipe(with query: String, completion: @escaping (Welcome?,Error?) -> Void) {
        provider.request(.searchRecipe(query: query)) { (result) in
            switch result {
            case .success(let response):
                do {
                    let recipe = try JSONDecoder().decode(Welcome.self, from: response.data)
                    print(recipe.hits[0].recipe)
                    completion(recipe,nil)
                } catch(let error) {
                    print("\(error.localizedDescription) hz")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
