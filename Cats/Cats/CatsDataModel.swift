//
//  CatsDataModel.swift
//  Cats
//
//  Created by Andreas Zikovic on 2021-08-26.
//

import Foundation

struct CatFact: Codable {
    let _id: String?
    let __v: Int?
    let text: String?
    let updatedAt: String?
    let deleted: Bool?
    let source: String?
    let sentCount: Int?
}

extension CatFact: Identifiable {
    var id: String { return _id ?? "" }
}
