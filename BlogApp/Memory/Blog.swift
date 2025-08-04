//
//  Blog.swift
//  BlogApp
//
//  Created by Yohan Yoon on 8/3/25.
//

import Foundation
import SwiftUI

class Blog: Identifiable, ObservableObject {
    let id: UUID
    @Published var title: String
    @Published var content: String
    let insertDate: Date
    
    init(title: String, content: String, insertDate: Date = Date.now) {
        id = UUID()
        self.title = title
        self.content = content
        self.insertDate = insertDate
    }
    
}
