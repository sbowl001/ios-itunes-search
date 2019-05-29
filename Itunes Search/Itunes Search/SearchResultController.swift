//
//  SearchResultController.swift
//  Itunes Search
//
//  Created by Stephanie Bowles on 5/28/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import Foundation

class SearchResultController {
    let baseURL = URL(string: "https://itunes.apple.com/search")!
    
    var searchResults: [SearchResult] = []
    
    func performSearch(searchTerm: String, resultType: ResultType, completion: @escaping (Error?) ->  Void) {
//        This function should use URLSession's dataTask(with: URL, completion: ...) method to create a data task. Remember to call .resume().
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true   )
     
        let searchQueryItem = URLQueryItem(name: "term", value: searchTerm)
         let searchEntityQueryItem = URLQueryItem(name: "entity", value: resultType.rawValue)
        urlComponents?.queryItems = [searchQueryItem, searchEntityQueryItem] //add term

        
        guard let requestURL = urlComponents?.url else {NSLog("requestURL is nil"); completion(nil); return}
        
        var request = URLRequest(url: requestURL)
        print(request)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("error fetching data \(error)")
                completion(error)
             
                //        Give names to the return types.
                //        Check for errors. If there is an error, call completion with the error.
            }
          //        Unwrap the data. If there is no data, call completion, and return NSError() in it.
            guard let data = data else {
                NSLog("No data returned from data task")
                completion(nil)
                return
            }
            
            //        If you do get data back, use a do-try-catch block and JSONDecoder to decode SearchResults from the data returned from the data task. Create a constant for this decoded SearchResults object.
 
            do {
               let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let resultSearch = try jsonDecoder.decode(SearchResults.self, from: data )
                self.searchResults = resultSearch.results
                
                //could do breakpoint here to debug
                //        Set the value of the searchResults variable in this model controller to the SearchResults' results array.
                //        Still in the do statement, call completion with nil.

            } catch {
                NSLog("Unable to decode data into object of type []: \(error)")
                   //        In the catch statement, call completion with error.
                completion(error)
            }
            completion(nil)
         
        } .resume ()
            
            
        }

}
