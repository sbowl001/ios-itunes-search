//
//  SearchResultsTableViewController.swift
//  Itunes Search
//
//  Created by Stephanie Bowles on 5/28/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchControl: UISegmentedControl!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let searchResultsController = SearchResultController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.delegate = self
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchTerm = self.searchBar.text else {return}
        
        var resultType: ResultType!
        
        
        switch searchTerm {
        case 0:
            resultType = .software
            
        case 1:
            resultType = .musicTrack
            
        case 2:
            resultType = .movie
        default:
            break
        }
        //        Using a conditional statement like a switch or if-else, check the segmented control's selectedSegmentIndex property. The selectedSegmentIndex is an integer value that represents which segment is currently selected. Since this segmented control has three segments, its possible indexes will be 0, 1, or 2. Set the resultType's value to the correct case for each possible selectedSegmentIndex value. (for example, 0 would be .software since the selected segment would be apps.)
        searchResultsController.performSearch(searchTerm: searchTerm, resultType: resultType) { (error) in
            if let error = error {
                NSLog("Error with search \(error)")
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        //        Call the performSearch method of the searchResultsController. Pass in the search term, and the resultType. In the completion closure of this method, check for errors. If there is no error, reload the table view on the correct queue.
        
    }
    
    
    
    
    
    
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.searchResultsController.searchResults.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath)
        
        let searchResult = searchResultsController.searchResults[indexPath.row]
        cell.textLabel?.text = searchResult.title
        cell.detailTextLabel?.text = searchResult.creator
        return cell
    }
  
}
