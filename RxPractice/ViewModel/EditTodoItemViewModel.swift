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
    
    //viewから入力
    //titleの変更
    private let titleEditStream = PublishSubject<String>()
    
    //cotentの変更
    private let contentEditStream = PublishSubject<String>()
    
    //viewにはobserverとして公開
    //titleの変更
    var titleEdit: AnyObserver<String> {
        return titleEditStream.asObserver()
    }
    
    //contenの変更
    var contentEdit: AnyObserver<String> {
        return contentEditStream.asObserver()
    }
    
    let disposeBag = DisposeBag()
    
    //変更される前のTodo
    let todoBeforeEditing: Todo
    
    init(dependency: Todo) {
        
        self.todoBeforeEditing = dependency
        
        var tm = TodoManager.instance
        
        titleEditStream
            .subscribe(onNext: { edittedTitle in
                print(edittedTitle)
            })
            .disposed(by: disposeBag)
        
        contentEditStream
            .subscribe(onNext: { edittedContent in
                print(edittedContent)
            })
            .disposed(by: disposeBag)
        
    }
    
}
