//
//  CarDetailsViewController.swift
//  MVVM-C
//
//  Created by Macbook Pro on 25/01/2022.
//

import UIKit

class CarDetailsViewController: UIViewController {

    // MARK: - OUTLETS
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    // MARK: - VARIABLES
    var viewModel : CarDetailsViewModel!
    
    // MARK: - VIEW LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVM()
    }
    
    // MARK: - SETUP VIEW
    private func setupVM() {
        self.bindUI()
        self.title = self.viewModel.title
        self.viewModel.viewDidLoad()
    }
    
    private func bindUI(){
        self.viewModel.showData = { [weak self] (data) in
            guard let `self` = self else { return }
            self.imageView.image = UIImage(named: data.image)
            self.titleLabel.text = data.name
            self.descriptionTextView.text = data.description
        }
    }
    
    // MARK: - BUTTON ACTIONS
    
}
