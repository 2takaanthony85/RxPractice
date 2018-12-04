//
//  ContentsListViewController.swift
//  RxPractice
//
//  Created by 吉川昂広 on 2018/12/02.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ContentsListViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    let vm = ContentsListViewModel()
    let disposeBag = DisposeBag()
    
    let datasource = ContentsListDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "ContentsListCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ContentsListCell")
        bind()
    }
    
    private func bind() {
        
        rx.sentMessage(#selector(viewWillAppear(_:)))
            .map { _ in }
            .bind(to: vm.viewWillAppear)
            .disposed(by: disposeBag)
        
        vm.todo
            .bind(to: tableView.rx.items(dataSource: datasource))
            .disposed(by: disposeBag)
        
        addButton.rx.tap
            .subscribe({ [unowned self] _ in
                self.showAlert(completion: { text in
                    self.vm.addTodoItemButtonDidTap.onNext(text)
                })
            })
            .disposed(by: disposeBag)
        
        vm.addTodoItem
            .bind { [unowned self] todo in
                self.datasource.items = todo
                self.tableView.reloadData()
                //self.navigateToEditTodoItemVC()
            }
            .disposed(by: disposeBag)
    }

    func showAlert(completion: @escaping (String) -> ()) {
        let alert = UIAlertController(title: "Todoを追加します", message: "追加するTodoを入力してください", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
            if let textFields = alert.textFields {
                for textField in textFields {
                    completion(textField.text!)
                }
            }
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(ok)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    func navigateToEditTodoItemVC() {
        let editTodoItemVC = EditTodoItemViewController()
        self.navigationController?.pushViewController(editTodoItemVC, animated: true)
    }

}
