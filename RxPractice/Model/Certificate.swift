//
//  Certificate.swift
//  RxPractice
//
//  Created by 吉川昂広 on 2018/12/02.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import Foundation
import RxSwift

struct Certificate {
    
    let mailAddress = ""
    let password = ""
    
    func login(mail: String, pass: String) -> Observable<Bool> {
        return Observable.just(mail == mailAddress && pass == password)
    }
}
