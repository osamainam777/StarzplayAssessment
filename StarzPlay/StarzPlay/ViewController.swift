//
//  ViewController.swift
//  StarzPlay
//
//  Created by Usama Inaam Rasheed on 4/19/24.
//

import UIKit
import TabPageViewController
import AVKit


class ViewController: UIViewController {
    
    @IBOutlet weak var tabbarView: UIView!
    @IBOutlet weak var seasonDespLabel: UILabel!
    @IBOutlet weak var seasonTitleLabel: UILabel!
    @IBOutlet weak var backDropImageView: UIImageView!
    var viewModel: SeasonViewModel!
    var dataSource: SeasonModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData()
    }
    
    func setUp(data: SeasonModel) {
        let tabPageViewController = TabPageViewController()
        
        var tabItem: [(viewController: UIViewController, title: String)]  = []
        
        if let seasons = data.seasons {
            for season in seasons {
                let viewController = ListViewController()
                viewController.seasonId = season.season_number!
                tabItem.append((viewController, season.name ?? ""))
            }
        }
        tabPageViewController.tabItems = tabItem
        tabPageViewController.option.currentColor = UIColor.red
        self.addChild(tabPageViewController)
        tabbarView.addSubview(tabPageViewController.view)
        seasonTitleLabel.text = data.name ?? ""
        seasonDespLabel.text = data.overview ?? ""
        
    }
    
    func fetchData() {
        viewModel = SeasonViewModel()
        viewModel.bindingProductViewModelData = {
            DispatchQueue.main.async {
                if let dataSource = self.viewModel.seasonModel{
                    self.setUp(data: dataSource)
                }
            }
        }
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        playVideo()
    }
    
    @IBAction func trailerButtonTapped(_ sender: Any) {
        playVideo()
    }
    
    func playVideo() {
        guard let videoURL = kVideoURL else {
            print("Invalid video URL")
            return
        }
        
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        present(playerViewController, animated: true) {
            player.play()
        }
    }
}
