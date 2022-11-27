//
//  CharacterCollectionViewCell.swift
//  BreakingBadApp
//
//  Created by Emre Tekin on 25.11.2022.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    
    
    func configureCell(model: CharacterModel){
        nameLabel.text = model.name
        birthdayLabel.text = model.birthday
        nicknameLabel.text = model.nickname
    }

}
