import Foundation
import SwiftUI

struct ImageCell: View {
    let imageURL: URL

    var body: some View {
        AsyncImage(url: imageURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(height: 150)
                    .frame(width: 150)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .frame(width: 150)
            case .failure:
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .frame(width: 150)
                    .foregroundColor(.gray)
            @unknown default:
                EmptyView()
            }
        }
    }
}
