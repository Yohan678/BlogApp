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
    
    @State private var title: String = ""
    @State private var content: String = ""
    
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("title", text: $title)
                    .padding()
                    .border(Color.black)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                
                TextField("I had a this day...", text: $content)
                    .padding()
                Spacer()
                
                
            }
            .navigationTitle("New Post")
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
                        store.insert(title: title, content: content)
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
