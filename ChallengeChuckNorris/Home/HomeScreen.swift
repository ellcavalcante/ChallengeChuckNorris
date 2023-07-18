//
//  HomeScreen.swift
//  ChallengeChuckNorris
//
//  Created by Ellington Cavalcante on 17/07/23.
//

import UIKit

class HomeScreen: UIView {
    
    private lazy var topYellowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .getNavColor()
        return view
    }()
    
    private lazy var topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .getNavColor()
        return view
    }()
    
    private lazy var categoriesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Categories"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    lazy var jokesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        setUpConstraints()
        configBackground()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        jokesTableView.delegate = delegate
        jokesTableView.dataSource = dataSource
    }
    
    private func configBackground() {
        backgroundColor = .white
    }
    
    private func addSubview() {
        addSubview(topYellowView)
        addSubview(topView)
        addSubview(categoriesLabel)
        addSubview(jokesTableView)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            topView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topView.topAnchor.constraint(equalTo: topYellowView.bottomAnchor),
            topView.heightAnchor.constraint(equalToConstant: 45),
        
            topYellowView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topYellowView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topYellowView.topAnchor.constraint(equalTo: topAnchor),
            topYellowView.heightAnchor.constraint(equalToConstant: 80),
        
            categoriesLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            categoriesLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -25),
            
            jokesTableView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            jokesTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            jokesTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            jokesTableView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
        ])
    }
}
