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
    
    var body: some View{
           NavigationSplitView{
               List{
                   NavigationLink{
                       CouponBookView(teaTimeBook: $teaTimeBooks[0])
                   } label: {
                       TeaTimeBookRow(teaTimeBook: $teaTimeBooks[0])
                   }
               }
           } detail : {
               Text("산을 선택해주세요")
           }
       }
   }
