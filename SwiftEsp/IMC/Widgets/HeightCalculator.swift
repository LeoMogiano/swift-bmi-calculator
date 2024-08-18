import SwiftUI

struct HeightCalculator:View {
    @Binding var personalHeight:Double
    
    var body: some View {
        VStack{
            Text("Altura")
                .font(.system(size: 20))
                .foregroundStyle(.gray)
            Text("\(personalHeight.formatted()) cm")
                .font(.system(size: 40))
                .foregroundStyle(.white)
            
                .bold()
            Slider(value: $personalHeight, in: 100...220, step: 1)
                .padding(.horizontal, 20)
                .tint(.purple)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(.bgComponent)
    }
}
