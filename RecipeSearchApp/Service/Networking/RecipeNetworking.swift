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
//    case fetchFood()
}

extension RecipeNetworking: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: "https://api.edamam.com/") else {
            fatalError("Error in base url: https://api.edamam.com/")
        }
        return url
    }
    
//    https://api.edamam.com/api/food-database/parser?nutrition-type=logging&ingr=red%20apple&app_id={your app_id}&app_key={your app_key}
    
    var path: String {
        switch self {
        case .searchRecipe:
            return "search"
//        case .fetchFood:
//            return "api/food-database/parser"
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
//        case .fetchFood():
//            return .requestParameters(parameters: ["": "","app_id": NetworkProperties.APP_ID, "app_key": NetworkProperties.API_KEY], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
