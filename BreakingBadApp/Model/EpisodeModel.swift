//
//  EpisodeModel.swift
//  BreakingBadApp
//
//  Created by Emre Tekin on 25.11.2022.
//

import Foundation

struct EpisodeModel: Codable {
    let episode_id: Int
    let title: String
    let episode: String
    let season: String
    let characters: [String]
}
