//
//  SiteCell.swift
//  SmartyMarty
//
//  Created by Leo on 2023-04-10.
//

import UIKit

class SiteCell: UITableViewCell {
    
    let primaryLabel = UILabel()
    let secondaryLabel = UILabel()
    let myImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        primaryLabel.textAlignment = NSTextAlignment.left
        primaryLabel.font = UIFont.boldSystemFont(ofSize: 60)
        primaryLabel.backgroundColor = UIColor.clear
        primaryLabel.textColor = UIColor.cyan
        
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(primaryLabel)
        contentView.addSubview(myImageView)
        
        
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        var f = CGRect(x: 300, y: 5, width: 460, height:100)
        primaryLabel.frame = f
        
        
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
