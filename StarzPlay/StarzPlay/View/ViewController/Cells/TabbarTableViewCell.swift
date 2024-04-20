//
//  TabbarTableViewCell.swift
//  StarzPlay
//
//  Created by Usama Inaam Rasheed on 4/19/24.
//

import UIKit


class TabbarTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> TabbarTableViewCell {
        let kTabbarTableViewCellIdentifier = "kTabbarTableViewCellIdentifier"
        tableView.register(UINib(nibName: "TabbarTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: kTabbarTableViewCellIdentifier)
        let cell = tableView.dequeueReusableCell(withIdentifier: kTabbarTableViewCellIdentifier, for: indexPath) as! TabbarTableViewCell
        return cell
    }
    
    
    
}
