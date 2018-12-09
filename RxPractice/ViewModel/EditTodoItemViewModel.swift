//
//  EditTodoItemViewModel.swift
//  RxPractice
//
//  Created by 吉川昂広 on 2018/12/04.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class EditTodoItemViewModel {
    
//    //viewから入力
//    //表示イベント
//    private let viewWillAppearStream = PublishSubject<Void>()
//    
//    //titleの変更
//    private let titleEditStream = PublishSubject<String>()
//    
//    //cotentの変更
//    private let contentEditStream = PublishSubject<String>()
//    
//    //viewにはobserverとして公開
//    //表示イベント
//    var viewWillAppear: AnyObserver<()> {
//        return viewWillAppearStream.asObserver()
//    }
//    
//    //titleの変更
//    var titleEdit: AnyObserver<String> {
//        return titleEditStream.asObserver()
//    }
//    
//    //contenの変更
//    var contentEdit: AnyObserver<String> {
//        return contentEditStream.asObserver()
//    }
//    
//    //出力
//    private let EditTodoStream = PublishSubject<Todo>()
//    
//    var editTodo: Observable<Todo> {
//        return EditTodoStream.asObservable()
//    }
//    
//    let disposeBag = DisposeBag()
//    
//    let indexOfTodo: Int
//    
//    init(dependency: Int) {
//        
//        indexOfTodo = dependency
//        
//        let tm = TodoManager.instance
//        
//        viewWillAppearStream
//            .flatMapLatest { [unowned self] _ -> Observable<Todo> in
//                let todo = tm.getTodo(index: self.indexOfTodo)
//                return Observable.just(todo)
//            }
//            .bind(to: EditTodoStream)
//            .disposed(by: disposeBag)
//        
//        titleEditStream
//            .subscribe(onNext: { [unowned self] edittedTitle in
//                tm.update(index: self.indexOfTodo, title: edittedTitle, content: nil)
//            })
//            .disposed(by: disposeBag)
//        
//        contentEditStream
//            .subscribe(onNext: { [unowned self] edittedContent in
//                tm.update(index: self.indexOfTodo, title: nil, content: edittedContent)
//            })
//            .disposed(by: disposeBag)
        
//    }
    
}
