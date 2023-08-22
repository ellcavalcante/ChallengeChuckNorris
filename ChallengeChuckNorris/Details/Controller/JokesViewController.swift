//
//  JokesViewController.swift
//  ChallengeChuckNorris
//
//  Created by Ellington Cavalcante on 18/07/23.
//

import UIKit

class JokesViewController: UIViewController {
    
    var jokesScreen: JokesScreen?
    var homeViewController: HomeViewController = HomeViewController()
    var viewModel: JokeViewModel = JokeViewModel()
    
    var data: String
    
    required init(data: String) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func passingTitleData() {
        jokesScreen?.categoriesLabel.text = data
    }
    
    override func loadView() {
        jokesScreen = JokesScreen()
        view = jokesScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.jokesScreen?.delegate(delegate: self)
        passingTitleData()
        viewModel.fetch(.request,category: data)
        viewModel.delegate(delegate: self)
        self.jokesScreen?.activityIndicator.startAnimating()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
}

extension JokesViewController: JokeViewModelDelegate {
    func success() {
        self.jokesScreen?.jokeLabel.text = viewModel.requestJoke
        self.jokesScreen?.loadButton()
    }
    
    func error(_ message: String) {
        let alert = UIAlertController(title: "⚠️ Aviso ⚠️", message: "Aconteceu um erro inesperado, por favor, tente mais tarde", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
}

extension JokesViewController: JokesScreenProtocol {
    func actionRefreshButton() {
        self.jokesScreen?.refreshJokeButton()
        viewModel.fetch(.request,category: data)
    }
    
    func actionBackButton() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}


