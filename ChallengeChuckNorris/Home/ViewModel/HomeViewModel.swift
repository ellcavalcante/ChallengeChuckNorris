//
//  HomeViewModel.swift
//  ChallengeChuckNorris
//
//  Created by Ellington Cavalcante on 18/07/23.
//

import UIKit

enum HomeTypeFetch {
    case mock
    case request
}

protocol HomeViewModelProtocol: AnyObject {
    func reloadTableView()
}

protocol HomeViewModelDelegate: AnyObject {
    func success()
    func error(_ message: String)
}

class HomeViewModel {
    
    public var requestCategories: [String] = []
    
    
    private let service: CategoriesJokesService = CategoriesJokesService()
    private weak var delegate: HomeViewModelDelegate?
    
    public func delegate(delegate: HomeViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetch(_ typeFetch: HomeTypeFetch){
        switch typeFetch {
        case .mock:
            self.service.getCategoriesDataFromJson(fromFileName: "categoriJokes") { success, error in
                if let success = success {
                    self.requestCategories = success
                    self.delegate?.success()
                } else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }

        case .request:
            self.service.getCategoriesData(fromURL: "https://api.chucknorris.io/jokes/categories") { success, error in
                if let success = success {
                    self.requestCategories = success
                    self.delegate?.success()
                } else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    public var numberOfRows:Int {
        return requestCategories.count
    }
    
    public func loadCategory(indexPath: IndexPath) -> String {
        return requestCategories[indexPath.row]
    }
}

