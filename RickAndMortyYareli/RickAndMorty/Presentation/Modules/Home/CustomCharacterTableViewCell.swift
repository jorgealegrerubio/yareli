//
//  CustomCharacterTableViewCell.swift
//  RickAndMorty
//
//  Created by Yareli Arragan Muñoz on 30/10/24.
//

import UIKit

class CustomCharacterTableViewCell: UITableViewCell {
    @IBOutlet weak var characterButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var FavoritesImage: UIImageView!
    @IBOutlet weak var characterIdLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(Character: Character) {
        characterIdLabel.text = "Id: \(Character.id)"
        characterIdLabel.font = UIFont(name: "Roboto-Light", size: 15)
        contentView.addSubview(characterIdLabel)
        
        characterImageView.contentMode = .scaleAspectFill
        characterImageView.clipsToBounds = true
        characterImageView.layer.cornerRadius = 10
        contentView.addSubview(characterImageView)
        
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
        contentView.addSubview(characterNameLabel)
        
        originLabel.text = Character.origin.name
        originLabel.font = UIFont(name: "Roboto-Light", size: 15)
        contentView.addSubview(originLabel)
        
        
        
    }
    
    }
    

