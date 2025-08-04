//
//  DetailBlogView.swift
//  BlogApp
//
//  Created by Yohan Yoon on 8/3/25.
//

import SwiftUI

struct DetailBlogView: View {
    @ObservedObject var blog: Blog
    @EnvironmentObject var store: BlogStore
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Text(blog.content)
                            .padding()
                        Spacer(minLength: 0)
                    }
                }
                .navigationTitle(blog.title)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            
                        } label: {
                            Image(systemName: "square.and.pencil")
                        }
                    }
                    ToolbarItemGroup(placement: .bottomBar) {
                        Button {
                            
                        } label: {
                            Image(systemName: "trash")
                        }
                        
                        Text(blog.insertDate, style: .date)
                            .foregroundColor(.secondary)
                            .font(.footnote)
                    }
                }
            }
        }
    }
}

#Preview {
    DetailBlogView(blog: Blog(title: "Title Dummy", content: "Content Dummy"))
        .environmentObject(BlogStore())
}
