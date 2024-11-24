//
//  CharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Yareli Arragan Muñoz on 14/11/24.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var FavoritesImage: UIImageView!
    
    func setup(Character: Character) {
        characterImageView.contentMode = .scaleAspectFill
        
        if let url = URL(string: Character.image) {
            URLSession.shared.dataTask(with: url) { data,_, _ in
                guard let data = data else{ return }
                DispatchQueue.main.async {
                    self.characterImageView.image = UIImage(data: data)
                }
            }.resume()
        }
        
        characterNameLabel.text = Character.name
        characterNameLabel.font = UIFont(name: "Roboto-Regular", size: 18)
        
        originLabel.text = Character.origin.name
        originLabel.font = UIFont(name: "Roboto-Light", size: 15)
    }
}
