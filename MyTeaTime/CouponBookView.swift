//
//  CouponBookView.swift
//  MyTeaTime
//
//  Created by Hyungeol Lee on 4/16/24.
//

import Foundation
import SwiftUI

struct CouponBookView: View {
    @Binding var teaTimeBook: TeaTimeBook
    @State var newMemoTitle: String = ""
    @State var newMemoContent: String = ""
    @State var newMemoImage: Image = Image(systemName: "cup.and.saucer.fill")
    @State var showSheet: Bool = false
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        //CollectionView
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0...8, id: \.self) { _ in
//                    Color.orange.frame(width: 120, height: 120)
                    Image("DefaultCoffee")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .scaledToFit()
                }
            }
        } 
        .navigationTitle(teaTimeBook.title)
        .toolbar {
            Button(action: {
                showSheet = true
            }, label: {
                Image(systemName:
                "plus.circle.fill")
            })
        }
        .sheet(isPresented: $showSheet, content: {
            TextField("새로운 티타임 기록",
                      text: $newMemoTitle)
            Button(action:{
                teaTimeBook.MemoArray.append(Memo(title: newMemoTitle, content: newMemoContent, image: newMemoImage));
                showSheet = false
            }, label: {
                Text("추가")
            })
        })
    }
}
