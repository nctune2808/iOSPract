//
//  Home.swift
//  CovidVisualisation
//
//  Created by Tuan on 21/02/2021.
//

import SwiftUI

struct Home: View {
    
    @State var index = 0
    
    
    var body: some View {
        VStack(spacing: 20){
            HStack{
                Text("Statistics")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                    Text("USA")
                        .foregroundColor(.white)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                }
            }
            .padding(.top, (UIApplication.shared.windows.first? .safeAreaInsets.top)! + 15)
           
            HStack{
                Button(action: {
                    index = 0
                }){
                    Text("My Country")
                        .foregroundColor(index == 0 ? .black : .white)
                        .padding(.vertical, 12)
                        .frame(width: width(num: 2))
                }
                .background(index == 0 ? Color.white : Color.clear)
                .clipShape(Capsule())
                
                Button(action: {
                    index = 1
                }){
                    Text("Global")
                        .foregroundColor(index == 1 ? .black : .white)
                        .padding(.vertical, 12)
                        .frame(width: width(num: 2))
                }
                .background(index == 1 ? Color.white : Color.clear)
                .clipShape(Capsule())
            }
            .background(Color.black.opacity(0.25))
            .clipShape(Capsule())
            .padding(.top, 10)
            
//            ----------------------------------------------------------
            HStack{
                VStack{
                    Text("Affected")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                    
                    Text("221,331")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.title)
                }
                .padding(.vertical)
                .frame(width: width(num: 2))
                .background(Color.orange)
                .cornerRadius(12)
                
                VStack{
                    Text("Deaths")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                    
                    Text("221,331")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.title)
                }
                .padding(.vertical)
                .frame(width: width(num: 2))
                .background(Color.red)
                .cornerRadius(12)
            }
            .foregroundColor(.white)
            .padding(.top,10)
            
//            ----------------------------------------------------------
            HStack{
                VStack{
                    Text("Recovered")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                    
                    Text("221,331")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
         
                }
                .padding(.vertical)
                .frame(width: width(num: 3))
                .background(Color.green)
                .cornerRadius(12)
                
                VStack{
                    Text("Active")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                    
                    Text("221,331")
                        .fontWeight(.bold)
      
                }
                .padding(.vertical)
                .frame(width: width(num: 3))
                .background(Color.yellow)
                .cornerRadius(12)
            
            }
            .foregroundColor(.white)
            .padding(.top,10)
            
            
        }
        .padding(.horizontal)
        .padding(.bottom, 45)
        .background(Color.blue)

        
    }
}

    
func width(num: Int) -> CGFloat {
    return ((UIScreen.main.bounds.width / CGFloat(num)) - 30)
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
