//
//  GetAssets.swift
//  BreakingBadApp
//
//  Created by Emre Tekin on 25.11.2022.
//

import Foundation

struct CharacterModel: Codable {
    let char_id : Int
    let name: String
    let birthday: String
    let nickname: String
    let img: String
    let occupation: [String]
    let status: String
    let portrayed: String
}
