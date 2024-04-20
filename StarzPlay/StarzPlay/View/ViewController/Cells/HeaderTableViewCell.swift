//
//  HeaderTableViewCell.swift
//  StarzPlay
//
//  Created by Usama Inaam Rasheed on 4/19/24.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var despLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func instanceFromNib() -> HeaderTableViewCell {
        return UINib(nibName: "HeaderTableViewCell", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! HeaderTableViewCell
    }
    
}
