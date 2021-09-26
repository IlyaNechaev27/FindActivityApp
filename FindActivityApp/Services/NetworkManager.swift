//
//  NetworkManager.swift
//  FindActivityApp
//
//  Created by Илья Нечаев on 26.09.2021.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private let url = "http://www.boredapi.com/api/activity/"
    
    func getResult(completed: @escaping (Result<Activity, ErrorMessage>) -> Void) {
        guard let url = URL(string: url) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
              
                let activity = try decoder.decode(Activity.self, from: data)
                
                completed(.success(activity))
                
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
              
    private init() {}
}
