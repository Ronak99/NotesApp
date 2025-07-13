//
//  ContentView.swift
//  NotesApp
//
//  Created by Ronak Punase on 08/07/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query var notes: [Note]
    
    var body: some View {
        NavigationStack {
            // content list
            HomeView(notes: notes)
            .navigationTitle("My Notes")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    NavigationLink {
                        CreateNote()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
