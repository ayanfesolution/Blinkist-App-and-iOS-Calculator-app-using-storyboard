
import UIKit

struct BookFileDetails: Codable {
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

typealias bookDetails = [BookFileDetails]



