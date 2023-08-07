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

protocol JokeViewModelProtocol: AnyObject {
    func reloadTableView()
}

protocol JokeViewModelDelegate: AnyObject {
    func success()
    func error(_ message: String)
}

class JokeViewModel {
    
    public var requestJoke: [Joke] = []
    
    
    private let service: JokesService = JokesService()
    private weak var delegate: JokeViewModelDelegate?
    
    public func delegate(delegate: JokeViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetch(_ typeFetch: JokeTypeFetch){
        switch typeFetch {
        case .mock:
            self.service.getJokesDataFromJson(fromFileName: "Jokes") { success, error in
                if let success = success {
                    
                    self.delegate?.success()
                } else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }

        case .request:
            self.service.getJokesData(fromURL: "https://api.chucknorris.io/jokes/random") { success, error in
                if let success = success {
                    
                    self.delegate?.success()
                } else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    public var numberOfRows:Int {
        return requestJoke.count
    }
    
    public func loadJoke(indexPath: IndexPath) -> Joke {
        return requestJoke[indexPath.row]
    }
}
