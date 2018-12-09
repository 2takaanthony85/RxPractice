//
//  CreateTodoViewController.swift
//  RxPractice
//
//  Created by 吉川昂広 on 2018/12/09.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class CreateTodoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewModel = CreateTodoViewModel()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "戻る",
                                                                style: .plain,
                                                                target: nil,
                                                                action: nil)
        self.navigationItem.leftBarButtonItem?.rx.tap
            .subscribe(onNext: { [unowned self] _ in
                self.dismiss(animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "保存",
                                                                 style: .plain,
                                                                 target: nil,
                                                                 action: nil)
        self.navigationItem.rightBarButtonItem?.rx.tap
            .bind(to: viewModel.saveButtonDidTap)
            .disposed(by: disposeBag)
        
        viewModel.closeView
            .subscribe(onNext: { [unowned self] _ in
                self.dismiss(animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
        
        let nib = UINib(nibName: "TodoTitleTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TodoTitleTableViewCell")
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 10000
        
        let items = Observable.just(["", ""])
        
        items
            .bind(to: tableView.rx.items(cellIdentifier: "TodoTitleTableViewCell",
                                         cellType: TodoTitleTableViewCell.self))
            { [unowned self] row, element, cell in
                switch row {
                case 0: cell.CategoryLabel.text = "Title"
                default: cell.CategoryLabel.text = "Content"
                }
                cell.TodoTitleInput.text = element
                
//                cell.TodoTitleInput.rx.text.orEmpty
//                    .subscribe(onNext: { [unowned self] value in
//                        self.tableView.beginUpdates()
//                        self.tableView.endUpdates()
//                    })
//                    .disposed(by: self.disposeBag)
                cell.TodoTitleInput.rx.text.orEmpty.asObservable()
                    .map({ [unowned self] text in
                        self.tableView.beginUpdates()
                        self.tableView.endUpdates()
                        return (row, text)
                    })
                    .bind(to: viewModel.textInput)
                    .disposed(by: self.disposeBag)
            }
            .disposed(by: disposeBag)
        
    }

}
