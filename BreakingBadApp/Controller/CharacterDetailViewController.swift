//
//  CharacterDetailViewController.swift
//  BreakingBadApp
//
//  Created by Emre Tekin on 26.11.2022.
//

import UIKit
import Kingfisher

class CharacterDetailViewController: BaseViewController {
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailNicknameLabel: UILabel!
    @IBOutlet weak var detailStatusLabel: UILabel!
    @IBOutlet weak var detaiPortrayedLabel: UILabel!
    
    var selectedCharacter: CharacterModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let character = selectedCharacter else { return }
        indicator.startAnimating()
        Client.getCharacterDetail(character: selectedCharacter!.char_id) { detail, error in
            self.detailNameLabel.text = "Name: \(character.name)"
            self.detailNicknameLabel.text = "Nickname: \(character.nickname)"
            self.detailStatusLabel.text = "Status: \(character.status)"
            self.detaiPortrayedLabel.text = "Portrayed: \(character.portrayed)"
            
            if let url = URL(string: (character.img)){
                DispatchQueue.main.async {
                    self.detailImageView.kf.setImage(with: url, placeholder: UIImage(named: "k"))
                }
            }
            self.indicator.stopAnimating()
            
            
        }
    }

    @IBAction func clickButtonPressed(_ sender: Any) {
        
        let quoteVC = storyboard?.instantiateViewController(withIdentifier: "QuoteViewController") as? QuoteViewController
        quoteVC?.selected = selectedCharacter
        navigationController?.pushViewController(quoteVC!, animated: true)
    }
    
}
