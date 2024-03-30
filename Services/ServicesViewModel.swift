//
//  ServicesViewModel.swift
//  Services
//
//  Created by Vlad Boguzh on 31.03.2024.
//

import Foundation

@MainActor
final class ServicesViewModel: ObservableObject {

    @Published var showAlert = false
    @Published private(set) var errorMessage = ""
    @Published private(set) var services: [Service] = []

    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return jsonDecoder
    }()

    func fetchServices() async {
        let urlString = "https://publicstorage.hb.bizmrg.com/sirius/result.json"
        guard let url = URL(string: urlString) else { return }

        guard let (data, _) = try? await URLSession.shared.data(from: url) else {
            errorMessage = "Services fetching failed"
            showAlert = true
            return
        }

        guard let decodedData = try? jsonDecoder.decode(ServiceResponse.self, from: data) else {
            errorMessage = "Parsing failed"
            showAlert = true
            return
        }

        self.services = decodedData.body.services
    }
}
