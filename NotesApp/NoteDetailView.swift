//
//  NoteDetailView.swift
//  NotesApp
//
//  Created by Ronak Punase on 09/07/25.
//

import SwiftUI
import PhotosUI

struct NoteDetailView: View  {
    let note: Note
    
    // Add this for development - sample image data
    private var sampleImageData: Data? {
        // You can replace this with any sample image from your bundle
        return UIImage(systemName: "photo.fill")?.pngData()
    }
    
    init(note: Note) {
        self.note = note
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                if let noteCover = note.noteCover,
                   let uiImage = UIImage(data: noteCover) {
                    Image(
                        uiImage: uiImage
                    )
                    .resizable(
                        resizingMode: .stretch
                    )
                    .frame(height: 350)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .clipped()
                }
                
                Text(note.content)
                    .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                Spacer()
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .automatic, content: {
                    NavigationLink {
                        CreateNote(note: note)
                    } label: {
                        Text("Edit")
                    }
                })
            }
        }
    }
}

#Preview {
    NoteDetailView(note: Note(content: "Sample Content 2", createdAt: .now))
}
