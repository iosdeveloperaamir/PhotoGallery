//
//  Navigator.swift
//  PhotoGallery
//
//  Created by Aamir Arslan on 17/01/2022.
//

import UIKit


class Navigator{
    
    static func toPhotoViewerVC(_ parentViewController: UIViewController, img:UIImage, url:String){
        let viewerVC = parentViewController.storyboard?.instantiateViewController(withIdentifier: "ImageViewerVC") as! PhotoViewerVC
        viewerVC.img = img
        viewerVC.url = url
        parentViewController.navigationController?.pushViewController(viewerVC, animated: true)
    }
}
