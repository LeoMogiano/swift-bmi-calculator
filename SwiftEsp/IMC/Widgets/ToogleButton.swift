import SwiftUI

struct ToogleButton:View {
    let text:String
    let emoji:String
    let gender:Int
    
    @Binding var selectedGender:Int
    
    var body: some View {
        
        let color = gender == selectedGender ? Color.bgComponentSelect : Color.bgComponent
        
        Button(action:{
            selectedGender = gender
        }){
            VStack {
                Text(emoji)
                    .font(.system(size: 70))
                Text(text)
                    .font(.system(size: 30))
                    .foregroundStyle(.white)
                    .bold()
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
        .background(color)
    }
}
