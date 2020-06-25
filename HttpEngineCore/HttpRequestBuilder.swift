//
//  HttpRequestBuilder.swift
//  HttpEngineCore
//
//  Created by Shane Whitehead on 11/10/18.
//  Copyright © 2018 KaiZen. All rights reserved.
//

import Foundation
import Hydra

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
	
	func with(parameters: [String: String]) -> Self
	func with(headers: [String: String]) -> Self
	func with(credentials: Credentials) -> Self
	func with(progressMonitor: @escaping ProgressMonitor) -> Self
	func with(timeout: TimeInterval) -> Self
	
	func build() throws -> HttpEngine
}

open class BaseHttpRequestBuilder: HttpRequestBuilder {
	
	public let url: URL
	public var parameters: [String: String]?
	public var headers: [String: String]?
	public var credentials: Credentials?
	public var progressMonitor: ProgressMonitor?
	public var timeout: TimeInterval?
	
	public init(to: URL) {
		self.url = to
	}
	
	public func with(parameters: [String : String]) -> Self {
		self.parameters = parameters
		return self
	}
	
	public func with(headers: [String : String]) -> Self {
		self.headers = headers
		return self
	}
	
	public func with(credentials: Credentials) -> Self {
		self.credentials = credentials
		return self
	}
	
	public func with(progressMonitor: @escaping ProgressMonitor) -> Self {
		self.progressMonitor = progressMonitor
		return self
	}
	
	public func with(timeout: TimeInterval) -> Self {
		self.timeout = timeout
		return self
	}
	
	open func build() throws -> HttpEngine {
		fatalError("Not yet implemented")
	}
	
	
}
