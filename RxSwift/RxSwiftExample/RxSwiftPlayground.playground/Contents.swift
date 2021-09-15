/// https://www.raywenderlich.com/books/rxswift-reactive-programming-with-swift/v4.0/chapters/6-filtering-operators-in-practice

import UIKit
import RxSwift

public func example(of description: String,
                    action: () -> Void) {
    print("\n--- Example of:", description, "---")
    action()
}

// MARK: - Chatper 7: Transforming Operators

example(of: "toArray") {
    let disposeBag = DisposeBag()

    Observable.of("A", "B", "C")
        .toArray()
        .subscribe(onSuccess: {
            print($0)
        })
        .disposed(by: disposeBag)
}

example(of: "map") {
    let disposeBag = DisposeBag()

    let formatter = NumberFormatter()
    formatter.numberStyle = .spellOut
    
    Observable<Int>.of(123, 4, 56)
        .map({
            formatter.string(for: $0) ?? ""
        })
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}


example(of: "enumerated and map") {
    let disposeBag = DisposeBag()
    
    Observable.of(1, 2, 3, 4, 5, 6)
        .enumerated()
        .map { index, integer in
            index > 2 ? integer * 2 : integer
        }
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}

example(of: "compactMap") {
    let disposeBag = DisposeBag()
    
    Observable.of("To", "be", nil, "or", "not", "to", "be", nil)
        .compactMap({ $0 })
        .toArray()
        .map({ $0.joined(separator: " ") })
        .subscribe(onSuccess: { print($0) })
        .disposed(by: disposeBag)
}


struct Student {
    let score: BehaviorSubject<Int>
}

example(of: "flatMap") {
    let disposeBag = DisposeBag()
    
    let laura = Student(score: BehaviorSubject(value: 80))
    let charlotte = Student(score: BehaviorSubject(value: 90))

    let student = PublishSubject<Student>()
    
    student
        .flatMap {
            $0.score
        }
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
    
    student
        .map {
            $0.score
        }
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
    
    student.onNext(laura) // 80
    laura.score.onNext(85) // 85
    student.onNext(charlotte) // 90
}
