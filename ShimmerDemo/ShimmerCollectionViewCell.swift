//
//  ShimmerCollectionViewCell.swift
//  ShimmerDemo
//
//  Created by Ashish Badak on 25/01/23.
//

import UIKit

final class ShimmerCollectionViewCell: UICollectionViewCell {
    static var reuseId: String { String(String(describing: self)) }
    
    private var label: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .orange
        
        // round view corners
        layer.cornerRadius = 20
        layer.masksToBounds = true
        
        contentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    func set(shimmerType: ShimmerType) {
        label.text = shimmerType.title
    }
}
