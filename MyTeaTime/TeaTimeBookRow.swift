//
//  TeaTimeBookRow.swift
//  MyTeaTime
//
//  Created by Lyosha's MacBook   on 4/17/24.
//

import SwiftUI

struct TeaTimeBookRow: View{
    @Binding var teaTimeBook: TeaTimeBook
    @Binding var isEdit: Bool
    var body: some View{
        HStack{
            if isEdit {
                Button {
                    print("select")
                } label: {
                    Image(systemName: "circle")
                }
            }
            Text(teaTimeBook.title)
            Spacer()
            Button {
                teaTimeBook.isFavorite.toggle()
            } label: {
                Image(systemName: teaTimeBook.isFavorite ? "star.fill" : "star")
            }
            .buttonStyle(BorderlessButtonStyle())
            .frame(width: 3)
            .offset(x: 10)
            Spacer()
                .frame(width: 30)
        }
    }
}

