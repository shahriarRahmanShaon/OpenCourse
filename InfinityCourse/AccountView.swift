//
//  AccountView.swift
//  InfinityCourse
//
//  Created by sergio shaon on 14/4/22.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView {
            List{
                VStack {
                    Image(systemName: "person.crop.circle.badge.checkmark")
                        .symbolVariant(.circle.fill)
                        .font(.system(size: 33))
                        .symbolRenderingMode(.palette)
                        .foregroundColor(Color.blue.opacity(0.5))
                        .padding()
                        .background(Circle().fill(.ultraThinMaterial))
                        .background(
                            Image(systemName: "hexagon")
                                .foregroundColor(.blue)
                                .font(.system(size: 220))
                                .symbolVariant(.fill)
                                .offset(x: -50, y: -100)
                    )
                    Text("Sergio Shaon")
                        .font(.title)
                        .bold()
                    Text("Rajshahi")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
                .frame(maxWidth: .infinity)
                Section{
                    NavigationLink{
                        ContentView()
                    }label: {
                        Label("Settings", systemImage: "gear")
                    }
                    NavigationLink{
                        Text("Billing")
                    }label:{
                        Label("Billing", systemImage: "creditcard")
                    }
                    NavigationLink{
                        Text("Help")
                    }label: {
                        Label("Help", systemImage: "questionmark")
                    }
                }
                .listRowSeparatorTint(.green)
                .listRowSeparator(.hidden)
                
                Section{
                    HStack {
                        Link(destination: URL(string: "https://google.con")!) {
                            Label("Website", systemImage: "house")
                        }
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                    HStack {
                        Link(destination: URL(string: "https://google.con")!) {
                            Label("Youtube", systemImage: "tv")
                        }
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                }
            }
            .foregroundColor(.primary)
            .navigationTitle("Account")
            .listStyle(.automatic)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
