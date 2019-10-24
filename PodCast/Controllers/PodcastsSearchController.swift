//
//  PodcastsSearchController.swift
//  PodCast
//
//  Created by Sky on 10/23/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit
import Alamofire

class PodcastsSearchController: UITableViewController, UISearchBarDelegate {
    
    let podcasts = [
        Podcast(name: "Lets Build That App", artistName: "Brian Voong"),
        Podcast(name: "Some Podcast", artistName: "Some Others")
    ]
    
    let cellId = "cellId"
    
    // let implement a UISearchController
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
        setupTableView()
    }
    
    //MARK:- Setup Work
    
    fileprivate func setupSearchBar() {
        // display the search bar
        navigationItem.searchController = searchController
        // if hideSearchBarWhenScrolling is true, then the search bar will be hidden until we scroll down
        navigationItem.hidesSearchBarWhenScrolling = false
        // if dimsBackgroundDuringPresentation is true, whenever we click on the search bar, the screen is dark
        searchController.dimsBackgroundDuringPresentation = false
        // we want to handle the text that we search on search bar by using delegate
        searchController.searchBar.delegate = self
        
    }
    
    // after conform UISearchBarDelegate, we need to implement function searchBar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        // later implement Alamofire to search Itunes API
        let url = "https://itunes.apple.com/search?term=\(searchText)"
        AF.request(url).response { (dataResponse) in
            if let err = dataResponse.error {
                print("Failed to contact yahoo", err)
                return
            }
            guard let data = dataResponse.data else { return }
            let dummyString = String(data: data, encoding: .utf8)
            print(dummyString ?? "")
        }
    }
    
    fileprivate func setupTableView() {
        //1. Register a cell for our tableview
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
    }
    
    //MARK:- UITableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let podcast = self.podcasts[indexPath.row]
        cell.textLabel?.text = "\(podcast.name)\n\(podcast.artistName)"
        cell.textLabel?.numberOfLines = -1
        cell.imageView?.image = #imageLiteral(resourceName: "appicon")
        
        return cell
    }
}
