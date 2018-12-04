//
//  ViewController.swift
//  RxPractice
//
//  Created by 吉川昂広 on 2018/11/28.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var mailTextField: UITextField!
    
    @IBOutlet weak var mailValidationLabel: UILabel!
    
    @IBOutlet weak var passTextField: UITextField!
    
    @IBOutlet weak var passValidationLabel: UILabel!
    
    @IBOutlet weak var signupButton: UIButton!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passTextField.isSecureTextEntry = true
        
        let vm = ViewModel.init(mail: mailTextField.rx.text.orEmpty.asObservable(),
                                pass: passTextField.rx.text.orEmpty.asObservable(),
                                button: signupButton.rx.tap.asObservable())
        
        
        vm.loginEnabled
            .subscribe(onNext: { value in
                if value {
                    let navc = UINavigationController.init(rootViewController: ContentsListViewController())
                    self.present(navc, animated: true, completion: nil)
                } else {
                    print("different")
                }
            })
            .disposed(by: disposeBag)
    }


}

