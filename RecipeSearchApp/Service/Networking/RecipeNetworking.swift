//
//  RecipeNetworking.swift
//  RecipeSearchApp
//
//  Created by rau4o on 5/8/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import Moya

enum RecipeNetworking {
    case searchRecipe(query: String)
}

extension RecipeNetworking: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: "https://api.edamam.com/") else {
            fatalError("Error in base url: https://api.edamam.com/")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .searchRecipe:
            return "search"
        }
    }
    
    var method: Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .searchRecipe(let query):
            return .requestParameters(parameters: ["q": query,"app_id": NetworkProperties.APP_ID, "app_key": NetworkProperties.API_KEY], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
