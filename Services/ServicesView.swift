//
//  ServicesView.swift
//  Services
//
//  Created by Vlad Boguzh on 31.03.2024.
//

import SwiftUI

struct ServicesView: View {

    @StateObject private var viewModel = ServicesViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.services, id: \.name) { service in
                Link(destination: service.link) {
                    ServiceRow(service: service)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Сервисы")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await viewModel.fetchServices()
            }
            .alert(
                "Error",
                isPresented: $viewModel.showAlert,
                actions: {
                    Button("OK") {}
                },
                message: {
                    Text(viewModel.errorMessage)
                }
            )
        }
    }
}

#Preview {
    ServicesView()
}
