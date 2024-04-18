//
//  MemoView.swift
//  MyTeaTime
//
//  Created by Lyosha's MacBook   on 4/18/24.
//

import Foundation
import SwiftUI

struct MemoView: View{
    @Binding var memo: Memo
    var body: some View {
        ScrollView{
            VStack{
                //날짜, 필터
                Text("날짜, 필터")
                //이미지
                Image(memo.imageName)
                //컨텐츠
                Text(memo.content)
                    .lineSpacing(10.0)
                
            }
        }
    }
}
