//
//  ContentView.swift
//  MyTeaTime
//
//  Created by Lyosha's MacBook   on 4/15/24.
//

import SwiftUI
import SwiftData


struct ContentView: View {
//    @Environment(\.modelContext) private var modelContext
//    @Query private var items: [Item]
    @Query private var teaTimeBooks: [TeaTimeBook]
    
    var body: some View {
        //select TeaTimeBook first
        TeaTimeBookList(teaTimeBooks: teaTimeBooks)
    }
    
    
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
