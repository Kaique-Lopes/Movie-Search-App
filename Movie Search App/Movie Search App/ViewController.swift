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
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        field.delegate = self
        
    }
    // MARK: - Fields - ShouldReturn
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchMovies()
        return true
    }
    // MARK: - Fields - Pesquisar Filmes
    func searchMovies() {
        field.resignFirstResponder()
    }
    
    // MARK: - Table numberOfRows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    // MARK: - Table - cellForRow
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    // MARK: - Table didSelect
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

struct Movie {
    
}
