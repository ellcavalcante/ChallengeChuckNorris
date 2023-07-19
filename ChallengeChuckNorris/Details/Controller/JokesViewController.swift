//
//  JokesViewController.swift
//  ChallengeChuckNorris
//
//  Created by Ellington Cavalcante on 18/07/23.
//

import UIKit

class JokesViewController: UIViewController {
    
    var jokesScreen: JokesScreen?
    
    override func loadView() {
        jokesScreen = JokesScreen()
        view = jokesScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.jokesScreen?.delegate(delegate: self)
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
}

extension JokesViewController: JokesScreenProtocol {
    func actionBackButton() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
