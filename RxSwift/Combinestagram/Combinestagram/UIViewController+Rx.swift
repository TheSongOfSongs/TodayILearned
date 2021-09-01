//
//  UIViewController+Rx.swift
//  Combinestagram
//
//  Created by Jinhyang on 2021/09/01.
//  Copyright © 2021 Underplot ltd. All rights reserved.
//

import UIKit
import RxSwift

extension UIViewController {
  func alert(_ title: String, description: String? = nil) -> Completable {
    return Completable.create { completable in
      let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
      
      alert.addAction(UIAlertAction(title: "Close", style: .default, handler: { _ in
        completable(.completed)
      }))
      
      self.present(alert, animated: true, completion: nil)
      return Disposables.create {
        self.dismiss(animated: true, completion: nil)
      }
    }
  }
}
