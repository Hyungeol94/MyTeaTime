//
//  CouponBookView.swift
//  MyTeaTime
//
//  Created by Hyungeol Lee on 4/16/24.
//

import Foundation
import SwiftUI

struct CouponBookView: View {
    @Binding var teaTimeBooks: [TeaTimeBook]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        //CollectionView
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0...100, id: \.self) { _ in
                    Color.orange.frame(width: 100, height: 100)
                }
            }
        }
    }
}
