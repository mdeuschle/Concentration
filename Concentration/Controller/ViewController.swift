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
    
    let mockStrings = ["😀", "☺️", "😇", "😎", "🤓", "🥶"]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        collectionView.dataSource = self
        let nib = UINib(nibName: Cell.reuseIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: Cell.reuseIdentifier)
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mockStrings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.reuseIdentifier, for: indexPath) as? Cell else {
            return Cell()
        }
        cell.configure(with: mockStrings[indexPath.row])
        return cell
    }
}

