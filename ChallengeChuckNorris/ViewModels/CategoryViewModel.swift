//
//  HomeViewModel.swift
//  ChallengeChuckNorris
//
//  Created by Ellington Cavalcante on 18/07/23.
//

import UIKit

enum CategoryTypeFetch {
    case mock
    case request
}

protocol CategoryViewModelProtocol: AnyObject {
    func reloadTableView()
}

protocol CategoryViewModelDelegate: AnyObject {
    func success()
    func error(_ message: String)
}

class CategoryViewModel {
    
    public var requestCategories: [String] = []
    
    
    private let service: CategoriesJokesService = CategoriesJokesService()
    private weak var delegate: CategoryViewModelDelegate?
    
    public func delegate(delegate: CategoryViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetch(_ typeFetch: CategoryTypeFetch){
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

