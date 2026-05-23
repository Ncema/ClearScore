//
//  ScoreDetailTableViewCell.swift
//  ClearScore
//
//  Created by Rider on 2026/05/01.
//

import UIKit

class ScoreDetailTableViewCell: UITableViewCell {
    
    static let identifier = "ScoreDetailTableViewCell"
    
    
    //MARK: - Outlet
    @IBOutlet weak var labelOne: UILabel! {
        didSet {
            self.labelOne.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            self.labelOne.numberOfLines = 0
        }
    }
    

    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func decorateCell(titleOne: String?, titleTwo: String?) {
        labelOne.text = """
\(titleOne ?? ""): \(titleTwo ?? "")
"""
    }
}
