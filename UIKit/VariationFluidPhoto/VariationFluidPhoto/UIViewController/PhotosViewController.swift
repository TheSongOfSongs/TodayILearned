//
//  PhotosViewController.swift
//  VariationFluidPhoto
//
//  Created by Jinhyang on 2021/08/23.
//

import UIKit

class PhotosViewController: UIViewController {
    
    @IBOutlet var detailImageView: UIImageView!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var closeButton: UIButton!
    
    let cellPadding: CGFloat = 20
    let itemCountPerRow = 3
    
    var imageSet: [UIImage?]?
    var mainImage: UIImage?
    var zoomInImageFrame: CGRect = {
        let width = UIScreen.main.bounds.width
        return CGRect(origin: .zero, size: CGSize(width: width, height: width))
    }()
    
    var transitionController = ZoomTransitionController()
    var animationDuration: TimeInterval = 0.5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closeButton.layer.cornerRadius = 7
        detailImageView.image = mainImage
        setupCollectionView()
    }
    
    func setupCollectionView() {
        let cell = UINib(nibName: "PictureCollectionViewCell", bundle: nil)
        collectionView.register(cell, forCellWithReuseIdentifier: "PictureCollectionViewCell")
        collectionView.reloadData()
    }
    
    @IBAction func close(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
