import XCTest
import SwiftUI
@testable import codeChallange

final class TestDetailsView: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()

    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func testDetailsViewDisplayInfo() {
        // Given
        let mockImage = ImageModel(
            title: "Test Title",
            media: Media(m: "https://mockurl.com"),
            description: "Test Description",
            dateTaken: "2021-01-01",
            author: "Test Author"
        )
        // When
        let detailsView = DetailsView(image: mockImage)
        let hostingVC = UIHostingController(rootView: detailsView)
        // Then
        XCTAssertNotNil(hostingVC.view, "Details shown as expected")
    }
}
