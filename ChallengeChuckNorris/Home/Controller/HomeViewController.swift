//
//  HomeViewController.swift
//  ChallengeChuckNorris
//
//  Created by Ellington Cavalcante on 17/07/23.
//

import UIKit

protocol HomeViewControllerProtocol {
    func changeTitle(title: CategoriesTest)
}

class HomeViewController: UIViewController {
    
    private var delegate: HomeViewControllerProtocol?
    func delegate(delegate: HomeViewControllerProtocol?) {
        self.delegate = delegate
    }
    
    var homeScreen: HomeScreen?
    var homeViewModel: HomeViewModel = HomeViewModel()
    
    var categories: [CategoriesTest] = [CategoriesTest(categories: "Animal"),
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
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel.delegate(delegate: self)
        homeViewModel.fetch(.request)
        self.homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoriesTableViewCell.identifier, for: indexPath) as? CategoriesTableViewCell
        cell?.setUpCell(data: categories[indexPath.row])
        cell?.selectionStyle = .none
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = JokesViewController(data: homeViewModel.loadCurrentDriver(indexPath: indexPath))
        self.navigationController?.pushViewController(vc, animated: true)
        delegate?.changeTitle(title: homeViewModel.loadCurrentDriver(indexPath: indexPath))
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func success() {
        
        reloadTableView()
    }
    
    func error(_ message: String) {
        
    }
}

extension HomeViewController: HomeViewModelProtocol {
    func reloadTableView() {
        self.homeScreen?.jokesTableView.reloadData()
    }
}
