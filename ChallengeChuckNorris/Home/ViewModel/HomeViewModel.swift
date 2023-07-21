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

    private var dataCategories: [CategoriesTest] = [CategoriesTest(categories: "Animal"),
                                                    CategoriesTest(categories: "Career"),
                                                    CategoriesTest(categories: "Celebrity"),
                                                    CategoriesTest(categories: "Dev"),
                                                    CategoriesTest(categories: "Explicit"),
                                                    CategoriesTest(categories: "Fashion"),
                                                    CategoriesTest(categories: "Food"),
                                                    CategoriesTest(categories: "History"),
                                                    CategoriesTest(categories: "Money"),
                                                    CategoriesTest(categories: "Movie"),
                                                    CategoriesTest(categories: "Music"),
                                                    CategoriesTest(categories: "Political"),
                                                    CategoriesTest(categories: "Religion"),
                                                    CategoriesTest(categories: "Science"),
                                                    CategoriesTest(categories: "Sport"),
                                                    CategoriesTest(categories: "Travel")]
    
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
                
                    self.delegate?.success()
                } else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }

        case .request:
            self.service.getCategoriesData(fromURL: "https://api.chucknorris.io/jokes/categories.json") { success, error in
                if let success = success {
                    
                    
                    self.delegate?.success()
                } else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    public var numberOfRows:Int {
        return dataCategories.count
    }
    
    public func loadCurrentDriver(indexPath: IndexPath) -> CategoriesTest {
        return dataCategories[indexPath.row]
    }
}

