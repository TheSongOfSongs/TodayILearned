//
//  ViewController+UICollectionViewAPI.swift
//  VariationFluidPhoto
//
//  Created by Jinhyang on 2021/08/23.
//

import UIKit

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
        guard let photoVC = storyboard?.instantiateViewController(withIdentifier: "PhotosViewController") as? PhotosViewController else { return }
        photoVC.mainImage = imageSet[indexPath.row]
        photoVC.imageSet = imageSet
        photoVC.transitionController.fromDelegate = self
        photoVC.transitionController.toDelegate = photoVC
        navigationController?.delegate = photoVC.transitionController
        
        navigationController?.pushViewController(photoVC, animated: true)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageSet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PictureCollectionViewCell", for: indexPath) as? PictureCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.pictureImageView.image = imageSet[indexPath.row]
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - cellPadding * 2
        return CGSize(width: width, height: width)
    }
}
