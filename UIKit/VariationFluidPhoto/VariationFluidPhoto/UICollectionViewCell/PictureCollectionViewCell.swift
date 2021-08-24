//
//  PictureCollectionViewCell.swift
//  VariationFluidPhoto
//
//  Created by Jinhyang on 2021/08/24.
//

import UIKit

class PictureCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var pictureImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pictureImageView.layer.cornerRadius = 7
    }
}
