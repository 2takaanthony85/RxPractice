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
    //private let addTodoItemButtonTapStream = PublishSubject<String>()
    
    //viewに公開
    var viewWillAppear: AnyObserver<()> {
        return viewWillAppearStream.asObserver()
    }
//    var addTodoItemButtonDidTap: AnyObserver<String> {
//        return addTodoItemButtonTapStream.asObserver()
//    }
    
    //viewModelからviewへの出力
    //todoListに表示するtodoのデータ
    private let todosStream = BehaviorSubject<[Todo]>(value: [])
    //遷移イベントの通知
    //BehaviorSubjectだと初期時にEditTodoItemViewControllerに遷移してしまう。。。（2018/12/4 まだ理由わかっていない）
    //private let addTodoItemStream = PublishSubject<[Todo]>()
    //private let addTodoItemStream = PublishSubject<Int>()
    
    //viewに公開
    var todo: Observable<[Todo]> {
        return todosStream.asObservable()
    }
//    var addTodoItem: Observable<[Todo]> {
//        return addTodoItemStream.asObservable()
//    }
//    var addTodoItem: Observable<Int> {
//        return addTodoItemStream.asObservable()
//    }
    
    let disposeBag = DisposeBag()
    
    init() {
        
        let tm = TodoManager.instance
        
        viewWillAppearStream
            .flatMapLatest { _ -> Observable<[Todo]> in
                return Observable.just(tm.read())
            }
            .bind(to: todosStream)
            .disposed(by: disposeBag)
        
//        addTodoItemButtonTapStream
//            .flatMapLatest({ title -> Observable<Int> in
//                let index = tm.create(title: title)
//                return Observable.just(index)
//            })
//            .bind(to: addTodoItemStream)
//            .disposed(by: disposeBag)
        
    }
    
}
