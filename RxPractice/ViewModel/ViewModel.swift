//
//  ViewModel.swift
//  RxPractice
//
//  Created by 吉川昂広 on 2018/12/01.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class ViewModel {
    
    //let validateMail: Observable<String>
    //let validatePass: Observable<ValidationResult>
    
    let loginEnabled: Observable<Bool>
    
    let disposeBag = DisposeBag()
    
    init(mail: Observable<String>,
        pass: Observable<String>,
        button: Observable<Void>) {
        
//        validateMail = mail
//            .map({ text in
//                var message = ""
//                text.forEach({ if $0 == "@" { message = "mail address is available !!"} })
//                return message
//            })
//            .share(replay: 1)
        
        //password validation
//        let lv = loginValidation()
//
//        validatePass = pass
//            .map({ text in
//                return lv.passValidate(pass: text)
//            })
//            .share(replay: 1)
        
        let input = Observable.combineLatest(mail, pass) {(mailAddress: $0, password: $1)}
        let certificate = Certificate()
        
        loginEnabled = button.withLatestFrom(input)
            .flatMapLatest({ userInput in
                return certificate.login(mail: userInput.mailAddress, pass: userInput.password)
            })
            .share(replay: 1)
        
    }
    
}
