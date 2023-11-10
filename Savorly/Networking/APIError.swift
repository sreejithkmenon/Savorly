//
//  APIError.swift
//  Savorly
//
//  Created by Sreejith K Menon on 08/11/23.
//

import Foundation

/// An enumeration defining the various types of errors that can occur in the API layer of an application.
enum APIError: Error, CustomStringConvertible {
    /// Represents an error when the URL is invalid.
    case badURL
    /// Represents a server response error with an associated HTTP status code.
    case badResponse(statusCode: Int)
    /// Represents an error related to URL session tasks.
    case url(URLError?)
    /// Represents a parsing error, typically when decoding data.
    case parsing(DecodingError?)
    /// Represents an unknown error.
    case unknown
    
    /// Provides a user-friendly description of the error for display purposes.
    var localizedDescription: String {
        // User feedback
        switch self {
        case .badURL, .parsing, .unknown:
            // General error message for bad URL, parsing errors, or unknown errors
            return "Sorry, something went wrong."
        case .badResponse(_):
            // Error message for bad server responses
            return "Sorry, the connection to our server failed."
        case .url(let error):
            // Error message for URL session errors, with specific error detail if available
            return error?.localizedDescription ?? "Something went wrong."
        }
    }
    
    /// Provides a detailed description of the error, primarily for debugging purposes.
    var description: String {
        // Information for debugging
        switch self {
        case .unknown:
            // Message for unknown error
            return "unknown error"
        case .badURL:
            // Message for invalid URL
            return "invalid URL"
        case .url(let error):
            // Detailed message for URL session errors
            return error?.localizedDescription ?? "url session error"
        case .parsing(let error):
            // Detailed message for parsing errors
            return "parsing error \(error?.localizedDescription ?? "")"
        case .badResponse(statusCode: let statusCode):
            // Message for bad server responses with status code
            return "bad response with status code \(statusCode)"
        }
    }
}
