//
//  EpTableViewCell.swift
//  StarzPlay
//
//  Created by Usama Inaam Rasheed on 4/19/24.
//

import UIKit

class EpTableViewCell: UITableViewCell {

    
    @IBOutlet weak var epImageView: UIImageView!
    @IBOutlet weak var epLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> EpTableViewCell {
        let kEpTableViewCellIdentifier = "kEpTableViewCellIdentifier"
        tableView.register(UINib(nibName: "EpTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: kEpTableViewCellIdentifier)
        let cell = tableView.dequeueReusableCell(withIdentifier: kEpTableViewCellIdentifier, for: indexPath) as! EpTableViewCell
        return cell
    }
    
    func cellDataSetUp(data: Episode){
        epLabel.text = data.name
    }
    
}
