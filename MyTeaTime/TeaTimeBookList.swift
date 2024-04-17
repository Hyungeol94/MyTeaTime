//
//  TeaTimeBookList.swift
//  MyTeaTime
//
//  Created by Lyosha's MacBook   on 4/17/24.
//

import Foundation
import SwiftUI

struct TeaTimeBookList: View{
    @Binding var teaTimeBooks: [TeaTimeBook]
    @State var showSheet: Bool = false
    @State var newBookTitle: String = ""
    
    var body: some View{
           NavigationSplitView{
               List{
                   ForEach($teaTimeBooks){ teaTimeBook in
                       NavigationLink{
                           CouponBookView(teaTimeBook: teaTimeBook)
                       } label: {
                           TeaTimeBookRow(teaTimeBook: teaTimeBook)
                       }
                   }
               }
               .toolbar {
                      Button(action: {
                          showSheet = true
                      }, label: {
                          Image(systemName:
                          "plus.circle.fill")
                      })
                  }
                  .sheet(isPresented: $showSheet, content: {
                      TextField("새로운 티타임북",
                                text: $newBookTitle)
                      Button(action:{
                          teaTimeBooks.append(TeaTimeBook(title : newBookTitle,
                                                          createdTime : Date.now))
                          showSheet = false
                      }, label: {
                          Text("추가")
                      })
                  })
           } detail : {
               Text("티타임북을 선택하세요")
           }
        //
        
       }
   }
