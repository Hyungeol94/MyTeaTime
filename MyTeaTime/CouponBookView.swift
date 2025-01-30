//
//  CouponBookView.swift
//  MyTeaTime
//
//  Created by Hyungeol Lee on 4/16/24.
//

import Foundation
import SwiftUI

struct CouponBookView: View {
    @Bindable var teaTimeBook: TeaTimeBook
    @State var newMemoTitle: String = ""
    @State var newMemoContent: String = ""
    @State var newMemoImageName: String = "DefaultCoffee"
    @State var showSheet: Bool = false
    @State var isShowingMemo: Bool = false
    @State var currentDate = Date()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var sortedMemo: [Memo] {
        return teaTimeBook.MemoArray.sorted { $0.createdTime < $1.createdTime }
    }
    
    
    var body: some View {
        //CollectionView
        let memoCount = teaTimeBook.MemoArray.count
        let rowCount = max(3, Int(ceil(Double(memoCount) / 3)))
        let finalRowCount = rowCount * 3 == memoCount ? rowCount+1 : rowCount

        ScrollView {
            LazyVGrid(columns: columns) {
//                NavigationStack{
                    ForEach(0...finalRowCount*3-1, id: \.self) { i in
                        //                    Color.orange.frame(width: 120, height: 120)
                        if (i < memoCount){
                            //                        NavigationStack {
                            NavigationLink {
                                MemoView(memo: sortedMemo[i])
                            } label: {
                                Image("FilledCoffee")
                                    .resizable()
                                    .frame(width: 120, height: 120)
                                    .scaledToFit()
                            }
                        }
                        else {
                            Image("DefaultCoffee")
                                .resizable()
                                .frame(width: 120, height: 120)
                                .scaledToFit()
                        }
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
            TextField("새로운 티타임 제목",
                      text: $newMemoTitle)
            Divider()
            DatePicker(
                    "티타임 시간", selection: $currentDate, displayedComponents: [.date])
            .datePickerStyle(.automatic)
            Divider()
            TextField("본문",
                      text: $newMemoContent)
         
            Button(action:{
                teaTimeBook.MemoArray.append(Memo(title: newMemoTitle, content: newMemoContent, imageName: newMemoImageName));
                showSheet = false
            }, label: {
                Text("추가")
            })
        })
    }
}
