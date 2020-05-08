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
    @IBOutlet weak var measurement4Label: UILabel!
    @IBOutlet weak var ingredient4Label: UILabel!
    @IBOutlet weak var measurement5Label: UILabel!
    @IBOutlet weak var ingredient5Label: UILabel!
    
     var drinks: Drinks!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            
            if drinks == nil {
                drinks = Drinks(strDrink:"", strInstructions:"", strIngredient1:"", strIngredient2: "", strIngredient3: "", strIngredient4: "", strIngredient5: "", strMeasure1: "", strMeasure2: "", strMeasure3: "", strMeasure4: "", strMeasure5: "")
            }
            nameLabel.text = drinks.strDrink
            detailInstructionsLabel.text = ""
            ingredient1Label.text = ""
            ingredient2Label.text = ""
            ingredient3Label.text = ""
            ingredient4Label.text = ""
            ingredient5Label.text = ""
            measurement1Label.text = ""
            measurement2Label.text = ""
            measurement3Label.text = ""
            measurement4Label.text = ""
            measurement5Label.text = ""
             
           
            let drinksDetail = DrinksDetail()
            drinksDetail.getData {
                DispatchQueue.main.async {
                    self.detailInstructionsLabel.text = "\(drinksDetail.strInstructions)"
                    self.ingredient1Label.text = "\(drinksDetail.strIngredient1)"
                    self.ingredient2Label.text = "\(drinksDetail.strIngredient2)"
                    self.ingredient3Label.text = "\(drinksDetail.strIngredient3)"
                    self.ingredient4Label.text = "\(drinksDetail.strIngredient4)"
                    self.ingredient5Label.text = "\(drinksDetail.strIngredient5)"
                    self.measurement1Label.text = "\(drinksDetail.strMeasure1)"
                    self.measurement2Label.text = "\(drinksDetail.strMeasure2)"
                    self.measurement3Label.text = "\(drinksDetail.strMeasure3)"
                    self.measurement4Label.text = "\(drinksDetail.strMeasure4)"
                    self.measurement5Label.text = "\(drinksDetail.strMeasure5)"
                    
                }
            }
        }
        
    }
