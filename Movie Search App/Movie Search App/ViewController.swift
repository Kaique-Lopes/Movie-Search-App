//
//  ViewController.swift
//  Movie Search App
//
//  Created by Kaique Lopes de Oliveira on 06/11/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate, UITableViewDataSource{
    
    @IBOutlet var table: UITableView!
    @IBOutlet var field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        field.delegate = self
        
    }


}

