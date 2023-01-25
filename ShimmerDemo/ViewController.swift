//
//  ViewController.swift
//  ShimmerDemo
//
//  Created by Ashish Badak on 25/01/23.
//

import UIKit

final class ViewController: UIViewController {
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 20
        layout.sectionInset = .init(top: 20, left: 20, bottom: 20, right: 20)
        layout.minimumLineSpacing = 20
        let dimension = (UIScreen.main.bounds.width - 60) / 2
        layout.itemSize = CGSize(width: dimension, height: dimension)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        collectionView.register(
            ShimmerCollectionViewCell.self,
            forCellWithReuseIdentifier: ShimmerCollectionViewCell.reuseId
        )
        collectionView.dataSource = self
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ShimmerType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShimmerCollectionViewCell.reuseId, for: indexPath)
        
        if let cell = cell as? ShimmerCollectionViewCell {
            cell.set(shimmerType: ShimmerType.allCases[indexPath.item])
        }
        
        return cell
    }
}
