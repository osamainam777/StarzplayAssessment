//
//  EpisodeViewModel.swift
//  StarzPlay
//
//  Created by Usama Inaam Rasheed on 4/20/24.
//

import Foundation

class EpisodeViewModel: NSObject {
    
    private(set) var episodeModel: EpisodeModel! {
        didSet {
            self.bindingProductViewModelData()
        }
    }
    var seasonId : Int?
    var bindingProductViewModelData : (()->()) = {}
    
    override init() {
        super.init()
        callAPIServiceLoadSeasonData()
    }
    
    func callAPIServiceLoadSeasonData() {
        let url = "\(kBaseUrl)/season/(\(seasonId ?? 1)\(kApiKey)"
        
        NetworkManager.sharedService.getDataFrom(url: url) { result in
            switch result {
            case .success(let data):
                // Handle successful response
                print("Received data:", data.description)
                do {
                    self.episodeModel = try JSONDecoder().decode(EpisodeModel.self, from: data)
                    
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
