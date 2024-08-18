//
//  MenuView.swift
//  SwiftEsp
//
//  Created by Leo Mogiano on 17/8/24.
//

import SwiftUI

struct MenuView: View {
    

    init() {
        let appearance = UINavigationBarAppearance()
        
        // Configuración del botón de retroceso
        let backItemAppearance = UIBarButtonItemAppearance()
        backItemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.systemPurple] 
        
        appearance.backButtonAppearance = backItemAppearance
        
        // Configuración de la imagen del botón de retroceso
        let image = UIImage(systemName: "chevron.backward")?.withTintColor(.systemPurple, renderingMode: .alwaysOriginal)
        appearance.setBackIndicatorImage(image, transitionMaskImage: image)
        
        UINavigationBar.appearance().standardAppearance = appearance
        
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink("BMI Calculator", destination: BMIView())
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
