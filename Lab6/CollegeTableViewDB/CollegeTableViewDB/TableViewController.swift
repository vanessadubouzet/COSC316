//
//  TableViewController.swift
//  NavigationControllerTableView
//
//  Created by Vanessa Dubouzet on 2024-02-27.
//

import UIKit

struct Headline {
    var id : Int
    var title : String
}

class TableViewController: UITableViewController {
    
    var headlines = [
        Headline(id: 1, title: "Add a student"),
        Headline(id: 2, title: "Find a student"),
        Headline(id: 3, title: "Update a student"),
        Headline(id: 4, title: "Delete a student")
    ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headlines.count // exact number to be determined later
        // with the data source we used
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
    UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        let headline = headlines[indexPath.row]
        cell.textLabel?.text = headlines[indexPath.row].title
        //                cell.detailTextLabel?.text = headline.text
        //                cell.imageView?.image = UIImage(named: headline.image)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        performSegue(withIdentifier: "ToDetailSegue", sender: self)
        
    }
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "ToDetailSegue" {
            let sdest = segue.destination as? ViewController
            let indexPath = tableView.indexPathForSelectedRow
            let titleString = headlines[(indexPath?.row)!].title
            
            sdest?.titleStringViaSegue = titleString
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
