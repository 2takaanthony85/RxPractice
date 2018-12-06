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
    
    var todo: Todo = Todo(title: "", content: "")
    
    init(dependency: Todo) {
        super.init(nibName: nil, bundle: nil)
        self.todo.title = dependency.title
        self.todo.content = dependency.content
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TitleTextField.text = todo.title
        ContentTextView.text = todo.content
        
    }

}
