import SwiftUI

struct ImageView: View {

    @StateObject private var viewModel: ImageViewModel
    @State private var searchImageName = ""
    @State private var searchIsActive = false

    private var calculateColumnsSize: [GridItem] {
        Array(repeating: GridItem(.flexible()), count: calculateColumns())
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
                ScrollView {
                    LazyVGrid(columns: calculateColumnsSize, spacing: 20) {
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
                .frame(maxHeight: 650)
            }
            .searchable(text: $searchImageName, isPresented: $searchIsActive)
            .onChange(of: searchImageName) { newValue in
                DispatchQueue.main.async {
                    print(searchIsActive, searchImageName)
                    viewModel.fetchImages(for: newValue)
                }
            }
        }                   
    }
}
