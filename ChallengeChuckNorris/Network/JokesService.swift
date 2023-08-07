//
//  JokesService.swift
//  ChallengeChuckNorris
//
//  Created by Ellington Cavalcante on 06/08/23.
//

import UIKit
import Alamofire

protocol JokesDelegate: GenericService {
    func getJokesData(fromURL url: String, completion: @escaping completion<Joke?>)
    func getJokesDataFromJson(fromFileName name: String, completion: completion<Joke?>)
}

class JokesService: JokesDelegate {
    func getJokesData(fromURL url: String, completion: @escaping completion<Joke?>) {
        let url: String = url
        
        AF.request(url, method: .get).validate().responseDecodable(of: Joke.self) { response in
            switch response.result {
            case .success(let success):
                completion(success, nil)
                print(success)
            case .failure(let error):
                completion(nil, Error.errorRequest(error))
            }
        }
    }
    
    func getJokesDataFromJson(fromFileName name: String, completion: (Joke?, Error?) -> Void) {
        if let name = Bundle.main.url(forResource: name, withExtension: "json"){
            do {
                let data = try Data(contentsOf: name)
                let jokes = try JSONDecoder().decode(Joke.self, from: data)
                completion(jokes, nil)
            } catch {
                completion(nil, Error.fileDecodingFailed(name: "Jokes", error))
            }
        }
    }
}
