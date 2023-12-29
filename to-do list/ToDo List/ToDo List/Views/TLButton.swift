//
//  TLButton.swift
//  ToDo List
//
//  Created by aryan on 29/12/23.
//

import SwiftUI

struct TLButton: View {
    let title:String
    let background: Color
    let action :() ->Void
    var body: some View {
        Button{
            //action
            action()
        } label:{
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title: "value", background: .pink){
            //action
        }
    }
}
