//
//  PhotoGalleryVC.swift
//  PhotoGallery
//
//  Created by Aamir Arslan on 12/01/2022.
//

import UIKit
import SDWebImage

class PhotoGalleryVC: UIViewController, ActivityPresentable {

    @IBOutlet weak var photosCollectionView: UICollectionView!
    
    var photoData = [PhotoDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){//setup function to initialize collection view related things.
        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self
        photosCollectionView.register(UINib.init(nibName: Constants.photosCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.photosCollectionViewCell)
        //API call
        apiCall()
    }
    
    func apiCall(){//getting Data from sservices handler.
        presentActivity()
        ServicesHandler.shared.getPhotosList { photoArr, success in
            if success, let photoDataArr = photoArr{
                self.photoData = photoDataArr
                DispatchQueue.main.async {
                    self.photosCollectionView.reloadData()
                }
            }else{}
            self.dismissActivity()
        }
    }
}
// Collection View dataSource and delegate methods call in this extension.
extension PhotoGalleryVC:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.photosCollectionViewCell, for: indexPath) as! PhotosCollectionViewCell
        //populate data in collectionView cell
        cell.populateData(photoData[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        //set size of colllection view cell
        return CGSize(width: (collectionView.frame.size.width/2.0)-8, height: collectionView.frame.size.height/3.8)

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Navigate to Viewer Controller.
        if let cell = collectionView.cellForItem(at: indexPath) as? PhotosCollectionViewCell{
            Navigator.toPhotoViewerVC(self, img: cell.imageView.image ?? UIImage(), url: photoData[indexPath.item].largeImageURL)
        }
    }
}
