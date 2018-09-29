//
//  ViewController.swift
//  HitList-CoreData
//
//  Created by Mac on 29/09/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit



class ViewController: UIViewController,UITableViewDataSource {
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var names:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "The List"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func addNames(_ sender: Any) {
        let alert = UIAlertController(title: "New Name", message: "Add a New Name", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) { (action) in
           guard let textField = alert.textFields?.first,
            let nameToSave = textField.text else{
            return
        }
            self.names.append(nameToSave)
            self.tableView.reloadData()
     }
      
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel)
        
        alert.addTextField()
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
   
    
   
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return names.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }

    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

