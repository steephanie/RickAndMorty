//
//  RMCaracterViewController.swift
//  RickAndMorty
//
//  Created by Stephanie on 19/10/23.
//

import UIKit

/// Controller to show and search for Chacaracters
// Controller para mostrar e procurar personagens;
final class RMCaracterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Chacacters"         //titulos da navegacoes
        
        RMService.shared.execute(.listCharacterRequests, expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print("Total: "+String(model.info.count))
                print("Total result pages: "+String(model.info.pages))
                print("Page result count: "+String(model.results.count))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
