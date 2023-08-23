//
//  JokeViewModel.swift
//  ChallengeChuckNorris
//
//  Created by Ellington Cavalcante on 06/08/23.
//

import UIKit

enum JokeTypeFetch {
    case mock
    case request
}

protocol JokeViewModelDelegate: AnyObject {
    func success()
    func error(_ message: String)
}

class JokeViewModel {
    
    public var requestJoke: String = ""
    private let service: JokesService = JokesService()
    private weak var delegate: JokeViewModelDelegate?
    
    
    public func delegate(delegate: JokeViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetch(_ typeFetch: JokeTypeFetch, category: String){
        switch typeFetch {
        case .mock:
            self.service.getJokesDataFromJson(fromFileName: "Jokes") { success, error in
                if let success = success {
                    self.requestJoke = success.value
                    self.delegate?.success()
                } else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }
            
        case .request:
            self.service.getJokesData(fromURL: "https://api.chucknorris.io/jokes/random?category=\(category)") { success, error in
                if let success = success {
                    self.requestJoke = success.value
                    self.delegate?.success()
                } else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }
        }
    }
}
