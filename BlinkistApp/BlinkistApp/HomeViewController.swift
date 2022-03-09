//
//  ViewController.swift
//  BlinkistApp
//
//  Created by Decagon on 09/03/2022.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
    }
    
   
    
}

extension HomeViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return bookDetails
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BlinkistBooksCollectionViewCell", for: indexPath) as! BlinkistBooksCollectionViewCell
        cell.setup(with: bookDetails[indexPath.row])
        return cell
    }
}
