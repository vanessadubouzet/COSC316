//
//  ViewController.swift
//  NavigationControllerTableView
//
//  Created by Vanessa Dubouzet on 2024-02-27.
//

import UIKit

struct Headline {
    var id : Int
    var title : String
    var text : String
    var image : String
}

class TableViewController: UITableViewController {
    
    var headlines = [
        Headline(id: 1, title: "Apple", text: "The apple tree (Malus domestica) is a tree that grows fruit in the rose family best known for its juicy, tasty fruit. ", image: "Apple"),
        Headline(id: 2, title: "Banana", text: "Most banana plants are grown for their fruits, which botanically are a type of berry.", image: "Banana"),
        Headline(id: 3, title: "Cantaloupe", text: "The cantaloupe, rockmelon (Australia), sweet melon, or spanspek (South Africa) is a melon that is a variety of the muskmelon species (Cucumis melo) from the family Cucurbitaceae.", image: "Cantaloupe"),
        ]
    
//    override func numberOfSections (in tableView: UITableView) -> Int {
//    return headlines.count //exact number to be determined later
//     }
     
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return headlines.count // exact number to be determined later
     // with the data source we used
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
    UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
                let headline = headlines[indexPath.row]
                cell.textLabel?.text = headlines[indexPath.row].title
                cell.detailTextLabel?.text = headline.text
                cell.imageView?.image = UIImage(named: headline.image)
    return cell
     }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) ->
//    String? {
//     return "Section \(section)"
//     }

     override func viewDidLoad() {
         super.viewDidLoad()
         // Do any additional setup after loading the view.
         }
    }

