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
        let url: String = url
        
        AF.request(url, method: .get).validate().responseDecodable(of: Categories.self) { response in
            switch response.result {
            case .success(let success):
                completion(success, nil)
            case .failure(let error):
                completion(nil, Error.errorRequest(error))
            }
        }
    }
    
    func getCategoriesDataFromJson(fromFileName name: String, completion: (Categories?, Error?) -> Void) {
        if let name = Bundle.main.url(forResource: name, withExtension: "json"){
            do {
                let data = try Data(contentsOf: name)
                let jokesCategories = try JSONDecoder().decode(Categories.self, from: data)
                completion(jokesCategories, nil)
            } catch {
                completion(nil, Error.fileDecodingFailed(name: "categoriJokes", error))
            }
        }
    }
}

