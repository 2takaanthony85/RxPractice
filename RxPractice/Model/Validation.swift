//
//  Validation.swift
//  RxPractice
//
//  Created by 吉川昂広 on 2018/12/01.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

enum ValidationResult {
    case strong
    case slightlyStrong
    case weak
    case empty
}

extension ValidationResult {
    var color: UIColor {
        switch self {
        case .strong:
            return UIColor.green
        case .slightlyStrong:
            return UIColor.yellow
        case .weak:
            return UIColor.red
        default:
            return UIColor.clear
        }
    }
}

extension ValidationResult {
    var message: String {
        switch self {
        case .strong:
            return "password so strong !!"
        case .slightlyStrong:
            return "password slightly strong"
        case .weak:
            return "passowrd so weak !!"
        default:
            return ""
        }
    }
}

extension Reactive where Base: UILabel {
    //ValidationResult => BiderのValue(typealias E = Value)
    var validationResult: Binder<ValidationResult> {
        //base = UILabel => Biderのtarget (targetはinit時のgenerics)
        //Binderはinit時に　binding: (target, Value) -> ()
        return Binder(base) { label, result in
            label.textColor = result.color
            label.text = result.message
        }
    }
}

protocol Validation {
    func passValidate(pass: String) -> ValidationResult
}

struct loginValidation: Validation {
    
    func passValidate(pass: String) -> ValidationResult {
        if pass.count == 0 {
            return .empty
        } else {
            if pass.count < 8 {
                return .weak
            } else {
                let uppercaseLetterRegex = ".*[A-Z]+.*"
                let uppercaseLetterTest = NSPredicate(format:"SELF MATCHES %@", uppercaseLetterRegex)
                if uppercaseLetterTest.evaluate(with: pass) {
                    return .strong
                } else {
                    return .slightlyStrong
                }
            }
        }
    }
}
