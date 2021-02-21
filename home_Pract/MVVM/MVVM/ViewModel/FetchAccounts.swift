//
//  FetchAccounts.swift
//  MVVM
//
//  Created by Tuan on 21/02/2021.
//

import Foundation
import SwiftUI

class FetchAccounts: ObservableObject {
    
    @Published var accounts: [Account] = []
    
    let url = "https://api.github.com/users/hadley/orgs"
    
    func fetchUsers() {
        
        let urlSession = URLSession(configuration: .default)
        
        urlSession.dataTask(with: URL(string: url)!) { (data, _, _) in
            
            guard let users = data else {return}
            
            do{
                let decoder = try JSONDecoder().decode([Account].self, from: users)
                print(decoder)
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
        
    }
    
}
