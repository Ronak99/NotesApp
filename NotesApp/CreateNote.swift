//
//  CreateNote.swift
//  NotesApp
//
//  Created by Ronak Punase on 12/07/25.
//

import SwiftUI
import SwiftData
import Photos
import PhotosUI

struct CreateNote: View {
    @Environment(
        \.dismiss
    ) private var dismiss
    @Environment(
        \.modelContext
    ) private var modelContext
    
    @State var isPresented = false
    
    @State private var content: String = ""
    
    @State private var selectedNoteContentCover: PhotosPickerItem?
    @State private var selectedNoteContentCoverData: Data?
    
    let note: Note?
    
    init(
        note: Note? = nil
    ) {
        self.note = note
        _content = State(
            initialValue: note?.content ?? ""
        )
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                PhotosPicker(
                    selection: $selectedNoteContentCover,
                    matching: .images,
                    photoLibrary: .shared()
                ) {
                    HStack {
                        Image(
                            systemName: "photo.fill"
                        )
                        Text(
                            "Select Photos"
                        )
                    }
                }
                
                Button {
                    // show bottomsheet
                    isPresented = true
                    
                } label: {
                    HStack(
                        spacing: 6
                    ) {
                        Image(
                            systemName: "tag.fill"
                        )
                        Text(
                            "Add Tag"
                        )
                    }
                    .foregroundColor(
                        .blue
                    )
                }.sheet(
                    isPresented: $isPresented
                ) {
                    Text(
                        "Some View"
                    )
                }
                
                Section(
                    header: Text(
                        note == nil ? "Write a note" : "Update your current note"
                    )
                ) {
                    Group {
                        if let selectedNoteContentCoverData,
                           let uiImage = UIImage(data: selectedNoteContentCoverData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                                .cornerRadius(8)
                                .padding(.top, 8)
                        }
                    }.overlay(alignment: .topTrailing) {
                        if selectedNoteContentCoverData != nil {
                            Button {
                                // close
                                selectedNoteContentCoverData = nil
                                selectedNoteContentCover = nil
                            } label: {
                                Image(systemName: "x.circle.fill")
                                        .foregroundColor(.red)
                                        .font(.system(size: 16))
                                        .padding(10)
                                        .background(Color.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.red.opacity(0.2), lineWidth: 1)
                                        )
                                        .shadow(color: .black.opacity(0.05), radius: 1, x: 0, y: 1)
                            }
                        }
                    }
                    TextEditor(
                        text: $content
                    )
                }
            }
            .navigationTitle(
                note == nil ? "Create" : "Update"
            )
            .toolbar {
                ToolbarItem {
                    Button {
                        if note == nil {
                            let note = Note(
                                content: content,
                                createdAt: .now
                            )
                            note.updateNoteCover(data: selectedNoteContentCoverData)
                            modelContext.insert(note)
                        } else {
                            note!.updateContent(content: content)
                            note!.updateNoteCover(
                                    data: selectedNoteContentCoverData
                                )
                        }
                        
                        dismiss()
                    } label: {
                        Text(
                            "Save"
                        )
                    }
                }
            }.task(id: selectedNoteContentCover) {
                if let data = try? await selectedNoteContentCover?.loadTransferable(type: Data.self) {
                    selectedNoteContentCoverData = data
                }
            }.onAppear {
                selectedNoteContentCoverData = note?.noteCover
            }
        }
    }
}



#Preview {
    CreateNote()
}
