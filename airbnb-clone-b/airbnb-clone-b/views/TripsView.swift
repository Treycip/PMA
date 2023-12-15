//
//  TripView.swift
//  airbnb-clone-b
//
//  Created by MAC45 on 10/11/23.
//

import SwiftUI
import MapKit

struct TripsView: View {
    @StateObject var contentViewModel = ContentViewModel()

    
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -12.0450947, longitude: -76.9545933), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))

    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, annotationItems: contentViewModel.annotations) {
                                  MapMarker(coordinate: $0.coordinate)
                              }
            VStack {
                Button {
                    region.span.latitudeDelta *= 4.5
                    region.span.longitudeDelta *= 4.5
                } label: {
                    Text("Zoom out")
                }
                Spacer()
                HStack {
                    ZStack(alignment:.topLeading){
                        Image("item1")
                            .resizable()
                            .frame(width: 120, height: 120)
                        Image(systemName:"xmark.circle.fill")
                            .background()
                            .cornerRadius(90)
                            .padding(6)
                    }
                    
                    VStack(alignment: .leading, spacing: 50) {
                        HStack(alignment:.bottom){
                            Text("La Calera, Colombia")
                                .font(.caption)
                                .fontWeight(.semibold)
                            Spacer()
                            Image(systemName: "heart")
                        }
                        
                        HStack(alignment:.bottom){
                            VStack{
                                Text("Nov 19 - 24")
                                    .font(.caption)
                                    .fontWeight(.light)
                                    .padding(.trailing,2)
                                Text("S/ 268 night")
                                    .font(.caption)
                                
                            }
                            Spacer()
                            HStack{
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 8, height: 8)
                                Text("4.91")
                                    .font(.caption)
                            }
                                
                        }
                        
                    }
                    
                    .padding(.vertical)
                    Spacer()
                }
                .frame(height: 120)
                .background(.white)
            }
            .padding()
        }
    }
}
struct TripsView_Previews: PreviewProvider {
    static var previews: some View {
        TripsView()
    }
}
