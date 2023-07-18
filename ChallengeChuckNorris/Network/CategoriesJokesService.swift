//
//  JokesService.swift
//  ChallengeChuckNorris
//
//  Created by Ellington Cavalcante on 17/07/23.
//

import UIKit
import Alamofire

protocol CategoriesJokesDelegate: GenericService {
    func getCategoriesData(fromURL url: String, completion: @escaping completion<Categories?>)
    func getCategoriesDataFromJson(fromFileName name: String, completion: completion<Categories?>)
}

class CategoriesJokesService: CategoriesJokesDelegate {
    func getCategoriesData(fromURL url: String, completion: @escaping completion<Categories?>) {
        
    }
    
    func getCategoriesDataFromJson(fromFileName name: String, completion: (Categories?, Error?) -> Void) {
        
    }
}
