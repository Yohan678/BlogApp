//
//  BlogCellView.swift
//  BlogApp
//
//  Created by Yohan Yoon on 8/3/25.
//

import SwiftUI

struct BlogCellView: View {
    @ObservedObject var blog: Blog
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(blog.title)
                .font(.body)
                .lineLimit(1)
            
            Text(blog.insertDate, style: .date)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

#Preview {
    BlogCellView(blog: Blog(title: "Test", content: "Test"))
}
