//
//  ViewController.swift
//  Final App
//
//  Created by SBAUser on 5/7/20.
//  Copyright © 2020 Michelle Espinosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    //var drinks = ["martini", "gin and tonic", "vodka soda", "shirly temple"]
    var drinksData = DrinksData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        drinksData.getData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowSegue" {
            let destination = segue.destination as! DetailViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.drinks = drinksData.drinkArray[selectedIndexPath.row]
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinksData.drinkArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1). \(drinksData.drinkArray[indexPath.row].strDrink)"
        return cell
    }
    
    
}
