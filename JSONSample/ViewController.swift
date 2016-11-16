//
//  ViewController.swift
//  JSONSample
//
//  Created by Sgmedical on 2016/11/14.
//  Copyright © 2016年 Sgmedical. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var foods: [FoodToxic] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        foods = self.uploadSampleData()
        tableView.delegate = self
        tableView.dataSource = self
        foods = self.uploadSampleData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        //let foodsCount = foods.count
        //return foodsCount
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.foods[section].foodName
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.foods[section].toxics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let aFood: FoodToxic = self.foods[indexPath.section]
        cell.textLabel?.text = aFood.toxics[indexPath.row]
        return cell
    }
    
    
    func uploadSampleData() -> [FoodToxic] {
        let url = Bundle.main.url(forResource: "toxics_OKformat", withExtension: "json")
        let jsonData = try! Data(contentsOf: url!)
        var foodToxic : FoodToxic? = nil
        var foodToxics = [FoodToxic]()
        
        //do{
            // Obselete in iOS 10
            // let jsonResult = try NSJSONSerialization.JSONObjctWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            let jsonResult = try! JSONSerialization.jsonObject(with: jsonData) as!NSDictionary
            let foodArray = jsonResult.value(forKey: "FoodTypes") as! NSDictionary
            for food in foodArray{
                let tfoodName: String = food.key as! String
                var tfoodValue: [String] = []
                for item in food.value as! NSDictionary{
                    let tStr = String(describing: item.key) + ": " + String( describing: item.value)
                    tfoodValue.append(tStr)
                }
                foodToxic = FoodToxic(foodName: tfoodName,toxics: tfoodValue)
                foodToxics.append(foodToxic!)
            }
        //} catch {
        //    print("error in parsing JSON")
        //}
        return foodToxics
    }
}

