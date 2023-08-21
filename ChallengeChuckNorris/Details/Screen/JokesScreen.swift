//
//  JokesScreen.swift
//  ChallengeChuckNorris
//
//  Created by Ellington Cavalcante on 18/07/23.
//

import UIKit

protocol JokesScreenProtocol: AnyObject {
    func actionBackButton()
    func actionRefreshButton()
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
    
    public lazy var categoriesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    private lazy var chuckImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "LogoLaunch")
        return image
    }()
    
    public lazy var jokeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    public lazy var refreshButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor.lightGray
        button.addTarget(self, action: #selector(tappedRefreshButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var backButton: UIButton = {
        let backButton = UIButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 30)
        backButton.setImage(UIImage(systemName: "chevron.backward")?.withConfiguration(config), for: .normal)
        backButton.setTitle("Categories", for: .normal)
        backButton.tintColor = .white
        backButton.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return backButton
    }()
    
    @objc func tappedRefreshButton() {
        self.delegate?.actionRefreshButton()
    }
    
    @objc func tappedBackButton() {
        self.delegate?.actionBackButton()
    }
    
    public lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.color = .black
        indicator.style = .medium
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
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
        addSubview(chuckImage)
        addSubview(jokeLabel)
        addSubview(refreshButton)
        refreshButton.addSubview(activityIndicator)
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
            
            chuckImage.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20),
            chuckImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            chuckImage.widthAnchor.constraint(equalToConstant: 80),
            chuckImage.heightAnchor.constraint(equalToConstant: 80),
            
            jokeLabel.topAnchor.constraint(equalTo: chuckImage.bottomAnchor, constant: 10),
            jokeLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 24),
            jokeLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -24),
            
            refreshButton.topAnchor.constraint(equalTo: jokeLabel.bottomAnchor, constant: 20),
            refreshButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 24),
            refreshButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -24),
            refreshButton.heightAnchor.constraint(equalToConstant: 40),
            
            activityIndicator.centerXAnchor.constraint(equalTo: refreshButton.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: refreshButton.centerYAnchor),
        ])
    }
}
