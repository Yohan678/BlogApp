//
//  ComposerView.swift
//  BlogApp
//
//  Created by Yohan Yoon on 8/3/25.
//

import SwiftUI

struct ComposerView: View {
    @EnvironmentObject var store: BlogStore
    
    @Environment(\.dismiss) var dismiss
    
    var blog: Blog? = nil
    
    @State private var title: String = ""
    @State private var content: String = ""
    
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("title", text: $title)
                    .padding()
                    .border(Color.black)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .onAppear {
                        if let blog = blog {
                            title = blog.title
                        }
                    }
                
                TextField("I had a this day...", text: $content)
                    .padding()
                    .onAppear {
                        if let blog = blog {
                            content = blog.content
                        }
                    }
                Spacer()
                
                
            }
            .navigationTitle(blog != nil ? "Edit Post" : "New Post")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.red)
                    }
                }
                
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {
                        if let blog = blog {
                            store.update(blog: blog, title: title, content: content)
                        } else {
                            store.insert(title: title, content: content)
                        }
                        dismiss()
                    } label: {
                        Text("Save")
                    }
                }
            }
        }
    }
}

#Preview {
    ComposerView()
        .environmentObject(BlogStore())
}
