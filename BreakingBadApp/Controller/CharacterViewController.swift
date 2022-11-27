//
//  CharacterViewController.swift
//  BreakingBadApp
//
//  Created by Emre Tekin on 24.11.2022.
//

import UIKit

class CharacterViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(UINib(nibName: "CharacterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "characterCell")
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 5
            layout.minimumInteritemSpacing = 5
            collectionView.setCollectionViewLayout(layout, animated: true)
        }
    }
    
    var characters: [CharacterModel]? {
        didSet{
            collectionView.reloadData()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        indicator.startAnimating()
        Client.getCharacters {[weak self] characters, error in
            guard let self = self else { return }
            self.characters = characters
            self.indicator.stopAnimating()
        }

    }
}
    
    
    extension CharacterViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return characters?.count ?? 0
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath) as? CharacterCollectionViewCell,
                  let model = characters?[indexPath.row] else {
                return UICollectionViewCell()
            }
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 20
            //cell.backgroundColor = .systemGray5
            cell.configureCell(model: model)
            return cell
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let gridLayout = collectionViewLayout as! UICollectionViewFlowLayout
            let widthPerItem = collectionView.frame.width / 2 - gridLayout.minimumInteritemSpacing
            return CGSize(width:widthPerItem, height:120)
        }
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "CharacterDetailViewController") as? CharacterDetailViewController,
            let selectedCharacter = characters?[indexPath.row] else { return }
            detailVC.selectedCharacter = selectedCharacter
            navigationController?.pushViewController(detailVC, animated: true)
        }
        
        }
        
        
        


