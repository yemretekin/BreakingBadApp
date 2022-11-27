//
//  CharacterDetailModel.swift
//  BreakingBadApp
//
//  Created by Emre Tekin on 26.11.2022.
//

import Foundation

struct CharacterDetailModel: Codable {
    let name: String
    let img: String
    let occupation: [String]
    let status: String
    let portrayed: String
}
