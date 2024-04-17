//
//  ContentView.swift
//  MyTeaTime
//
//  Created by Lyosha's MacBook   on 4/15/24.
//

import SwiftUI
import SwiftData

//struct TeaTimeBook {
//    var id: UUID = UUID()
//    var title: String
//    var createdTime: Date
//    var MemoArray: [Memo]?
//}

struct TeaTimeBook: Identifiable {
    var id: UUID = UUID()
    var title: String
    var createdTime: Date
    var MemoArray: [Memo]?
    var isFavorite: Bool
    
    init (title: String){
        self.title = title
        self.createdTime = Date.now
        self.isFavorite = true
    }
}

struct Memo {
    var id: UUID = UUID()
    var title: String
    var createdTime: Date
    var content: String?
    var image: Image?
}



struct ContentView: View {
//    @Environment(\.modelContext) private var modelContext
//    @Query private var items: [Item]
//    @Query private var TeaTimeBooks: [TeaTimeBook]
    @State var teaTimeBooks: [TeaTimeBook] = [
        TeaTimeBook(title : "나의 티타임북")
    ]
    @State var showSheet = false
    @State var newBookTitle = ""

    
    var body: some View {
        //select TeaTimeBook first
        TeaTimeBookList(teaTimeBooks: $teaTimeBooks)
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
