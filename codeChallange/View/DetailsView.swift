import Foundation
import SwiftUI

struct DetailsView: View {
    var image: ImageModel
    private let detailsFormatter = DetailsFormatter()

    var body: some View {
        VStack {
            if let urlString = image.media?.m, let url = URL(string: urlString) {
                AsyncImage(url: url) { imageState in
                    switch imageState {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                             .scaledToFit()
                             .frame(maxWidth: .infinity, maxHeight: 300)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: 300)
                    @unknown default:
                        EmptyView()
                    }
                }
            }

            Text(image.title ?? "No title")
                .font(.title)
                .padding()

            Text(detailsFormatter.formattedDescription(from: image.description) ?? "No description available")
                .font(.body)
                .padding()

            Text("Author: \(image.author ?? "Unknown")")
                .font(.caption)
                .padding()

            Text("Published: " + detailsFormatter.formattedDate(image.dateTaken))
                .font(.footnote)
                .padding()
        }
        .navigationTitle("Image Details")
    }
}
