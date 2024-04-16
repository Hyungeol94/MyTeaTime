//
//  ContentView.swift
//  MyTeaTime
//
//  Created by Lyosha's MacBook   on 4/15/24.
//

import SwiftUI
import SwiftData

struct TeaTimeBook {
    var id: UUID = UUID()
    var title: String
    var createdTime: Date
    var MemoArray: [Memo]?
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
                    createdTime : Date.now,
                    MemoArray : [])
    ]
    
    
    var body: some View {
        //select TeaTimeBook first
        var selectedTeaTimeBook = TeaTimeBooks.last
        NavigationStack {
            // 여기에 선택된 id의 TeaTimeBook의 아이템을 뿌려주기
            // TeaTimeBook의 element는 Memo임 !
            
            List {
                ForEach (selectedTeaTimeBook) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
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
        } detail: {
            Text("Select an item")
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
