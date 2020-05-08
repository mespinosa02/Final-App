//
//  DetailViewController.swift
//  Final App
//
//  Created by SBAUser on 5/8/20.
//  Copyright © 2020 Michelle Espinosa. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var detailInstructionsLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var measurement1Label: UILabel!
    @IBOutlet weak var ingredient1Label: UILabel!
    @IBOutlet weak var measurement2Label: UILabel!
    @IBOutlet weak var ingredient2Label: UILabel!
    @IBOutlet weak var measurement3Label: UILabel!
    @IBOutlet weak var ingredient3Label: UILabel!
    @IBOutlet weak var drinkImage: UIImageView!
    
    
     var drinks: Drinks!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            
            if drinks == nil {
                drinks = Drinks(strDrink:"", strInstructions:"", strIngredient1:"", strIngredient2: "", strIngredient3: "", strMeasure1: "", strMeasure2: "", strMeasure3: "", strDrinkThumb: "", url: "")
            }

         let drinkDetail = DrinkDetail()
         drinkDetail.url = drinks.url
             
            updateUserInterface()
    }
    func updateUserInterface() {
        nameLabel.text = drinks.strDrink
        detailInstructionsLabel.text = drinks.strInstructions
        ingredient1Label.text = drinks.strIngredient1
        ingredient2Label.text = drinks.strIngredient2
        ingredient3Label.text = drinks.strIngredient3
        measurement1Label.text = drinks.strMeasure1
        measurement2Label.text = drinks.strMeasure2
        measurement3Label.text = drinks.strMeasure3
        
        guard let url = URL(string: "strDrinkThumb") else {
            self.drinkImage.image = UIImage(systemName: "person.crop.circle.badge.xmark")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            self.drinkImage.image = UIImage(data: data)
        } catch {
            print("ERROR: thrown trying to get image from URL \(url)")
        }
        }
        
    }
