//
//  CategoriesTableViewCell.swift
//  ChallengeChuckNorris
//
//  Created by Ellington Cavalcante on 18/07/23.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: CategoriesTableViewCell.self)
    
    public lazy var categoriesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var fowardButton: UIImageView = {
       let fowardButton = UIImageView()
        fowardButton.translatesAutoresizingMaskIntoConstraints = false
        fowardButton.tintColor = .black
        fowardButton.image = UIImage(systemName: "chevron.right")
        return fowardButton
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setUpCell(data: String) {
        self.categoriesLabel.text = data
    }
    
    private func addSubview() {
        contentView.addSubview(categoriesLabel)
        contentView.addSubview(fowardButton)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            categoriesLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            categoriesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            fowardButton.widthAnchor.constraint(equalToConstant: 15),
            fowardButton.heightAnchor.constraint(equalToConstant: 20),
            fowardButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            fowardButton.centerYAnchor.constraint(equalTo: centerYAnchor),
        
        ])
    }
}
