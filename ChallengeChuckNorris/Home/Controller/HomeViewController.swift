//
//  HomeViewController.swift
//  ChallengeChuckNorris
//
//  Created by Ellington Cavalcante on 17/07/23.
//

import UIKit

protocol HomeViewControllerProtocol {
    func changeTitle(title: String)
}

class HomeViewController: UIViewController {
    
    private var delegate: HomeViewControllerProtocol?
    func delegate(delegate: HomeViewControllerProtocol?) {
        self.delegate = delegate
    }
    
    var homeScreen: HomeScreen?
    var categoryViewModel: CategoryViewModel = CategoryViewModel()
    var jokeViewModel: JokeViewModel = JokeViewModel()
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        categoryViewModel.delegate(delegate: self)
        categoryViewModel.fetch(.request)
        jokeViewModel.fetch(.request)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryViewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoriesTableViewCell.identifier, for: indexPath) as? CategoriesTableViewCell
        cell?.setUpCell(data: categoryViewModel.requestCategories[indexPath.row])
        cell?.selectionStyle = .none
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = JokesViewController(data: categoryViewModel.loadCategory(indexPath: indexPath))
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: CategoryViewModelDelegate {
    func success() {
        self.homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)
        reloadTableView()
    }
    
    func error(_ message: String) {
        
    }
}

extension HomeViewController: CategoryViewModelProtocol {
    func reloadTableView() {
        self.homeScreen?.categoryTableView.reloadData()
    }
}
