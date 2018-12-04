//
//  ContentsListViewModel.swift
//  RxPractice
//
//  Created by 吉川昂広 on 2018/12/02.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ContentsListViewModel {
    
    //viewからの入力
    //todolist画面の表示イベント
    private let viewWillAppearStream = PublishSubject<Void>()
    //todo追加ボタンのタップイベント
    private let addTodoItemButtonTapStream = PublishSubject<String>()
    
    //viewに公開
    var viewWillAppear: AnyObserver<()> {
        return viewWillAppearStream.asObserver()
    }
    var addTodoItemButtonDidTap: AnyObserver<String> {
        return addTodoItemButtonTapStream.asObserver()
    }
    
    //viewModelからviewへの出力
    //todoListに表示するtodoのデータ
    private let todosStream = BehaviorSubject<[Todo]>(value: [])
    //todo追加イベントの通知
    private let addTodoItemStream = BehaviorSubject<[Todo]>(value: [])
    
    //viewに公開
    var todo: Observable<[Todo]> {
        return todosStream.asObservable()
    }
    var addTodoItem: Observable<[Todo]> {
        return addTodoItemStream.asObservable()
    }
    
    let disposeBag = DisposeBag()
    
    init() {
        
        var tm = TodoManager.init()
        
        viewWillAppearStream
            .flatMapLatest { _ -> Observable<[Todo]> in
                return Observable.just(tm.read())
            }
            .bind(to: todosStream)
            .disposed(by: disposeBag)
        
        addTodoItemButtonTapStream
            .flatMapLatest({ title -> Observable<[Todo]> in
                tm.create(title: title)
                return Observable.just(tm.read())
            })
            .bind(to: addTodoItemStream)
            .disposed(by: disposeBag)
        
    }
    
}
