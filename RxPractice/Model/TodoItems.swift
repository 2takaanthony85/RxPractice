//
//  TodoItems.swift
//  RxPractice
//
//  Created by 吉川昂広 on 2018/12/02.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import Foundation

struct Todo {
    var title: String
    var content: String
}

class TodoManager {
    
    private var todo: [Todo]
    
    static var instance = TodoManager()
    
    private init() { todo = [] }
    
    func create(item: Todo) {
        todo.append(item)
    }
    
    func read() -> [Todo] {
        return todo
    }
    
    func getTodo(index: Int) -> Todo {
        return todo[index]
    }
    
    func update(index: Int, title: String, content: String) {
        todo[index].title = title
        todo[index].content = content
    }
    
    func delete(index: Int) {
        todo.remove(at: index)
    }
    
}
