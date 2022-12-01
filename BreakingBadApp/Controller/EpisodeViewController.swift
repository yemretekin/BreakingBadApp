//
//  EpisodeViewController.swift
//  BreakingBadApp
//
//  Created by Emre Tekin on 24.11.2022.
//

import UIKit

class EpisodeViewController: BaseViewController {
    var viewPopUp : EpisodeView!
    var selectedEpisode: EpisodeModel?
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UINib(nibName: "EpisodeTableViewCell", bundle: nil), forCellReuseIdentifier: "episodeCell")
        }
    }
    var episodesActor: [EpisodeModel]?
    
    var episodes: [EpisodeModel]?{
        didSet{
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
        Client.getEpisodes {[weak self] episodes, error in
            guard let self = self else { return }
            self.episodes = episodes
            self.indicator.stopAnimating()
            
        }
        
    }
    
}

extension EpisodeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath) as? EpisodeTableViewCell,
              let model = episodes?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.configureCell(model: model)
        self.selectedEpisode = model
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        self.viewPopUp = EpisodeView(frame: CGRect(origin: CGPointMake(view.center.x - 125, view.center.y - 125), size: CGSize(width: 250, height: 250)))
        self.view.addSubview(viewPopUp)
        self.viewPopUp.characterArray = episodes?[indexPath.row].characters ?? []
    }
    
    
}
