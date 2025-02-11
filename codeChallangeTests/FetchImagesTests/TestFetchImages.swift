import XCTest
@testable import codeChallange

final class TestFetchImages: XCTestCase {

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

    func testFetchImageSuccess() async throws {
        // Given
        mockImageService.failResponse = false

        // When
        await imageViewModel.fetchImages(for: "testCase")

        // Then
        XCTAssertEqual(imageViewModel.imageData.first?.title, "Mock Image")
        XCTAssertEqual(imageViewModel.imageData.first?.description, "Mock Image Description")
        XCTAssertEqual(imageViewModel.imageData.first?.author, "Mock Author")
        XCTAssertEqual(imageViewModel.imageData.first?.media?.m, "https://mockPage.com/imageTest")
    }

    func testFetchImageFailure() async throws {
        // Given
        mockImageService.failResponse = true

        // When
        await imageViewModel.fetchImages(for: "testCase")

        // Then
        XCTAssertTrue(imageViewModel.imageData.isEmpty, "Expected imageData to be empty due to failure but found items.")
    }
}
