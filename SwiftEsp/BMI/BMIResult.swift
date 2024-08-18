import SwiftUI

struct BMIResult: View {
    
    let userHeight:Int
    let userWeight:Int
    @State private var result: Double = 0.0
    @State private var resultText: String = ""
    @State private var resultColor: Color = .white
    @State private var resultDescription:String = ""
    
    var body: some View {
        VStack{
            Text("Your Result")
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
            calculateBMI()
        }
    }
    
    private func calculateBMI() {
        let heightInMeters = Double(userHeight) / 100.0
        result = Double(userWeight) / (heightInMeters * heightInMeters)
        
        switch result {
        case ..<18.5:
            resultText = "Underweight"
            resultColor = .yellow
            resultDescription = "Your Body Mass Index (BMI) indicates that you are underweight. It is advisable to consult a healthcare professional for proper guidance."
        case 18.5..<24.9:
            resultText = "Normal"
            resultColor = .green
            resultDescription = "Your BMI is in the normal range. Maintain a balanced diet and a healthy lifestyle to keep your weight in check."
        case 25..<29.9:
            resultText = "Overweight"
            resultColor = .orange
            resultDescription = "Your BMI indicates that you are overweight. Consider making adjustments to your diet and increasing physical activity to improve your health."
        default:
            resultText = "Obesity"
            resultColor = .red
            resultDescription = "Your BMI indicates obesity. It is important to consult a healthcare professional for guidance and support to achieve a healthy weight."
        }
    }
}


#Preview {
    BMIResult(userHeight: 80, userWeight: 100)
}
