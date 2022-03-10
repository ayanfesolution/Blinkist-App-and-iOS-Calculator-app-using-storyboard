//
//  BlinkistBooksCollectionViewCell.swift
//  BlinkistApp
//
//  Created by Decagon on 09/03/2022.
//

import UIKit

class BlinkistBooksCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var access: UIImageView!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var book_type: UILabel!
    @IBOutlet weak var lenght: UILabel!
   
    func setup(with book: BookFillDetails) {
        
        lenght.text = String(book.length)
        book_type.text = book.bookType.rawValue
        author.text = book.author
       // access.image = book.
        title.text = book.title
       // image.image = book.
        
    }
}
