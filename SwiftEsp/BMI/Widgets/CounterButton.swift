import SwiftUI

struct CounterButton:View {
    
    let text:String
    @Binding var counter:Int
    
    var body: some View {
        VStack{
            Text(text)
                .font(.system(size: 20))
                .foregroundStyle(.gray)
            
            Text("\(counter)")
                .font(.system(size: 30))
                .foregroundStyle(.white)
                .bold()
            
            HStack{
                CustomCounterBtn(isPlus: false, counter: $counter)
                CustomCounterBtn(isPlus: true, counter: $counter)
            }
            
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(.bgComponent)
    }
}

struct CustomCounterBtn: View {
    let isPlus:Bool
    @Binding var counter:Int
    
    var body: some View {
        
        let symbol = isPlus ? "plus" :  "minus"
        
        Button(action:{
            
            (isPlus) 
            ? (counter = min(counter + 1, 100))
            : (counter = max(counter - 1, 0))
        }) {
            ZStack{
                Circle()
                    .frame(height: 45)
                    .foregroundStyle(.purple)
                Image(systemName: symbol)
                    .foregroundStyle(.white)
            }
        }
    }
}
