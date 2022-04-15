//
//  ColoredTypePicker.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 4/14/22.
//

import SwiftUI

struct ColoredTypePicker: View {
    @Binding var selectedType: MediaType
    let list: [MediaType]
    var body: some View {
        GeometryReader { geometry in
            let unit = geometry.size.width / CGFloat(list.count)
            HStack(spacing:0) {
                ForEach(list, id: \.self) { type in
                    Button {
                        selectedType = type
                    } label: {
                        Text("\(type.toString())")
                            .frame(width: unit)
                            .padding(.vertical, 5)
                            .background(type.getColor())
                        
                    }
                    .buttonStyle(.plain)
                    
                }
                .clipShape(RoundedRectangle(cornerRadius: 7))
                
            }
            .overlay {
                GeometryReader { proxy in
                    RoundedRectangle(cornerRadius: 7).stroke(Color.primary, lineWidth: 2.5)
                        .frame(width: unit)
                        .offset(x: unit * CGFloat(selectedType.intValue())).animation(.default)
                }
            }
            
            
        }
    }
}
