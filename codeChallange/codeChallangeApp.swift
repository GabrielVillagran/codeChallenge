import SwiftUI

@main
struct codeChallangeApp: App {
    var body: some Scene {
        WindowGroup {
            let imageService = ImageServiceImplementation()
            let viewModel = ImageViewModel(imageService: imageService)
            ImageView(viewModel: viewModel)
        }
    }
}
