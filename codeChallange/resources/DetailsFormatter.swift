import Foundation
import SwiftUI

struct DetailsFormatter {
    
    func formattedDescription(from htmlString: String?) -> AttributedString? {
        guard let htmlString = htmlString else { return nil }
        do {
            let data = Data(htmlString.utf8)
            let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ]
            let attributedString = try NSAttributedString(data: data, options: options, documentAttributes: nil)
            return AttributedString(attributedString)
        } catch {
            return nil
        }
    }

   func formattedDate(_ dateString: String?) -> String {
        guard let dateString = dateString, let date = ISO8601DateFormatter().date(from: dateString) else { return "N/A" }
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}
