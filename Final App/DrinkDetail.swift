//
//  DrinkDetail.swift
//  Final App
//
//  Created by SBAUser on 5/8/20.
//  Copyright © 2020 Michelle Espinosa. All rights reserved.
//
import Foundation

class DrinkDetail {
    var strDrink = ""
    var strInstructions = ""
    var strIngredient1 = ""
    var strIngredient2 = ""
    var strIngredient3 = ""
    var strMeasure1 = ""
    var strMeasure2 = ""
    var strMeasure3 = ""
    var strDrinkThumb = ""
    var url = ""
    
    private struct Returned: Codable {
        var strDrink : String
        var strInstructions : String
        var strIngredient1 : String
        var strIngredient2 : String
        var strIngredient3 : String
        var strMeasure1 : String
        var strMeasure2 : String
        var strMeasure3 : String
        var strDrinkThumb : String
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
                self.strDrinkThumb = returned.strDrinkThumb
               } catch {
                   print("JSON ERROR: \(error.localizedDescription)")
               }
               completed()
           }
           
           task.resume()
       }
}
