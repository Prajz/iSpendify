//
//  HomeView.swift
//  iSpendify
//
//  Created by Dev Prajapati on 29/01/2023.
//

import SwiftUI
import SwiftUICharts

struct HomeView: View {
    
    @Environment (\.managedObjectContext) var mox
    @FetchRequest (sortDescriptors: [NSSortDescriptor(key: "datec", ascending: true)]) var transf : FetchedResults<Tra>
    @FetchRequest (sortDescriptors: [NSSortDescriptor(key: "datec", ascending: false)]) var trans : FetchedResults<Tra>
    @State private var showingAddScreen = false
    
    
    @State var out: [Double] = [0]
    
    @State var fetched: [Double] = []
    
    var demoData: [Double] = [-4,7,3,-1,9]
    
    func fillgr(){
        print("bongo1")
        for item in transf{
            var bong = item.amountc
            print("tt \(String(describing: bong))")
            var bongd = NumberFormatter().number(from: bong!)?.doubleValue
            var roundbong = round((bongd ?? 0.0) * 100) / 100
            if (item.isExpensec == true){
                roundbong = 0 - (roundbong)
            }
            print("bongo \(roundbong)")
            let t = (out.last ?? 0.00) + roundbong
            if (t == out.last) {
                
            }else{
                out.append(t)
            }
        }
        
    }
    
    func createformatter() -> DateFormatter{
        let form = DateFormatter()
        form.dateStyle = .medium
        form.timeZone = .current
        
        return form
    }
    
    init(){
        let _ = fillgr()
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    let _ = fillgr()
                    HStack{
                        CardView(){
                            VStack{
                                ChartLabel( " £\(out.last ?? 0.00)", type: .title, format: "%.2f")
                                    
                                LineChart()
                            }
                            .background(Color.background)
                            .foregroundColor(Color.icon)
                        }
                        .data(out)
                        .chartStyle(ChartStyle(backgroundColor: Color.background, foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
                        .frame(height: 300)
                        .foregroundColor(Color.background)
                        
                    }
                    Text("Total transactions: \(trans.count)")
                        .padding()
                    
                    HStack{
                        Text("Recent Transactions")
                            .bold()
                        Spacer()
                    }
                    .padding(.top)
                    .clipShape(RoundedRectangle(cornerRadius: 3, style: .continuous))
                    ForEach(trans.prefix(3)){ item in
                        HStack(spacing:20){
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .fill(Color.icon.opacity(0.45))
                                .frame(width: 50, height: 50)
                                .overlay {
                                    if (item.categoryc == "Transport") {
                                        Image(systemName: "bus")
                                        //.foregroundColor(.white)
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                    }
                                    if (item.categoryc == "Software") {
                                        Image(systemName: "macbook.and.iphone")
                                        //.foregroundColor(.white)
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                    }
                                    if (item.categoryc == "Food") {
                                        Image(systemName: "fork.knife")
                                        //.foregroundColor(.white)
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                    }
                                    if (item.categoryc == "Leisure") {
                                        Image(systemName: "figure.skiing.downhill" )
                                        //.foregroundColor(.white)
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                    }
                                    if (item.categoryc == "Health") {
                                        Image(systemName: "stethoscope")
                                        //.foregroundColor(.white)
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                    }
                                    if (item.categoryc == "Work") {
                                        Image(systemName: "latch.2.case")
                                        //.foregroundColor(.white)
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                    }
                                }
                            VStack(alignment: .leading, spacing: 4){
                                //MARK: Transaction merchant
                                Text(item.merchantc ?? "non")
                                    .font(.subheadline)
                                    .bold()
                                    .lineLimit(1)
                                
                                //MARK: Transaction Category
                                Text(item.categoryc ?? "none")
                                    .font(.footnote)
                                    .opacity(0.7)
                                    .lineLimit(1)
                                let form = createformatter()
                                
                                //MARK: Transaction Date
                                Text(form.string(from:item.datec ?? Date()))
                                    .font(.footnote)
                                    .opacity(0.7)
                                
                            }
                            Spacer()
                            let bong = item.amountc
                            let bongd = NumberFormatter().number(from: bong!)?.doubleValue
                            let roundbong = round((bongd ?? 0.0) * 100) / 100
                            let b: String = String(format: "%.2f", roundbong)
                            
                            if (item.isExpensec == true){
                                Text("£\(b)")
                            }else{
                                Text("+ £\(b)")
                                    .foregroundColor(.mint)
                            }
                            //MARK: Transaction Amount
                            
                            //.foregroundColor()
                        }
                        .padding([.top, .bottom], 11)
                        .padding(.horizontal)
                        .foregroundColor(Color.text)
                        .background(Color.background)
                        Divider()
                    }
                }
                .shadow(color: Color.icon.opacity(0), radius: 10, x: 0, y:5)
                .padding()
                .frame(
                      minWidth: 0,
                      maxWidth: .infinity,
                      minHeight: 0,
                      maxHeight: .infinity,
                      alignment: .topLeading
                    )
                .toolbar{
                    ToolbarItem{
                        Button{
                            showingAddScreen.toggle()
                        } label: {
                            Label("Add", systemImage: "plus.app")
                                .foregroundColor(Color.icon)
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen){
                    inputView()
                }
                .foregroundColor(Color.text)
                .navigationBarTitleDisplayMode(.large)
                .navigationTitle("Overview")
            }
            .refreshable{
                fillgr()
            }
            .background(Color.background)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
