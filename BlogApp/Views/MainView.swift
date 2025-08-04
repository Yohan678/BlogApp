//
//  MainView.swift
//  BlogApp
//
//  Created by Yohan Yoon on 8/3/25.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var store: BlogStore
    
    @State private var showComposer: Bool = false
    
    var body: some View {
        NavigationView {
            List(store.list) { blog in
                BlogCellView(blog: blog)
            }
            .listStyle(.plain)
            .navigationTitle("Blogs")
            .toolbar {
                Button {
                    showComposer = true
                } label: {
                    Image(systemName: "plus")
                }
                .padding()
            }
            .sheet(isPresented: $showComposer) {
                ComposerView()
            }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(BlogStore())
}
