//
//  EpisodeDetailView.swift
//  BreakingBadApp
//
//  Created by Emre Tekin on 27.11.2022.
//

import UIKit

class EpisodeView: UIView {
    
    
    var selectedEpisode = ""
    
    @IBOutlet weak var viewTableView: UITableView! {
        didSet {
            viewTableView.dataSource = self
            viewTableView.delegate = self
        }
    }
    @IBOutlet weak var closeBtn: UIButton!
    
    var characterArray: [String]? {
        didSet {
            viewTableView.reloadData()
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
        
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    
    func customInit() {
        let nib = UINib(nibName: "EpisodeView", bundle: nil)
        if let view = nib.instantiate(withOwner: self).first as? UIView {
            addSubview(view)
            view.frame = self.bounds
        }
        
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        removeFromSuperview()
    }
    
}
extension EpisodeView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = characterArray?[indexPath.row]
        cell.textLabel?.textAlignment = .center
        return cell
    }
}


