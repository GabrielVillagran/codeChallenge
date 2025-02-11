import Foundation

class ImageViewModel: ObservableObject {
    @Published var imageData: [ImageModel] = []
    @Published var errorMessage: String? = nil

    private let imageService: ImageService

    init(imageService: ImageService) {
        self.imageService = imageService
    }

    func fetchImages(for tag: String) {
        Task {
            do {
                let response = try await imageService.fetchImages(for: tag)
                if let images = response.items {
                    DispatchQueue.main.async {
                        self.imageData = images
                    }
                } else {
                    DispatchQueue.main.async {
                        self.errorMessage = ConstantStrings.errorData
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = ConstantStrings.messageError
                }
            }
        }
    }
}
