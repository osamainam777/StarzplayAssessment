//
//  StarzPlayTests.swift
//  StarzPlayTests
//
//  Created by Usama Inaam Rasheed on 4/20/24.
//

import XCTest

final class StarzPlayTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testParsingJSON() {
        // Access the main bundle
        let bundle = Bundle(for: type(of: self))
        
        // Path to the JSON file in the bundle
        guard let path = bundle.path(forResource: "data", ofType: "json") else {
            XCTFail("data.json not found")
            return
        }
        
        do {
            // Read JSON data from the file
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            
            // Parse JSON data
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            
            // Your JSON parsing logic here
            // Example:
            if let jsonObject = json as? [String: Any] {
                // Perform assertions or parsing logic
            }
        } catch {
            XCTFail("Error reading JSON file: \(error)")
        }
    }
}
