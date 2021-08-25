//
//  HttpRequestBuilder.swift
//  HttpEngineCore
//
//  Created by Shane Whitehead on 11/10/18.
//  Copyright © 2018 KaiZen. All rights reserved.
//

import Foundation
import PromiseKit

public typealias ProgressMonitor = (Double) -> Void

// Oppurtunity for dependency injection
public protocol HttpRequestBuilderFactory {
	func request(to: URL) -> HttpRequestBuilder
}

public protocol Credentials {
	var userName: String { get }
	var password: String { get }
}

/*
Credtinals are a pain.  Different systems need them injected into the solution at
different times in different ways.  Rather then trying to spend to much time
trying to solve "all" of them, the API provides a optional solution to
supply some basic credential information which the implementation
can choose how to apply them.

Further, implementations are also free to expand the concept for their own particular
needs
*/

public protocol HttpRequestBuilder {
	// Forced requirement
	var url: URL { get }
	
//	func with(parameters: [String: String]) -> Self
	func with(headers: [String: String]) -> Self
	func with(credentials: Credentials) -> Self
	func with(progressMonitor: @escaping ProgressMonitor) -> Self
	func with(timeout: TimeInterval) -> Self
	
  func with(queryNamed name: String, value: String) -> Self
  func with(queryItem: URLQueryItem) -> Self
  
	func build() throws -> HttpEngine
}

open class BaseHttpRequestBuilder: HttpRequestBuilder {
  
  public let url: URL
  public private(set) var headers: [String: String]?
  public private(set) var credentials: Credentials?
  public private(set) var progressMonitor: ProgressMonitor?
  public private(set) var timeout: TimeInterval?
  
  public private(set) var queryItems: [URLQueryItem] = []
  
  public init(to: URL) {
    self.url = to
  }
  
  @discardableResult
  public func with(queryNamed name: String, value: String) -> Self {
    return with(queryItem: URLQueryItem(name: name,
                                        value: value.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)))
  }
  
  @discardableResult
  public func with(queryItem: URLQueryItem) -> Self {
    queryItems.append(queryItem)
    return self
  }

  @discardableResult
  public func with(headers: [String : String]) -> Self {
    self.headers = headers
    return self
  }
  
  @discardableResult
  public func with(credentials: Credentials) -> Self {
    self.credentials = credentials
    return self
  }
  
  @discardableResult
  public func with(progressMonitor: @escaping ProgressMonitor) -> Self {
    self.progressMonitor = progressMonitor
    return self
  }
  
  @discardableResult
  public func with(timeout: TimeInterval) -> Self {
    self.timeout = timeout
    return self
  }
  
  open func build() throws -> HttpEngine {
    fatalError("Not yet implemented")
  }

}
