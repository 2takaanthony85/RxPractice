//
//  CreateTodoViewModel.swift
//  RxPractice
//
//  Created by 吉川昂広 on 2018/12/09.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CreateTodoViewModel {
    
    //viewからの入力
    //保存ボタンのタップ
    private let saveButtonTapStream = PublishSubject<Void>()
    
    //テキスト入力
    private let textInputStream = PublishSubject<(Int, String)>()
    
    var saveButtonDidTap: AnyObserver<Void> {
        return saveButtonTapStream.asObserver()
    }
    
    var textInput: AnyObserver<(Int, String)> {
        return textInputStream.asObserver()
    }
    
    //viewModelからの出力
    //保存後に画面を閉じる
    private let closeViewStream = PublishSubject<Void>()
    
    var closeView: Observable<Void> {
        return closeViewStream.asObservable()
    }
    
    let disposeBag = DisposeBag()
    
    var todo = Todo(title: "", content: "")
    
    init() {
        
        let todoManager = TodoManager.instance
        
        textInputStream
            .subscribe(onNext: { [unowned self] row, text in
                switch row {
                case 0: self.todo.title = text
                default: self.todo.content = text
                }
            })
            .disposed(by: disposeBag)
        
        saveButtonTapStream
            .flatMapLatest({ [unowned self] _ -> Observable<Void> in
                todoManager.create(item: self.todo)
                return Observable.just(())
            })
            .bind(to: closeViewStream)
            .disposed(by: disposeBag)
    }
}
