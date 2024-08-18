//
//  IMCResult.swift
//  SwiftEsp
//
//  Created by Leo Mogiano on 17/8/24.
//

import SwiftUI



struct IMCResult: View {
    
    let userHeight:Int
    let userWeight:Int
    @State private var result: Double = 0.0
    @State private var resultText: String = ""
    @State private var resultColor: Color = .white
    @State private var resultDescription:String = ""
    
    var body: some View {
        VStack{
            Text("Tu Resultado")
                .font(.system(size: 35))
                .foregroundStyle(.white)
            
            Text(resultText)
                .font(.system(size: 30))
                .foregroundStyle(resultColor)
                .bold()
            
            Text("\(result, specifier: "%.2f")")
                .font(.system(size: 80))
                .foregroundStyle(.white)
            
            Spacer()
                .frame(height: 20)
            
            Text(resultDescription)
                .font(.system(size: 24))
                .foregroundStyle(.white)
                .padding(.horizontal, 8)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(.backgroundApp)
        .onAppear {
            calculateIMC()
        }
    }
    
    private func calculateIMC() {
        let heightInMeters = Double(userHeight) / 100.0
        result = Double(userWeight) / (heightInMeters * heightInMeters)
        
        switch result {
        case ..<18.5:
            resultText = "Bajo peso"
            resultColor = .yellow
            resultDescription = "Tu índice de masa corporal (IMC) indica que tienes un bajo peso. Es recomendable consultar a un profesional de la salud para obtener asesoramiento adecuado."
        case 18.5..<24.9:
            resultText = "Normal"
            resultColor = .green
            resultDescription = "Tu IMC está en el rango normal. Mantén una dieta equilibrada y un estilo de vida saludable para conservar tu peso."
        case 25..<29.9:
            resultText = "Sobrepeso"
            resultColor = .orange
            resultDescription = "Tu IMC indica que tienes sobrepeso. Considera hacer ajustes en tu dieta y aumentar tu actividad física para mejorar tu salud."
        default:
            resultText = "Obesidad"
            resultColor = .red
            resultDescription = "Tu IMC indica obesidad. Es importante que consultes a un profesional de la salud para recibir orientación y apoyo para alcanzar un peso saludable."
        }
    }
}


#Preview {
    IMCResult(userHeight: 80, userWeight: 100)
}
