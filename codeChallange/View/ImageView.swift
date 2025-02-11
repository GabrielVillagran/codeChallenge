import SwiftUI

struct ImageView: View {

    @StateObject private var viewModel: ImageViewModel
    @State private var searchImageName = ""
    @State private var searchIsActive = false

    private func calculateColumns(for screenWidth: CGFloat) -> [GridItem] {
        let itemWidth: CGFloat = 150
        let columns = max(Int(screenWidth / itemWidth), 1)
        return Array(repeating: GridItem(.flexible()), count: columns)
    }

    private func calculateColumns() -> Int {
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth: CGFloat = 150
        return max(Int(screenWidth / itemWidth), 1)
    }

    init(viewModel: ImageViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            VStack {
                GeometryReader { geometry in
                    let columns = calculateColumns(for: geometry.size.width)
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(viewModel.imageData, id: \.title) { image in
                                if let urlString = image.media?.m, let url = URL(string: urlString) {
                                    NavigationLink(destination: DetailsView(image: image)) {
                                        ImageCell(imageURL: url)
                                            .frame(maxWidth: .infinity)
                                            .background(Color.gray.opacity(0.2))
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }

                .frame(maxHeight: 650)
            }
            .searchable(text: $searchImageName, isPresented: $searchIsActive)
            .onChange(of: searchImageName) {
                DispatchQueue.main.async {
                    viewModel.fetchImages(for: searchImageName)
                }
            }
        }
    }
}
