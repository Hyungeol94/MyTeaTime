//
//  ContentView.swift
//  MyTeaTime
//
//  Created by Lyosha's MacBook   on 4/15/24.
//

import SwiftUI
import SwiftData


//struct TeaTimeBook: Identifiable, Hashable {
struct TeaTimeBook: Identifiable {
    
//    func hash(into hasher: inout Hasher){
//        hasher.combine(id)
//    }
//    
//    static func == (lhs: TeaTimeBook, rhs: TeaTimeBook ) -> Bool{
//        return lhs.id == rhs.id
//    } // -> #즐겨찾기에서 오류가 남
    
    var id: UUID = UUID()
    var title: String
    var createdTime: Date
    var MemoArray: [Memo]
    var isFavorite: Bool
    
    init (title: String){
        self.MemoArray = []
        self.title = title
        self.createdTime = Date.now
        self.isFavorite = false
    }
}

struct Memo {
    var id: UUID = UUID()
    var title: String
    var createdTime: Date
    var content: String
    var imageName: String
    
    init(title:String, content: String, imageName: String){
        self.title = title
        self.createdTime = Date.now
        self.content = content
        self.imageName = imageName
    }
}



struct ContentView: View {
//    @Environment(\.modelContext) private var modelContext
//    @Query private var items: [Item]
//    @Query private var TeaTimeBooks: [TeaTimeBook]
    @State var teaTimeBooks: [TeaTimeBook] = [
        TeaTimeBook(title : "나의 티타임북")
    ]
    
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
