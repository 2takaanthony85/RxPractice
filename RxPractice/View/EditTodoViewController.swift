//
//  EditTodoViewController.swift
//  RxPractice
//
//  Created by 吉川昂広 on 2018/12/09.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class EditTodoViewController: UIViewController {

    @IBOutlet weak var TitleLabel: UILabel!
    
    @IBOutlet weak var ContentLabel: UILabel!
    
    let index: Int
    
    let viewModel = EditTodoViewModel()
    
    let disposeBag = DisposeBag()
    
    init(index: Int) {
        self.index = index
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    func bind() {
        
        rx.sentMessage(#selector(viewWillAppear(_:)))
            .map({ [unowned self] _ in
                return self.index
            })
            .bind(to: viewModel.viewWillAppear)
            .disposed(by: disposeBag)
        
        viewModel.todoItem
            .subscribe(onNext: { [unowned self] item in
                self.TitleLabel.text = item.title
                self.ContentLabel.text = item.content
            })
            .disposed(by: disposeBag)
    }

}
