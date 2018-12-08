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
    
    var todo: Todo
    
    var vm: EditTodoItemViewModel
    
    let disposeBag = DisposeBag()
    
    init(dependency: Todo) {
        todo = dependency
        vm = EditTodoItemViewModel(dependency: dependency)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TitleTextField.text = todo.title
        ContentTextView.text = todo.content
        
//        TitleTextField.rx.text.asObservable()
//            .subscribe(onNext: { [unowned self] t in
//                guard let edittedTitle = t else { return }
//                self.vm.titleEdit.onNext(edittedTitle)
//            })
//            .disposed(by: disposeBag)
        
        TitleTextField.rx.text.orEmpty
            .bind(to: vm.titleEdit)
            .disposed(by: disposeBag)
        
        ContentTextView.rx.text.orEmpty
            .bind(to: vm.contentEdit)
            .disposed(by: disposeBag)
    }

}
