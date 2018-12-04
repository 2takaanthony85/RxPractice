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

struct TodoManager {
    
    private var todo: [Todo]
    
    static var instance = TodoManager()
    
    private init() { todo = [] }
    
    mutating func create(title: String) {
        todo.append(Todo(title: title, content: ""))
    }
    
    func read() -> [Todo] {
        return todo
    }
    
    mutating func update(index: Int, title: String, content: String) {
        todo[index].title = title
        todo[index].content = content
    }
    
    mutating func delete(index: Int) {
        todo.remove(at: index)
    }
}
