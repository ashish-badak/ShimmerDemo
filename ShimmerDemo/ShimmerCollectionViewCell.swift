//
//  ShimmerCollectionViewCell.swift
//  ShimmerDemo
//
//  Created by Ashish Badak on 25/01/23.
//

import UIKit

final class ShimmerCollectionViewCell: UICollectionViewCell, ShimmerableView {
    static var reuseId: String { String(String(describing: self)) }
    
    private var label: UILabel = {
        let label: UILabel = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private var button: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var isShimmering: Bool = false
    var shimmerDirection = ShimmerDirection.leftToRight
    
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
        
        updateButtonTitle()
        button.addTarget(self, action: #selector(toggleShimmerAnimation), for: .touchUpInside)
        
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(button)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
    
    func set(shimmerType: ShimmerType) {
        label.text = shimmerType.title
        shimmerDirection = shimmerType.shimmerDirection
    }
    
    @objc func toggleShimmerAnimation() {
        if isShimmering {
            stopShimmering()
        } else {
            startShimmering(direction: shimmerDirection)
        }
        
        isShimmering.toggle()
        updateButtonTitle()
    }
    
    
    func updateButtonTitle() {
        if isShimmering {
            button.setTitle("Stop", for: .normal)
        } else {
            button.setTitle("Start", for: .normal)
        }
    }
}
