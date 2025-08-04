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
    
    @State private var showEdit: Bool = false
    
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
                            showEdit = true
                        } label: {
                            Image(systemName: "square.and.pencil")
                        }
                    }
                    
                    ToolbarItemGroup(placement: .bottomBar) {
                        Button {
                            store.delete(blog: blog)
                        } label: {
                            Image(systemName: "trash")
                        }
                        .foregroundColor(.red)
                        
                        Text(blog.insertDate, style: .date)
                            .foregroundColor(.secondary)
                            .font(.footnote)
                    }
                }
                .sheet(isPresented: $showEdit) {
                    ComposerView(blog: blog)
                }
            }
        }
    }
}

#Preview {
    DetailBlogView(blog: Blog(title: "Title Dummy", content: "Content Dummy"))
        .environmentObject(BlogStore())
}
