//
//  JokesScreen.swift
//  ChallengeChuckNorris
//
//  Created by Ellington Cavalcante on 18/07/23.
//

import UIKit

protocol JokesScreenProtocol: AnyObject {
    func actionBackButton()
}

class JokesScreen: UIView {
    
    private weak var delegate: JokesScreenProtocol?
    func delegate(delegate: JokesScreenProtocol?) {
        self.delegate = delegate
    }
    
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
        label.text = "Animal"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    lazy var backButton: UIButton = {
       let backButton = UIButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 30)
        backButton.setImage(UIImage(systemName: "chevron.backward")?.withConfiguration(config), for: .normal)
        backButton.setTitle("Categories", for: .normal)
        backButton.tintColor = .white
        backButton.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return backButton
    }()
    
    @objc func tappedBackButton() {
        self.delegate?.actionBackButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        configBackground()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubview() {
        addSubview(topView)
        addSubview(topYellowView)
        addSubview(categoriesLabel)
        addSubview(backButton)
    }
    
    private func configBackground() {
        backgroundColor = .white
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
            categoriesLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            
            backButton.centerYAnchor.constraint(equalTo: categoriesLabel.centerYAnchor),
            backButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 5),
            backButton.heightAnchor.constraint(equalToConstant: 25),
            backButton.widthAnchor.constraint(equalToConstant: 120),
            
        ])
    }
}
