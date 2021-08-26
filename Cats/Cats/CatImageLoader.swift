//
//  CatImageLoader.swift
//  Cats
//
//  Created by Andreas Zikovic on 2021-08-26.
//

import Foundation
import SwiftUI

class CatImageLoader {
    
    func loadCatUIImage() -> UIImage? {
        
        guard let url = URL(string: "https://cataas.com/cat") else {
            print("Invalid URL")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url, options: [])
            if let uiImage = UIImage(data: data) {
                return uiImage
            } else {
                print("Could not turn data into UIImage")
                return nil
            }
        } catch {
            print("There was an Error")
            return nil
        }
    }
}
