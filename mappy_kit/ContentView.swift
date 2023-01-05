//
//  ContentView.swift
//  mappy_kit
//
//  Created by Юрий  Лизунов on 05/01/23.
//

import SwiftUI
import MapKit



struct ContentView: View {
    var body: some View {
        MapView()
            .edgesIgnoringSafeArea(.all)
    }
}



struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        let annotation = MKPointAnnotation()
        annotation.title = "Saint-Petersburg"
        annotation.subtitle = "Home"
        annotation.coordinate = CLLocationCoordinate2D(latitude: 59.56, longitude: 30.18)
        mapView.addAnnotation(annotation)
        
        
        return mapView
    }

    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        //
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            print(mapView.centerCoordinate)
        }
        func mapView(_ mapView: MKMapView, viewFor Annotation: MKAnnotation) -> MKAnnotationView? {
            let view = MKMarkerAnnotationView(annotation: Annotation, reuseIdentifier: nil)
            view.canShowCallout = true
            return view
        }
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
    }
    
    
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
