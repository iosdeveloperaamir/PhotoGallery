//
//  ImageViewerVC.swift
//  PhotoGallery
//
//  Created by Aamir Arslan on 12/01/2022.
//

import UIKit
import SDWebImage

class PhotoViewerVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var img:UIImage?
    var url:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //to initialize and download data in this function.
    private func setupView(){
        if let image = img{
            imageView.image = image
        }else{
            imageView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "photo.on.rectangle.angled"))
        }
    }
}
