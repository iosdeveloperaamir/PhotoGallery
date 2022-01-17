//
//  PhotosCollectionViewCell.swift
//  PhotoGallery
//
//  Created by Aamir Arslan on 12/01/2022.
//

import UIKit
import SDWebImage

class PhotosCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func populateData(_ data:PhotoDataModel){//populate data in cell
        imageView.sd_setImage(with: URL(string: data.largeImageURL), placeholderImage: UIImage(named: "photo.on.rectangle.angled"))
    }
}
