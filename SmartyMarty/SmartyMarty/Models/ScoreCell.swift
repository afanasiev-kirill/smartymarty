//
//  ScoreCell.swift
//  SmartyMarty
//
//  Created by Kirill Afanasiev on 2023-04-19.
//

import Foundation
import UIKit

class ScoreCell: UITableViewCell {
    // Set up the labels and image view that will display the score.
    let scoreLabel = UILabel()
    let secondaryLabel = UILabel()
    let myImageView = UIImageView()

    // This method is called when the cell is initialized. Set up the scoreLabel to be left-aligned and bold, with a cyan text color.
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        scoreLabel.textAlignment = NSTextAlignment.left
        scoreLabel.font = UIFont.boldSystemFont(ofSize: 60)
        scoreLabel.backgroundColor = UIColor.clear
        scoreLabel.textColor = UIColor.cyan
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Add the scoreLabel and myImageView to the content view of the cell.
        contentView.addSubview(scoreLabel)
        contentView.addSubview(myImageView)
    }

    // This method is called when the cell is initialized from a storyboard.
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // This method is called whenever the layout of the cell's subviews is updated.
    override func layoutSubviews() {
        
        var f = CGRect(x: 300, y: 5, width: 460, height:100)
        scoreLabel.frame = f
        
        f = CGRect(x: 5, y: 5, width: 100, height: 100)
        myImageView.frame = f
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
