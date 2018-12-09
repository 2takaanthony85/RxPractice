//
//  ContentsListDataSource.swift
//  RxPractice
//
//  Created by 吉川昂広 on 2018/12/02.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

class ContentsListDataSource: NSObject, RxTableViewDataSourceType, UITableViewDataSource, UITableViewDelegate {
    
    typealias Element = [Todo]
    
    var items: [Todo] = []
    
    private let cellTapIndexStream = PublishSubject<IndexPath>()
    
    var cellTapped: Observable<IndexPath> {
        return cellTapIndexStream.asObservable()
    }
    
    func tableView(_ tableView: UITableView, observedEvent: Event<[Todo]>) {
        Binder(self) { target, element in
            target.items = element
            tableView.reloadData()
        }
        .on(observedEvent)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentsListCell", for: indexPath)
        let element = items[indexPath.row].title
        cell.textLabel?.text = element
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell tapped")
        cellTapIndexStream.onNext(indexPath)
    }
    
}
