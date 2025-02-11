import Foundation

struct ImageModel: Codable {
    let title: String?
    let media: Media?
    let description: String?
    let dateTaken: String?
    let author: String?

    enum CodingKeys: String, CodingKey {
        case title
        case media
        case description
        case dateTaken = "date_taken"
        case author
    }
}

struct Media: Codable {
    let m: String?
}
