import SwiftUI

struct BMIView: View {
    
    @State var gender:Int = -1
    @State var height:Double = 120.0
    @State var weight:Int = 70
    @State var age:Int = 18
    
    
    var body: some View {
        VStack(){
            
            HStack{
                ToogleButton(text: "Man", emoji: "🧔🏻", gender: 0, selectedGender: $gender)
                ToogleButton(text: "Woman", emoji: "👩🏻", gender: 1, selectedGender: $gender)
            }
            
            HeightCalculator(personalHeight: $height)
            
            
            HStack{
                CounterButton(text: "Age", counter: $age)
                CounterButton(text: "Weight", counter: $weight)
            }
            
            BMICalculateButton(userHeight: Int(height) , userWeight: weight)
            
        }
        
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(.backgroundApp)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("BMI Calculator").foregroundStyle(.white)
            }
        }
        
    }
}

struct BMICalculateButton:View {
    
    let userHeight:Int
    let userWeight:Int
    
    var body: some View {
        
        NavigationStack{
            NavigationLink(destination: BMIResult(userHeight: userHeight, userWeight: userWeight)) {
                Text("Calculate")
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
    BMIView()
}
