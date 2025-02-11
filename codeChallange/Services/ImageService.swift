import Foundation

protocol ImageService {
    func fetchImages(for tag: String) async throws -> ImageResponse
}

struct ImageServiceImplementation: ImageService {
    private let session: URLSession = URLSession.shared
    private let decoder: JSONDecoder = JSONDecoder()

    func fetchImages(for tag: String) async throws -> ImageResponse {
        let urlString = ConstantStrings.baseURLString + tag
        guard let url = URL(string: urlString) else {
            throw Errors.invalidURL
        }

        do {
            let (data, _) = try await session.data(from: url)
            let imageResponse = try decoder.decode(ImageResponse.self, from: data)
            return imageResponse
        } catch {
            throw Errors.invalidResponse
        }
    }
}
