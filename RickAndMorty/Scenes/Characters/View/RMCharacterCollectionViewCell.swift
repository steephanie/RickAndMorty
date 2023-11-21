//
//  RMCharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Stephanie on 22/10/23.
//

import UIKit

// Cards dos personagens;
final class RMCharacterCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterCollectionViewCell"
    
    // Ajuste da imagem;
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // Ajuste de label;
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Ajuste da status;
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - CARDS, LABEL e STATUS
    
    // Informacoes para tela;
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubviews(imageView, nameLabel, statusLabel)
        addCostraints()
        setUpLayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    // Fundo do card;
    private func setUpLayer() {
        contentView.layer.cornerRadius = 8
        contentView.layer.shadowColor = UIColor.label.cgColor
        contentView.layer.cornerRadius = 4
        contentView.layer.shadowOffset = CGSize(width: -4, height: 4)
        contentView.layer.shadowOpacity = 0.3
    }
    
    // Definição de espaçamentos dos cards com as imagens, label e status;
    private func addCostraints() {
       // // TODO: RETORNAR AQUI E CRIAR UM IF PARA QUANDO FOR UM UNICO CARD QUE VAI APARECER
       // let isSingleCard: Bool = false
       // if isSingleCard {
       //     NSLayoutConstraint.activate([
       //         imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
       //         imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
       //         nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
       //         nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
       //         statusLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
       //         statusLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
       //     ])
       // } else {
            
            NSLayoutConstraint.activate([
                // image
                imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
                imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
                imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
                imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant:  -3),
                
                // label
                nameLabel.heightAnchor.constraint(equalToConstant: 30),
                nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 7),
                nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -7),
                nameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor),
                
                // status
                statusLabel.heightAnchor.constraint(equalToConstant: 30),
                statusLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 7),
                statusLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -7),
                statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            ])
       // }
    }
    
    func setUpLayerBackgroundCardTooIosThemeChange() {
        setUpLayer()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setUpLayerBackgroundCardTooIosThemeChange()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // Chamou prepareForReuse da celula A;
        imageView.image = nil
        nameLabel.text = nil
        statusLabel.text = nil
    }
    
    
    // Os dados para configurar a chamada das celula conforme os dados cadastrados na viewModel
    func configure(with viewModel: RMCharacterCollectionViewCellViewModel) {
        // Celula A foi configurada;
        nameLabel.text = viewModel.characterName
        statusLabel.text = viewModel.characterStatusText

        // Chamou a imagem do servidor para celula A;
        fetchImage(for: viewModel)
    }
    
    // Func para buscar as imagens no servidor com base as infos cadastrada da viewModel
    private func fetchImage(for viewModel: RMCharacterCollectionViewCellViewModel) {
        // Inicia a busca pelas imagens
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.imageView.image = image
                    // Recebeu a imagem da celula A ou Z;
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
