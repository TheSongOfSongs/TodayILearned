//
//  SceneCoordinatorType.swift
//  RxMemo
//
//  Created by Jinhyang on 2021/12/01.
//

import Foundation
import RxSwift

protocol SceneCoordinatorType {
    @discardableResult
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable
    
    @discardableResult
    func close(animated: Bool) -> Completable
}
