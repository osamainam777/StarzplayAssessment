//
//  ViewModel.swift
//  StarzPlay
//
//  Created by Usama Inaam Rasheed on 4/20/24.
//

import Foundation

class SeasonViewModel: NSObject {

    private(set) var seasonModel: SeasonModel! {
        didSet {
            self.bindingProductViewModelData()
        }
    }
    
    var bindingProductViewModelData : (()->()) = {}
    
    override init() {
        super.init()
        callAPIServiceLoadSeasonData()
    }
    
    func callAPIServiceLoadSeasonData() {
        let url = kBaseUrl + kApiKey
        NetworkManager.sharedService.getDataFrom(url: url) { result in
            switch result {
            case .success(let data):
                // Handle successful response
                print("Received data:", data.description)
                do {
                    self.seasonModel = try JSONDecoder().decode(SeasonModel.self, from: data)
                    
                    guard let firstElement = self.seasonModel.seasons?.first else {
                        return // The array is empty, nothing to move
                    }
                    self.seasonModel.seasons?.removeFirst()
                    self.seasonModel.seasons?.append(firstElement)
                    
                } catch {
                    print("Error decoding: ", APIHandlerError.decodeError)
                }
                
                // Process the data further as needed
            case .failure(let error):
                // Handle error
                print("Error occurred:", error.localizedDescription)
                
                // Handle different error cases if needed
                if let networkError = error as? NetworkManager.NetworkError {
                    switch networkError {
                    case .invalidURL:
                        print("Invalid URL error")
                    case .invalidResponse:
                        print("Invalid response error")
                    case .noData:
                        print("No data error")
                    case .timeout:
                        print("Timeout error")
                    }
                } else {
                    // Handle other types of errors
                    print("Other error occurred")
                }
            }
        }
    }
}

///Error Handling enums for the HTTP
enum APIHandlerError: Error {
    case fetchError, decodeError, httpError
}
