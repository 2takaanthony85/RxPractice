//
//  EditTodoItemViewController.swift
//  RxPractice
//
//  Created by 吉川昂広 on 2018/12/04.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class EditTodoItemViewController: UIViewController {

    @IBOutlet weak var TitleTextField: UITextField!
    
    @IBOutlet weak var ContentTextView: UITextView!
    
    let index: Int
    
    let disposeBag = DisposeBag()
    
    init(dependency: Int) {
        index = dependency
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        let vm = EditTodoItemViewModel(dependency: index)
//        
////        TitleTextField.rx.text.asObservable()
////            .subscribe(onNext: { [unowned self] t in
////                guard let edittedTitle = t else { return }
////                self.vm.titleEdit.onNext(edittedTitle)
////            })
////            .disposed(by: disposeBag)
//        
//        rx.sentMessage(#selector(viewWillAppear(_:)))
//            .map { _ in }
//            .bind(to: vm.viewWillAppear)
//            .disposed(by: disposeBag)
//        
//        vm.editTodo
//            .bind(onNext: { [unowned self] todo in
//                self.TitleTextField.text = todo.title
//                self.ContentTextView.text = todo.content
//            })
//            .disposed(by: disposeBag)
//        
////        TitleTextField.rx.text.orEmpty.asDriver()
////            .drive(vm.titleEdit)
////            .disposed(by: disposeBag)
//        
//        TitleTextField.rx.text.orEmpty
//            .bind(to: vm.titleEdit)
//            .disposed(by: disposeBag)
//        
//        ContentTextView.rx.text.orEmpty
//            .bind(to: vm.contentEdit)
//            .disposed(by: disposeBag)
    }

}
