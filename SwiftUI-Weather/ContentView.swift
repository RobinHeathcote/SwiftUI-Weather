//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Robin Heathcote on 29/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "New Mills, Derbyshire")
                
                
                MainWeatherStatusView(weatherSymbol: isNight ? "moon.stars.fill" : "cloud.sun.fill",temperature: 7)
                
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 11)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 10)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind.snow",
                                   temperature: 4)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "cloud.sun.rain.fill",
                                   temperature: 6)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "cloud.rain.fill",
                                   temperature: 8)
                }
                
             
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 5) {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .bold, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var weatherSymbol: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: weatherSymbol)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
        
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
                .padding()
        }
        .padding(.bottom, 40)
    }
        
}

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
