//
//  Drinks.swift
//  Final App
//
//  Created by SBAUser on 5/7/20.
//  Copyright © 2020 Michelle Espinosa. All rights reserved.
//

import Foundation

class DrinksData {

    private struct Returned : Codable {
        var drinks : [Drinks] = []
    }

    var drinkArray: [Drinks] = []
    var url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"
    
    func getData(completed: @escaping ()->()) {
        let urlString = url
        print("We are accessing the url \(urlString)")
        
        
        guard let url = URL(string: urlString) else {
            print("ERROR: Could not create a URL from \(urlString)")
            completed()
            return
        }
        
        
        let session = URLSession.shared
        
        
        let task = session.dataTask(with: url) { (data, respone, error) in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            }
            
            
            
            do {
                let returned = try JSONDecoder().decode(Returned.self, from: data!)
                self.drinkArray = returned.drinks
            } catch {
                print("JSON ERROR: \(error.localizedDescription)")
            }
            completed()
        }
        
        task.resume()
    }
}
 
