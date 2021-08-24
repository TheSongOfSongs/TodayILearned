//
//  ViewController+ZoomAnimatorDelegate.swift
//  VariationFluidPhoto
//
//  Created by Jinhyang on 2021/08/24.
//

import UIKit


extension ViewController {
    func getFrameFromCollectionViewCell(for selectedIndexPath: IndexPath) -> CGRect {
        let visibleCells = self.collectionView.indexPathsForVisibleItems
        if !visibleCells.contains(self.selectedIndexPath) {
            self.collectionView.scrollToItem(at: self.selectedIndexPath, at: .centeredVertically, animated: false)
            self.collectionView.reloadItems(at: self.collectionView.indexPathsForVisibleItems)
            self.collectionView.layoutIfNeeded()
        }
        
        guard let cell = (self.collectionView.cellForItem(at: self.selectedIndexPath) as? PictureCollectionViewCell) else {
            return CGRect(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY, width: 100.0, height: 100.0)
        }
        
        return cell.frame
    }
    
    func getImageViewFromCollectionViewCell(for selectedIndexPath: IndexPath) -> UIImageView {
        let visibleCells = self.collectionView.indexPathsForVisibleItems
        if !visibleCells.contains(self.selectedIndexPath) {
            self.collectionView.scrollToItem(at: self.selectedIndexPath, at: .centeredVertically, animated: false)
            self.collectionView.reloadItems(at: self.collectionView.indexPathsForVisibleItems)
            self.collectionView.layoutIfNeeded()
        }
        
        guard let cell = self.collectionView.cellForItem(at: self.selectedIndexPath) as? PictureCollectionViewCell else {
            return UIImageView(frame: CGRect(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY, width: 100.0, height: 100.0))
        }
        
        return cell.pictureImageView
    }
}

extension ViewController: ZoomAnimatorDelegate {
    func transitionWillStartWith(zoomAnimator: ZoomAnimator) {
        // do nothing
    }
    
    func transitionDidEndWith(zoomAnimator: ZoomAnimator) {
        let cell = self.collectionView.cellForItem(at: self.selectedIndexPath) as! PictureCollectionViewCell
        let cellFrame = self.collectionView.convert(cell.frame, to: self.view)
        
        if cellFrame.minY < self.collectionView.contentInset.top {
            self.collectionView.scrollToItem(at: self.selectedIndexPath, at: .top, animated: false)
        } else if cellFrame.maxY > self.view.frame.height - self.collectionView.contentInset.bottom {
            self.collectionView.scrollToItem(at: self.selectedIndexPath, at: .bottom, animated: false)
        }
    }
    
    /// 선택한 셀의 UIImageView
    func referenceImageView(for zoomAnimator: ZoomAnimator) -> UIImageView? {
        let referenceImageView = getImageViewFromCollectionViewCell(for: self.selectedIndexPath)
        return referenceImageView
    }

    /// 선택한 셀의 프레임
    func referenceImageViewFrameInTransitioningView(for zoomAnimator: ZoomAnimator) -> CGRect? {
        self.view.layoutIfNeeded()
        self.collectionView.layoutIfNeeded()
        
        let unconvertedFrame = getFrameFromCollectionViewCell(for: self.selectedIndexPath)
        let cellFrame = self.collectionView.convert(unconvertedFrame, to: self.view)
        
        if cellFrame.minY < self.collectionView.contentInset.top {
            return CGRect(x: cellFrame.minX, y: self.collectionView.contentInset.top,
                          width: cellFrame.width, height: cellFrame.height - (self.collectionView.contentInset.top - cellFrame.minY))
        }
        
        return cellFrame
    }
}
