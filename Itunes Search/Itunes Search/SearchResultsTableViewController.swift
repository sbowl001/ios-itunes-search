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
        
        var sortedResults : [SearchResult]
        
        switch self.filterSegmentedControl.selectedSegmentIndex {
        case 1:
            
            sortedResults = self.results.filter {$0.course == "Apps"}
        case 2:
            sortedResults = self.results.filter {$0.course == "Music"}
        case 3:
            sortedResults = self.students.filter {$0.course == "Movie"}
        default:
            sortedResults = self.students
            
        }
        
        if self.sortSegmentedControl.selectedSegmentIndex == 0 {
            sortedAndFilteredStudents = sortedAndFilteredStudents.sorted { $0.firstName < $1.firstName }
            
        } else  {
            sortedAndFilteredStudents = sortedAndFilteredStudents.sorted { $0.lastName < $1.lastName}
        }  //can't visualize this
        self.studentTableViewController.students = sortedAndFilteredStudents
        
    }
        
        }
        
        
  
//        Using a conditional statement like a switch or if-else, check the segmented control's selectedSegmentIndex property. The selectedSegmentIndex is an integer value that represents which segment is currently selected. Since this segmented control has three segments, its possible indexes will be 0, 1, or 2. Set the resultType's value to the correct case for each possible selectedSegmentIndex value. (for example, 0 would be .software since the selected segment would be apps.)
//        Call the performSearch method of the searchResultsController. Pass in the search term, and the resultType. In the completion closure of this method, check for errors. If there is no error, reload the table view on the correct queue.


    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.searchResultsController.searchResults.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let searchResult = searchResultsController.searchResults[indexPath.row]
        cell.textLabel?.text = searchResult.title
        cell.detailTextLabel?.text = searchResult.creator
        return cell
    }
  

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
