//
//  WebService.swift
//  Cloud Spreadsheets
//
//  Created by Chase Lewis on 1/25/24.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case invalidRequest
    case badResponse
    case badStatus
    case failedToDecodeResponse
}

class WebService {
    func fetchDataFrom<T: Codable>(from table: ATTable) async -> T? {
        guard let downloadedData: T = await WebService().downloadData(table) else {return nil}

        return downloadedData
    }

    private func downloadData<T: Codable>(_ table: ATTable) async -> T? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 6)
        do {
            guard let url = URL(string: table.link) else { throw NetworkError.badUrl }
            var request = URLRequest(url: url)
            request.setValue(table.bearerToken, forHTTPHeaderField: "Authorization")
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse else { throw NetworkError.badResponse }
            guard response.statusCode >= 200 && response.statusCode < 300 else { throw NetworkError.badStatus }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            print()
            print(String(data: data, encoding: .utf8)!)
            guard let decodedResponse = try? decoder.decode(T.self, from: data) else { throw NetworkError.failedToDecodeResponse }

            return decodedResponse
        } catch NetworkError.badUrl {
            print("There was an error creating the URL")
        } catch NetworkError.badResponse {
            print("Did not get a valid response")
        } catch NetworkError.badStatus {
            print("Did not get a 2xx status code from the response")
        } catch NetworkError.failedToDecodeResponse {
            print("Failed to decode response into the given type")
        } catch {
            print("An error occured downloading the data")
        }

        return nil
    }
    
    func create(_ records: FeedbackRecords) async {
            do {
                guard let url = URL(string: ATTable.feedback.link) else { throw NetworkError.badUrl }
                var request = URLRequest(url: url)
                request.httpMethod = ATTable.feedback.httpMethod
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.setValue(ATTable.feedback.bearerToken, forHTTPHeaderField: "Authorization")
                guard let jsonBody = try? JSONEncoder().encode(records) else {return}
                let (data, response) = try await URLSession.shared.upload(for: request, from: jsonBody)
                guard let response = response as? HTTPURLResponse else { throw NetworkError.badResponse }
                guard response.statusCode >= 200 && response.statusCode < 300 else {
                    print("Status Code", response.statusCode)
                    throw NetworkError.badStatus
                }
                
                // we could use this to display the record update that was successfull.
                // but this implementation doesn't use the next line
                guard let decodedResponse = try? JSONDecoder().decode(FeedbackRecords.self, from: data) else { throw NetworkError.failedToDecodeResponse }
                
                print("Successfully updated the record")
            } catch NetworkError.badUrl {
                print("There was an error creating the URL")
            } catch NetworkError.badResponse {
                print("Did not get a valid response")
            } catch NetworkError.badStatus {
                print("Did not get a 2xx status code from the response")
            } catch NetworkError.failedToDecodeResponse {
                print("Failed to decode response into the given type")
            } catch {
                print("An error occured downloading the data")
            }
        }
}
