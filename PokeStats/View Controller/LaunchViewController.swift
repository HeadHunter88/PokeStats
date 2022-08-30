//
//  LaunchViewController.swift
//  PokeStats
//
//  Created by Carolina Duartr on 25/08/2022.
//

import UIKit

class LaunchViewController: UIViewController {
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var retryButton: UIButton!
    
    var pokedex: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startApplication()
    }
    
    func startApplication(){
        retryButton.isHidden = true
        loadingIndicator.startAnimating()
        API.fetchPokedex{ result in
            DispatchQueue.main.async { [weak self] in
                switch result {
                    case let .success(pokedex):
                        self?.pokedex = pokedex
                        self?.loadingIndicator.stopAnimating()
                        self?.loadingIndicator.isHidden = true
                        print("\(self?.pokedex.count)")
                        self?.openHomeController(pokedex)
                    case let .failure(error):
                        self?.retryButton.isHidden = false
                        self?.loadingIndicator.stopAnimating()
                        self?.loadingIndicator.isHidden = true
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
    @IBAction func retryEvent(_ sender: Any) {
        startApplication()
    }
}
