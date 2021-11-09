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
        
        guard let text = field.text, !text.isEmpty else {
            return
        }
        
        URLSession.shared.dataTask(with: URL(string: "https://www.omdbapi.com/?i=tt3896198&apikey=30121f75&s=fast&type=movie")!,
                                   completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            //Convert
            var result: MovieResult?
            do {
                result = try JSONDecoder().decode(MovieResult.self, from: data)
            } catch {
                
            }
            //Update our movies array
            
            //Refresh our table
            
            
            
        }).resume()
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
 // MARK: - Estrutura do Json
struct MovieResult: Codable {
    let search: [Movie]
}
struct Movie: Codable {
    
    let Title: String
    let Year: String
    let imdbID: String
    let _Type: String
    let Poster: String
     
    private enum CodingKeys: String, CodingKey {
        case Title, Year, imdbID, _Type = "Type ", Poster
    }
}
