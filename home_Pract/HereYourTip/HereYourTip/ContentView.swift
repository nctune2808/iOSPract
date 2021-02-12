//
//  ContentView.swift
//  HereYourTip
//
//  Created by Tuan on 12/02/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfStaff = 0
    @State private var tipPercentage = 0
    
    let tipPercentages = [0,10,15,20,25]
    
    var totalPayment: [Double] {
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipSelection = Double(tipPercentages[tipPercentage])
        let tipValue = orderAmount * tipSelection / 100
        
        let grandTotal = orderAmount + tipValue
        
        return [grandTotal,tipValue]
    }
    
    var tipPerStaff: Double {
        let staffCount = Double(numberOfStaff+2)
        let amountPerStaff = totalPayment[1] / staffCount
        
        return amountPerStaff
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Order Amount")) {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count){
                            Text("\(tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    
                    Picker("Number Of Staffs", selection: $numberOfStaff) {
                        ForEach(2..<50){
                            Text("\($0) Staffs")
                        }
                    }
                }
                
                Section(header: hBox(firstCol: "Total Tip", secondCol: "Staffs' Tip")){
                    hBox(firstCol: "$\(totalPayment[1])", secondCol: "$\(tipPerStaff)")
                }
                
                Section(header: Text("Total Payment")) {
                    Text("$\(totalPayment[0])")
                }
                
            }.navigationTitle("Here Your Tip")
        }
    }
}

struct hBox: View {
    var firstCol: String
    var secondCol: String
    var body: some View {
        HStack(alignment: .center) {
            Text(firstCol)
            Spacer()
            Text(secondCol)
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
