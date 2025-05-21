//
//  HomeService.swift
//  ChefDelivery
//
//  Created by Rafael Lima on 20/05/25.
//

import Foundation
import Alamofire

enum RequestError: Error {
    case invalidURL
    case decodingFailed(error: String)
}

struct HomeService  {
    
    let API_URL = "https://private-5c77e4-cursohttpswiftuialura.apiary-mock.com/home"
    
    // ALAMOFIRE
    func fetchDataAlamo(completion: @escaping ([StoreType]?, Error?) -> Void) {
        AF.request(API_URL).responseDecodable(of: [StoreType].self) { response in
            switch response.result {
                case .success(let stores) :
                    completion(stores, nil)
            default: break
            }
        }
    }
    
    // NATIVO
    func fetchDataNative() async throws -> Result<[StoreType], RequestError> {
        let url = URLRequest(url: URL(string: API_URL)!)
        
        let (data, _) = try await URLSession.shared.data(for: url)
        
        let storeObject = try JSONDecoder().decode([StoreType].self, from: data)
        
        return .success(storeObject)
    }
    
    func confirmOrder(product: ProductType) async throws -> Result<[String: Any]?, RequestError> {
        let url = URLRequest(url: URL(string: API_URL)!)
        
        let encodedObject = try JSONEncoder().encode(product)
        
        var request = URLRequest(url: url.url!)
        request.httpMethod = "POST"
        request.httpBody = encodedObject
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let message = try JSONSerialization.jsonObject(with: data) as? [String: Any]

        return .success(message)
    }
    
}
