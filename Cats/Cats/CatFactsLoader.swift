//
//  CatsDataLoader.swift
//  Cats
//
//  Created by Andreas Zikovic on 2021-08-26.
//

import Foundation

class CatFactsLoader {
    
    func loadCatFacts(completionHandler: @escaping ([CatFact]) -> Void) {
        
        guard let url = URL(string: "https://cat-fact.herokuapp.com/facts/random?animal_type=cat&amount=10") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let error = error {
                print("Error message: ", error)
            } else {
                if let data = data {
                    do {
                        let catFacts = try JSONDecoder().decode([CatFact].self, from: data)
                        completionHandler(catFacts)
                    } catch let decoderError {
                        print("Decoder Error message: ", decoderError)
                    }
                }
            }
            
        }.resume()
    }
}
