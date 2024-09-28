//
//  ViewController.swift
//  Battlebucks_Sunish_Ram
//
//  Created by Sunish Ram on 27/09/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblLoadingData: UILabel!
    @IBOutlet weak var CVImage: UICollectionView!
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblLoadingData.text = "Loading..."
        CVImage.isHidden = true
        CVImage.isPrefetchingEnabled = true
        CVImage.prefetchDataSource = self

        self.registerNib()
        viewModel.getImageListData {[weak self] isSucces in
            if isSucces
            {
                DispatchQueue.main.async {
                    self?.CVImage.isHidden = false
                    self?.lblLoadingData.text = ""
                    self?.CVImage.reloadData()
                }
            }else{
                self?.CVImage.isHidden = true
                self?.lblLoadingData.text = "Loading..."
            }
        }
        
    }
    
    private func registerNib()
    {
        let nibCard = UINib(nibName: ImageCVCell.identifier(), bundle: nil)
        self.CVImage.register(nibCard, forCellWithReuseIdentifier: ImageCVCell.identifier())
    }
}

}

