import Foundation
@testable import codeChallange

class MockImageService: ImageService {
    var failResponse = false

    func fetchImages(for tag: String) async throws -> ImageResponse {
        if !failResponse {
            let media = Media(m: "https://mockPage.com/imageTest")
            return ImageResponse(items: [
                ImageModel(title: "Mock Image", media: media, description: "Mock Image Description", dateTaken: "2025-01-04T14:10:15-08:00", author: "Mock Author")
            ])
        } else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Simulated Error"])
        }
    }
}
