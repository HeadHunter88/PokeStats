//
//  PokemonUITableViewCell.swift
//  PokeStats
//
//  Created by Carolina Duartr on 02/09/2022.
//

import UIKit
import Kingfisher

class PokemonUITableViewCell: UITableViewCell {

    @IBOutlet weak var pokemonMainImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.4)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setImage(url: String){
        KF.url(URL(string: url))
            .placeholder(UIImage(named: DetailStrings.placeholder.localized()))
            .loadDiskFileSynchronously()
            .cacheMemoryOnly()
            .fade(duration: 0.25)
            .onSuccess{ result in }
            .onFailure{ result in }
            .set(to: self.pokemonMainImage)
    }
    
}
