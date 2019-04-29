//
//  ViewController.swift
//  Concentration
//
//  Created by Matt Deuschle on 4/28/19.
//  Copyright © 2019 Matt Deuschle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var winLoseLabel: UILabel!
    @IBOutlet var flipCountLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var playAgainButton: UIButton!
    
    private let themes = Theme.shared.getThemes()
    private let spacing: CGFloat = 16.0

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        let nib = UINib(nibName: Cell.reuseIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: Cell.reuseIdentifier)
        collectionView.collectionViewLayout = CollectionViewFlowLayout(spacing: spacing)
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return themes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.reuseIdentifier, for: indexPath) as? Cell else {
            return Cell()
        }
        cell.configure(with: themes[indexPath.row])
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.getSizeFor(numberOfItemsPerRow: 4, spacing: spacing)
    }
}

