//
//  MenuView.swift
//  SwiftEsp
//
//  Created by Leo Mogiano on 17/8/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink("IMC Calculator", destination: IMCView())
                NavigationLink {
                }label: {
                    Text("Other App")
                }
            }
        }
    }
}

#Preview {
    MenuView()
}
