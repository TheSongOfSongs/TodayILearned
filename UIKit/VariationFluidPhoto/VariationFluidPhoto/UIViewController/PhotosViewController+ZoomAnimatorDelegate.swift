//
//  PhotosViewController+ZoomAnimatorDelegate.swift
//  VariationFluidPhoto
//
//  Created by Jinhyang on 2021/08/24.
//

import UIKit

extension PhotosViewController: ZoomAnimatorDelegate {
    func transitionWillStartWith(zoomAnimator: ZoomAnimator) {
        // do nothing
    }

    func transitionDidEndWith(zoomAnimator: ZoomAnimator) {
        // do nothing
    }

    func referenceImageView(for zoomAnimator: ZoomAnimator) -> UIImageView? {
        return detailImageView
    }

    func referenceImageViewFrameInTransitioningView(for zoomAnimator: ZoomAnimator) -> CGRect? {
        return detailImageView.frame
    }
}
