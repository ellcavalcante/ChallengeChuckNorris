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
    
    var data: CategoriesTest
    
    required init(data: CategoriesTest) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func passingTitleData() {
        jokesScreen?.categoriesLabel.text = data.categories
    }
    
    override func loadView() {
        jokesScreen = JokesScreen()
        view = jokesScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.jokesScreen?.delegate(delegate: self)
        passingTitleData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
}

extension JokesViewController: JokesScreenProtocol {
    func actionRefreshButton() {
        print("button pressed!")
    }
    
    func actionBackButton() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}


