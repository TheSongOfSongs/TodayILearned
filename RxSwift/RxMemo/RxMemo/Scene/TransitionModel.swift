//
//  TransitionModel.swift
//  RxMemo
//
//  Created by Jinhyang on 2021/12/01.
//

import Foundation

enum TransitionStyle {
    case root
    case push
    case modal
}

enum TransitionError: Error {
    case navigationControllerMissing
    case cannotPop
    case unknown
}
