//
//  MemoListViewModel.swift
//  RxMemo
//
//  Created by Jinhyang Kim on 2021/10/27.
//

import Foundation
import RxSwift
import RxCocoa

class MemoListViewModel: CommonViewModel {
    var memoList: Observable<[Memo]> {
        return storage.memoList()
    }
}
