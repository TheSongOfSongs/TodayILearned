/// https://www.raywenderlich.com/books/rxswift-reactive-programming-with-swift/v4.0/chapters/6-filtering-operators-in-practice

import UIKit
import RxSwift

var start = 0

func getStartNumber() -> Int {
    start += 1
    return start
}

let numbers = Observable<Int>.create { observer in
    let start = getStartNumber()
    observer.onNext(start)
    observer.onNext(start+1)
    observer.onNext(start+2)
    observer.onCompleted()
    return Disposables.create()
}

numbers.share().subscribe { element in
    print("[1] element \(element)")
} onCompleted: {
    print("------------------")
}

numbers.share().subscribe { element in
    print("[2] element \(element)")
} onCompleted: {
    print("------------------")
}

numbers.share().subscribe { element in
    print("[3] element \(element)")
} onCompleted: {
    print("------------------")
}

