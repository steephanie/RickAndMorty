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
    
        let request = RMRequest(
            endpoint: .character,
            queryParameters: [
                URLQueryItem(name: "name", value: "rick"),
                URLQueryItem(name: "status", value: "alive")
            ]
        )
        print(request.url)
        
        RMService.shared.execute(request, expecting: RMCharacter.self) { result in
            
        }
    }

}
