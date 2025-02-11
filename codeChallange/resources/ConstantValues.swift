import Foundation


enum Errors: Error {
    case invalidURL
    case invalidResponse
}

enum ConstantStrings {
    static let baseURLString = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags="
    static let errorData = "No images found"
    static let messageError = "Fail loading image"
}

enum DetailsTitles {
    static let title = "Image Details"
}
