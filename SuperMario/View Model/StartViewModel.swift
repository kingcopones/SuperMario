//
//  StartViewModel.swift
//  SuperMario
//
//  Created by King Copones on 10/21/21.
//

import Foundation

class StartViewModel: ObservableObject {
    @Published var character: [Amiibo] = []
    func fetch() {
        guard let url = URL(string: "https://www.amiiboapi.com/api/amiibo/") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            //Convert to JSON
            do {
                let characters = try JSONDecoder().decode(Response.self, from: data)
                DispatchQueue.main.async {
                    self?.character = characters.amiibo
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}
