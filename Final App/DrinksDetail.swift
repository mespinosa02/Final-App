//
//  DrinksDetail.swift
//  Final App
//
//  Created by SBAUser on 5/8/20.
//  Copyright © 2020 Michelle Espinosa. All rights reserved.
//

import Foundation

class DrinksDetail {
    var strDrink = ""
    var strInstructions = ""
    var strIngredient1 = ""
    var strIngredient2 = ""
    var strIngredient3 = ""
    var strIngredient4 = ""
    var strIngredient5 = ""
    var strMeasure1 = ""
    var strMeasure2 = ""
    var strMeasure3 = ""
    var strMeasure4 = ""
    var strMeasure5 = ""
    var url = ""
    
    private struct Returned: Codable {
        var strDrink: String
        var strInstructions: String
        var strIngredient1 : String
        var strIngredient2 : String
        var strIngredient3 : String
        var strIngredient4 : String
        var strIngredient5 : String
        var strMeasure1 : String
        var strMeasure2 : String
        var strMeasure3 : String
        var strMeasure4 : String
        var strMeasure5 : String
    }

    
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
                self.strDrink = returned.strDrink
                self.strInstructions = returned.strInstructions
                self.strIngredient1 = returned.strIngredient1
                self.strIngredient2 = returned.strIngredient2
                self.strIngredient3 = returned.strIngredient3
                self.strIngredient4 = returned.strIngredient4
                self.strIngredient5 = returned.strIngredient5
                self.strMeasure1 = returned.strMeasure1
                self.strMeasure2 = returned.strMeasure2
                self.strMeasure3 = returned.strMeasure3
                self.strMeasure4 = returned.strMeasure4
                self.strMeasure5 = returned.strMeasure5
                
               } catch {
                   print("JSON ERROR: \(error.localizedDescription)")
               }
               completed()
           }
           
           task.resume()
       }
}
