import XCTest
@testable import codeChallange

final class TestFecthImages: XCTestCase {

    var imageViewModel: ImageViewModel!
    var mockImageService: MockImageService!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockImageService = MockImageService()
        imageViewModel = ImageViewModel(imageService: mockImageService)
    }

    override func tearDownWithError() throws {
        imageViewModel = nil
        mockImageService = nil
        try super.tearDownWithError()
    }

    func testFetchImageCorrect() async throws {
        // Given
        mockImageService.failResponse = false

        // When
        await imageViewModel.fetchImages(for: "testCase")

        // Then
        XCTAssertEqual(imageViewModel.imageData.count, 1)
        XCTAssertEqual(imageViewModel.imageData.first?.title, "Mock Image")
        XCTAssertEqual(imageViewModel.imageData.first?.description, "Mock Image Description")
        XCTAssertEqual(imageViewModel.imageData.first?.author, "Mock Author")
        XCTAssertEqual(imageViewModel.imageData.first?.media?.m, "https://mockPage.com/imageTest")
    }
}
