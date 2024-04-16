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

class TeaTimeBook {
    var id: UUID = UUID()
    var title: String
    var createdTime: Date
    var MemoArray: [Memo]?
    
    init (title: String, createdTime: Date){
        self.title = "나의 티타임";
        self.createdTime = Date.now;
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
    @State var TeaTimeBooks: [TeaTimeBook] = [
        TeaTimeBook(title : "나의 커피북",
                    createdTime : Date.now)
    ]

    
    var body: some View {
        //select TeaTimeBook first
        NavigationStack {
            CouponBookView(teaTimeBooks: $TeaTimeBooks)
                
//                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: {print("add")}) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
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
