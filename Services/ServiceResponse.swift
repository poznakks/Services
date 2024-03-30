//
//  ServiceResponse.swift
//  Services
//
//  Created by Vlad Boguzh on 31.03.2024.
//

import Foundation

struct ServiceResponse: Decodable {
    let body: Body
    let status: Int

    struct Body: Decodable {
        let services: [Service]
    }
}

struct Service: Decodable {
    let name: String
    let description: String
    let link: URL
    let iconUrl: URL

    static var previewSample: Service {
        Service(
            name: "ВКонтакте",
            description: "Самая популярная соцсеть и первое суперприложение в России",
            link: URL(string: "https://vk.com/")!,
            iconUrl: URL(string: "https://publicstorage.hb.bizmrg.com/sirius/vk.png")!
        )
    }

    static var previewSamples: [Service] {
        return [
            Service.previewSample,
            Service.previewSample,
            Service.previewSample,
            Service.previewSample,
            Service.previewSample,
            Service.previewSample,
            Service.previewSample,
            Service.previewSample
        ]
    }
}
