//
//  HomeViewController.swift
//  RickAndMorty
//
//  Created by Yareli Arragan Muñoz on 18/9/24.
//

import UIKit

enum miError: Error {
    case error
}

class HomeViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var characteresLabel: UILabel!
    @IBOutlet weak var myFavoritesLabel: UILabel!
    @IBOutlet weak var charactersCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var refreshControl = UIRefreshControl()
    
    
    
    var viewModel: HomeViewModel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        //Llamadas de las funciones
        viewModel.getCharacters()
        setupBindings()
        configure(collectionView: charactersCollectionView)
        
        view.backgroundColor = .primaryBlack
        
        titleLabel.font = UIFont(name: "Bangers-Regular", size: 32)
        characteresLabel.font = UIFont(name: "Roboto-Light", size: 12)
        myFavoritesLabel.font = UIFont(name: "Roboto-Light", size: 12)
        charactersCollectionView.backgroundColor = .primaryBlack
    }
    
    func setupBindings() {
        viewModel.charactersUpDate = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.charactersCollectionView.reloadData()
            }
        }
    }
}

//Extension para configuracion de la tabla
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = charactersCollectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCollectionViewCell", for: indexPath) as! CharacterCollectionViewCell
        cell.setup(Character: viewModel.characters[indexPath.row])
        return cell
    }
    
    func configure(collectionView: UICollectionView) {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CharacterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CharacterCollectionViewCell")
   }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 66)
    }
}
    


