//
//  ContentView.swift
//  UI-83
//
//  Created by にゃんにゃん丸 on 2020/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    
    var width = UIScreen.main.bounds.width
    var body: some View{
        
        TabView(){
            
            ForEach(datas){data in
                
                GeometryReader{reader in
                    
                    ZStack{
                        
                        LinearGradient(gradient: .init(colors: [.red,data.color]), startPoint: .top, endPoint: .bottomTrailing)
                        
                        Image(data.story)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 20, content: {
                            
                            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
                                
                                
                                Capsule()
                                    .fill(Color.black.opacity(0.3))
                                    .frame(height: 5)
                                
                                Capsule()
                                    .fill(Color.white)
                                    .frame(height: 5)
                                    .frame(width: data.offset)
                                
                            })
                                
                                HStack(spacing:10){
                                    
                                    Image(data.story)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 40, height: 40)
                                        .clipShape(Circle())
                                    
                                    Text(data.name)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    
                                    
                                    Text(data.time)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    
                                    
                                    
                                    
                                    
                                    
                                }
                                .padding()
                                
                                
                                
                                
                                
                               
                          
                            Spacer()
                            
                            
                        })
                        .padding(.all)
                        
                        
                    }
                    .frame(width: reader.frame(in: .global).width, height:reader.frame(in: .global).height)
                    
                    
                    .rotation3DEffect(
                        .init(degrees: getAngle(offset: reader.frame(in: .global).minX)),
                        axis: (x: 0.0, y: 1.0, z: 0.0),
                        anchor: reader.frame(in: .global).minX > 0 ? .leading : .trailing,
                        
                        perspective: 3.5
                    )
                    
                    
                }
                
            }
            
            
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .background(Color.black.edgesIgnoringSafeArea(.all))
        
        
    }
    
    func getAngle(offset : CGFloat) -> Double{
        
        let tempAngle = offset / (width / 2)
        let rotationDegree : CGFloat = 20
        
        return Double(tempAngle * rotationDegree)
        
        
        
    }
}

struct data : Identifiable {
    var id = UUID().uuidString
    var story : String
    var name : String
    var time : String
    var offset : CGFloat
    var color : Color
}

var datas = [

    data(story: "p1", name: "What?", time: "1H", offset: 100, color: .blue),
    data(story: "p2", name: "2020", time: "2H", offset: 200, color: .red),
    data(story: "p3", name: "Tokyo", time: "3h", offset: 50, color: .purple),
    data(story: "p4", name: "Cool", time: "4h", offset: 250, color: .green),
    data(story: "p5", name: "にゃ〜", time: "5H", offset: 80, color: .orange),

]

