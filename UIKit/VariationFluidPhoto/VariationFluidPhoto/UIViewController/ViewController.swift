//
//  ViewController.swift
//  VariationFluidPhoto
//
//  Created by Jinhyang on 2021/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    var imageSet: [UIImage?] = []
    let cellPadding: CGFloat = 20
    var zoomInImageFrame: CGRect = .zero
    var animationDuration: TimeInterval = 0.5
    
    @IBOutlet var collectionView: UICollectionView!
    
    var selectedIndexPath: IndexPath!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        for i in 0..<9 {
            imageSet.append(UIImage(named: "test\(i)"))
        }
        
        let cell = UINib(nibName: "PictureCollectionViewCell", bundle: nil)
        collectionView.register(cell, forCellWithReuseIdentifier: "PictureCollectionViewCell")
        collectionView.reloadData()
    }
}
