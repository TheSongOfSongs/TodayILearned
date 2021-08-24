//
//  PhotosViewController+UICollectionViewAPI.swift
//  VariationFluidPhoto
//
//  Created by Jinhyang on 2021/08/24.
//

import UIKit

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageSet?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PictureCollectionViewCell", for: indexPath) as? PictureCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if let imageSet = imageSet {
            cell.pictureImageView.image = imageSet[indexPath.row]
        }
        
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - cellPadding * CGFloat(itemCountPerRow - 1)) / CGFloat(itemCountPerRow)
        return CGSize(width: width, height: width)
    }
}
