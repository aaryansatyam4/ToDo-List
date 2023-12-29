//
//  HeaderView.swift
//  ToDo List
//
//  Created by aryan on 28/12/23.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background:Color
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
                .offset(y:-75)
            VStack{
                Text(title)
                    .font(.system(size:50))
                    .foregroundColor(Color.white)
                    .bold()
                Text(subtitle)
                    .font(.system(size:20))
                    .foregroundColor(Color.gray)
                    .bold()
            }
            .padding(.top,-150)
            
            
        }
        .frame(width: UIScreen.main.bounds.width*100,height: 350)
        
        
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "", subtitle: "", angle: 10, background: .indigo)
    }
}
