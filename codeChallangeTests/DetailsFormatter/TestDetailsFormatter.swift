import XCTest
@testable import codeChallange

final class TestDetailsFormatter: XCTestCase {

    private var detailsFormatter: DetailsFormatter!

    override func setUpWithError() throws {
        try super.setUpWithError()
        detailsFormatter = DetailsFormatter()
    }

    override func tearDownWithError() throws {
        detailsFormatter = nil
        try super.tearDownWithError()
    }

    func testDescriptionFormatter() throws {
        // Given
        let description = "<p><a href=\"https://www.flickr.com/people/107626626@N06/\">ildikoannable</a> posted a photo:</p> <p><a href=\"https://www.flickr.com/photos/107626626@N06/54249235448/\" title=\"Porcupine\"><img src=\"https://live.staticflickr.com/65535/54249235448_7a10b2308b_m.jpg\" width=\"240\" height=\"163\" alt=\"Porcupine\" /></a></p> <p>Porcupine spotted on the ground snacking on twigs.</p>"

        // When
        let formattedDescription = detailsFormatter.formattedDescription(from: description)

        // Then
        XCTAssertNotNil(formattedDescription)

        if let formattedDescription = formattedDescription {
            let descriptionString = formattedDescription.description
            XCTAssertTrue(descriptionString.contains("posted a photo:"))
        } else {
            XCTFail("formattedDescription is nil")
        }
    }
}
