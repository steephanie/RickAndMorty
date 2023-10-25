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
    
    private let characterListView = CharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Chacacters"         //titulos da navegacoes
        setUpView()
    }
    
    private func setUpView() {
        view.addSubview(characterListView)
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
