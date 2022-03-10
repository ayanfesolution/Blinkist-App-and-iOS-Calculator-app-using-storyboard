//
//  ViewController.swift
//  BlinkistApp
//
//  Created by Decagon on 09/03/2022.
//

import UIKit

struct BookFillDetails: Codable {
       let id: Int
       let title, author: String
       let bookType: BookType
       let length: Int
       let image, welcomeDescription: String
       let access: Access

       enum CodingKeys: String, CodingKey {
           case id, title, author
           case bookType = "book_type"
           case length, image
           case welcomeDescription = "description"
           case access
       }
   }

   enum Access: String, Codable {
       case free = "free"
       case locked = "locked"
   }

   enum BookType: String, Codable {
       case audiobook = "audiobook"
   }

   typealias bookDetails = [BookFillDetails]


class HomeViewController: UIViewController {
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
    }
    
    
    var bookDetails = [BookFillDetails]()
   
    
}

extension HomeViewController : UICollectionViewDataSource {
    
   
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return bookDetails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BlinkistBooksCollectionViewCell", for: indexPath) as! BlinkistBooksCollectionViewCell
        cell.author.text = bookDetails[indexPath.row].author
        cell.title.text = bookDetails[indexPath.row].title
        
        return cell
    }
}






