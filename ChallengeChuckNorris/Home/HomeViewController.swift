//
//  HomeViewController.swift
//  ChallengeChuckNorris
//
//  Created by Ellington Cavalcante on 17/07/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeScreen: HomeScreen?
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)
    
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}
