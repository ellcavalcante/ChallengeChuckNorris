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
    
    public lazy var categoriesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Categories"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    public lazy var categoryTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.register(CategoriesTableViewCell.self, forCellReuseIdentifier: CategoriesTableViewCell.identifier)
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
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        categoryTableView.delegate = delegate
        categoryTableView.dataSource = dataSource
    }
    
    private func configBackground() {
        backgroundColor = .white
    }
    
    private func addSubview() {
        addSubview(topYellowView)
        addSubview(topView)
        addSubview(categoriesLabel)
        addSubview(categoryTableView)
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
            categoriesLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            
            categoryTableView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            categoryTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            categoryTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            categoryTableView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
        ])
    }
}
