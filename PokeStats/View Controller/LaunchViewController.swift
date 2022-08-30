//
//  LaunchViewController.swift
//  PokeStats
//
//  Created by Carolina Duartr on 25/08/2022.
//

import UIKit

class LaunchViewController: UIViewController {
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var pokedex: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadingIndicator.startAnimating()
        API.fetchPokedex{ result in
            DispatchQueue.main.async { [weak self] in
                do{
                    switch result {
                        case let .success(pokedex):
                            self?.pokedex = pokedex
                            self?.loadingIndicator.stopAnimating()
                            self?.loadingIndicator.isHidden = true
                            print("\(self?.pokedex.count)")
                            self?.openHomeController(pokedex)
                        case let .failure(error):
                            self?.pokedex = []
                    }
                }
                catch {
                    
                }
            }
        }
    }
    
    private func openHomeController(_ pokedex: [Pokemon]){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "HomeView", creator: { coder -> HomeViewController? in
            HomeViewController(coder: coder, pokedex: self.pokedex)
        })
        //viewController
        self.present(viewController, animated: true)
    }
}
