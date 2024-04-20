//
//  ListViewController.swift
//  StarzPlay
//
//  Created by Usama Inaam Rasheed on 4/19/24.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel : EpisodeViewModel!
    var seasonId = 0
    var dataSource: EpisodeModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData()
    }
    
    func fetchData() {
        viewModel = EpisodeViewModel()
        viewModel.bindingProductViewModelData = {
            DispatchQueue.main.async {
                if let data = self.viewModel.episodeModel {
                    self.dataSource = data
                    self.tableView.reloadData()
                }
            }
        }
    }
    
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.episodes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = EpTableViewCell.cellForTableView(tableView: tableView, atIndexPath: indexPath)
        cell.cellDataSetUp(data: (dataSource?.episodes?[indexPath.row])!)
        return cell
    }
}
