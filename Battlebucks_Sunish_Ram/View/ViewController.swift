//
//  ViewController.swift
//  Battlebucks_Sunish_Ram
//
//  Created by Sunish Ram on 27/09/24.
//

import UIKit

class ViewController: UIViewController {

    
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getData { isSucces in
            if isSucces{
                DispatchQueue.main.async {
                    //update table
                }
            }
        }
        
    }


}

