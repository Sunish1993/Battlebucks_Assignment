//
//  ImageCVCell.swift
//  Battlebucks_Sunish_Ram
//
//  Created by Sunish Ram on 27/09/24.
//

import UIKit

class ImageCVCell: UICollectionViewCell {

     @IBOutlet weak var imgView: LazyImageView!
    
    static let imageCache = NSCache<NSString, UIImage>()
 
    var imgDetailsModelData : ModelData?
    {
        didSet{
            displayImageData()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // Reset image and cancel any pending image loading
        imgView.image = UIImage(named: kPlaceHolderImage)
        imgView.currentDataTask?.cancel()  // Cancel any running task
    }

    func displayImageData() {
        guard let imageUrlString = imgDetailsModelData?.thumbnailUrl, let imageUrl = URL(string: imageUrlString) else {
            return
        }
        imgView.loadImage(fromURL: imageUrl, placeHolderImage: kPlaceHolderImage)
    }
    

}
