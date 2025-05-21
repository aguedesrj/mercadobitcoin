//
//  ExchangeListViewModelTests.swift
//  MercadoBitcoin
//
//

import XCTest
@testable import MercadoBitcoin

final class ExchangeListViewModelTests: XCTestCase {
    private var viewModel: ExchangeListViewModelProtocol!
    private var loadingStates: [Bool]!
    private var receivedExchanges: [[Exchange]]!
    private var receivedError: Error?
    
    // MARK: - Helper to load JSON fixture
    private func loadJSONFixture<T: Decodable>(named filename: String, as type: T.Type) -> T {
        let bundle = Bundle(for: ExchangeListViewModelTests.self)
        guard let url = bundle.url(forResource: filename, withExtension: "json") else {
            fatalError("❌ Missing fixture file: \(filename).json")
        }
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            fatalError("❌ Failed to load or decode \(filename).json: \(error)")
        }
    }

    override func setUp() {
        super.setUp()
        loadingStates = []
        receivedExchanges = []
        receivedError = nil
    }

    override func tearDown() {
        viewModel = nil
        loadingStates = nil
        receivedExchanges = nil
        receivedError = nil
        super.tearDown()
    }
    
    func testFetchExchangesSuccess_fromJSONFixture() {
        let exchanges: [Exchange] = loadJSONFixture(named: "exchanges_list", as: [Exchange].self)
        viewModel = ExchangeListViewModel(service: StubExchangeService(result: .success(exchanges)))

        viewModel.toggleLoading = { [weak self] isLoading in
            self?.loadingStates.append(isLoading)
        }
        viewModel.success = { [weak self] exchanges in
            self?.receivedExchanges.append(exchanges)
        }
        viewModel.error = { [weak self] error in
            self?.receivedError = error
        }

        // When
        viewModel.fetchExchanges()

        // Then
        XCTAssertEqual(loadingStates, [true, false], "Loading should start then stop")
        XCTAssertNil(receivedError, "Should not receive an error on success")
        XCTAssertEqual(receivedExchanges.count, 1, "Success closure should be called once")
        XCTAssertEqual(receivedExchanges.first?.count, exchanges.count, "Loaded count should match fixture count")
    }

    func testFetchExchangesFailure() {
        let expectedError = NSError(domain: "Test", code: 42, userInfo: nil)
        viewModel = ExchangeListViewModel(service: StubExchangeService(result: .failure(expectedError)))

        viewModel.toggleLoading = { [weak self] isLoading in
            self?.loadingStates.append(isLoading)
        }
        viewModel.success = { _ in
            XCTFail("Success should not be called on failure")
        }
        viewModel.error = { [weak self] error in
            self?.receivedError = error
        }

        // When
        viewModel.fetchExchanges()

        // Then
        XCTAssertEqual(loadingStates, [true, false], "Loading should start then stop even on failure")
        XCTAssertNotNil(receivedError, "Should receive an error on failure")
        XCTAssertEqual((receivedError as NSError?)?.code, expectedError.code)
    }
}

private class StubExchangeService: ExchangeService {
    private let result: Result<[Exchange], Error>
    init(result: Result<[Exchange], Error>) {
        self.result = result
    }
    func fetchExchanges(completion: @escaping (Result<[Exchange], Error>) -> Void) {
        completion(result)
    }
}
