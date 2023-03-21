//
//  ContentView.swift
//  Split
//
//  Created by Cyril K Joy on 21/03/23.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = 0.0
    @State private  var numberofPeople = 2
    @State private var  tipPercentage = 20
    let taxPercentage = [0,10,20,30,40,50]
    
    var totalPerson : Double{
        let PeopleCount = Double(numberofPeople)
        let tipselection = Double(tipPercentage)
    
         let taxvalue = amount/100*tipselection
        let grandtotal = amount + taxvalue
        let amountperperson = grandtotal/PeopleCount
        return amountperperson
    }
    var body: some View {
            NavigationView{
                Form{
                    Section{
                        TextField("Enter the Amount Spend"  ,value: $amount, format: .currency(code: Locale.current.currencyCode ?? "INR"))
                            .keyboardType(.decimalPad)
                    } header : {
                        Text("Enter the Amount")
                    }
                    Section{
                        Picker("Number of People",selection: $numberofPeople){
                            ForEach (0..<20){
                                Text("\($0) People")
                            }
                        }
                    }header : {
                        Text("Choose the Number of People")
                    }
                    Section{
                        Picker("Tip Percentage", selection: $tipPercentage){
                            ForEach(taxPercentage,id: \.self ){
                                Text($0 , format:.percent)
                            }
                        }.pickerStyle(.segmented)
                    }   header : {
                        Text("Choose the Tip Percentage")
                    }
                    
                    Section{
                        Text(totalPerson, format: .currency(code: Locale.current.currencyCode ?? "INR"))
                    }.foregroundColor(.blue)
                }
                .navigationTitle("Split")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
