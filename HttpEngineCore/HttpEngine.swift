//
//  HttpEngine.swift
//  HttpEngineCore
//
//  Created by Shane Whitehead on 10/10/18.
//  Copyright © 2018 KaiZen. All rights reserved.
//

import Foundation
import PromiseKit

public typealias HttpProgressMonitor = (Double) -> Void

public protocol RequestResponse {
	var statusCode: Int { get }
	var statusDescription: String { get }
	var data: Data? { get }
	var responseHeaders: [AnyHashable: Any]? { get }
}

public protocol HttpEngine {
	
	// MARK: get
	func get() -> Promise<RequestResponse>
	func get(data: Data) -> Promise<RequestResponse>

	// MARK: put
	func put(data: Data) -> Promise<RequestResponse>
	func put() -> Promise<RequestResponse>

	// MARK: post
	func post(data: Data) -> Promise<RequestResponse>
	func post() -> Promise<RequestResponse>
	func post(formData: [MultipartFormItem]) -> Promise<RequestResponse>

	// MARK: delete
	func delete() -> Promise<RequestResponse>
	func delete(data: Data) -> Promise<RequestResponse>
}
