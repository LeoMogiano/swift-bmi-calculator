import SwiftUI

struct IMCView: View {
    
    @State var gender:Int = -1
    @State var height:Double = 120.0
    
    @State var age:Int = 18
    @State var weight:Int = 70
    
    
    var body: some View {
        VStack(){
            
            HStack{
                ToogleButton(text: "Hombre", emoji: "🧔🏻", gender: 0, selectedGender: $gender)
                ToogleButton(text: "Mujer", emoji: "👩🏻", gender: 1, selectedGender: $gender)
            }
            
            HeightCalculator(personalHeight: $height)
            
            
            HStack{
                CounterButton(text: "Edad", counter: $age)
                CounterButton(text: "Peso", counter: $weight)
            }
            
            IMCCalculateButton(userHeight: Int(height) , userWeight: weight)
            
        }
        
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(.backgroundApp)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("IMC Calculator").foregroundStyle(.white)
            }
        }
        
    }
}

struct IMCCalculateButton:View {
    
    let userHeight:Int
    let userWeight:Int
    
    var body: some View {
        
        NavigationStack{
            NavigationLink(destination: IMCResult(userHeight: userHeight, userWeight: userWeight)) {
                Text("Calcular")
                    .font(.system(size: 25))
                    .foregroundStyle(.purple)
                    .bold()
            }
        }
        
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 80)
        .background(.bgComponent)

    }
}

#Preview {
    IMCView()
}
