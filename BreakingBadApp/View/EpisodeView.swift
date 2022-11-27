//
//  EpisodeDetailView.swift
//  BreakingBadApp
//
//  Created by Emre Tekin on 27.11.2022.
//

import UIKit

final class EpisodeView: UIView {
    
    @IBOutlet weak var characterLabel: UILabel!
    @IBOutlet weak var closeBtn: UIButton!

    
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
