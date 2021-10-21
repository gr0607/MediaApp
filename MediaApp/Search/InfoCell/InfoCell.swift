//
//  InfoCell.swift
//  MediaApp
//
//  Created by admin on 21.10.2021.
//

import UIKit

class InfoCell: UITableViewCell {
    
    static let reuseId = "InfoCell"
    
    @IBOutlet weak var contentImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(infoCellModel: MusicViewModel.MusicCell) {
        self.titleLabel.text = infoCellModel.trackName
        self.authorLabel.text = infoCellModel.artistName
    }
}
