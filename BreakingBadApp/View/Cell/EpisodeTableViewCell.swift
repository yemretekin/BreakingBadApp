//
//  EpisodeTableViewCell.swift
//  BreakingBadApp
//
//  Created by Emre Tekin on 25.11.2022.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!

    func configureCell(model: EpisodeModel){
        seasonLabel.text = "S:\(model.season)"
        episodeLabel.text = "E:\(model.episode)"
        titleLabel.text = "\(model.title)"
    }
    
}
