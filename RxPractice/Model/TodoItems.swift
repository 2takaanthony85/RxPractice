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
    
    func create(title: String) -> Int {
        todo.append(Todo(title: title, content: ""))
        return todo.count - 1
    }
    
    func read() -> [Todo] {
        return todo
    }
    
    func getTodo(index: Int) -> Todo {
        return todo[index]
    }
    
    func update(index: Int, title: String?, content: String?) {
        if let _title = title {
            todo[index].title = _title
        }
        if let _content = content {
            todo[index].content = _content
        }
    }
    
    func delete(index: Int) {
        todo.remove(at: index)
    }
    
}
