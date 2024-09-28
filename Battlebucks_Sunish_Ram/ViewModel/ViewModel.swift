//
//  ViewModel.swift
//  Battlebucks_Sunish_Ram
//
//  Created by Sunish Ram on 27/09/24.
//

import Foundation

class ViewModel {
    
    let resource = Resource()
    
    func getData(completion:@escaping(_ isSucces:Bool) -> Void)
    {
        resource.getImagesData { result in
            guard let result = result else {return}
            debugPrint("result__:\(result.count)")
            _ = completion(true)
        }
    }
}
