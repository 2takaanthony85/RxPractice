//
//  EditTodoViewModel.swift
//  RxPractice
//
//  Created by 吉川昂広 on 2018/12/09.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class EditTodoViewModel {
    
    private let viewWillAppearStream = PublishSubject<Int>()
    
    var viewWillAppear: AnyObserver<Int> {
        return viewWillAppearStream.asObserver()
    }
    
    private let todoItemStream = PublishSubject<Todo>()
    
    var todoItem: Observable<Todo> {
        return todoItemStream.asObservable()
    }
    
    let disposeBag = DisposeBag()
    
    init() {
        
        let todoManager = TodoManager.instance
        
        viewWillAppearStream
            .flatMapLatest({ row -> Observable<Todo> in
                let todo = todoManager.getTodo(index: row)
                return Observable.just(todo)
            })
            .bind(to: todoItemStream)
            .disposed(by: disposeBag)
        
    }
}
