//
//  BlogStore.swift
//  BlogApp
//
//  Created by Yohan Yoon on 8/3/25.
//

import Foundation

class BlogStore: ObservableObject {
    @Published var list: [Blog]
    
    init() {
        list = [
            Blog(title: "School Day", content: "I went to school, today", insertDate: Date.now),
            Blog(title: "Work Day", content: "I went to work, today", insertDate: Date.now.addingTimeInterval(3600 * -24)),
            Blog(title: "Rest Day", content: "I took a rest today", insertDate: Date.now.addingTimeInterval(3600 * -48))
        ]
    }
    
    func insert(title: String, content: String) {
        list.insert(Blog(title: title, content: content), at: 0)
    }
    
    func update(blog: Blog?, content: String) {
        guard let blog = blog else {
            return
        }
        blog.content = content
    }
    
    func delete(blog: Blog) {
        list.removeAll { $0.id == blog.id }
    }
    
    func delete(set: IndexSet) {
        for index in set {
            list.remove(at: index)
        }
    }
}
