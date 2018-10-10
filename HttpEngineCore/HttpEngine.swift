//
//  HttpEngine.swift
//  HttpEngineCore
//
//  Created by Shane Whitehead on 10/10/18.
//  Copyright © 2018 KaiZen. All rights reserved.
//

import Foundation
import Hydra

public typealias HttpProgressMonitor = (Double) -> Void

public protocol HttpEngine {
	
	// MARK: get
	func get(from request: String) -> Promise<Data?>
	func get(from url: URL) -> Promise<Data?>

	func get(from request: String, parameters: [String: String]??) -> Promise<Data?>
	func get(from url: URL, parameters: [String: String]??) -> Promise<Data?>

	func get(from request: String, progressMonitor: HttpProgressMonitor?) -> Promise<Data?>
	func get(from url: URL, progressMonitor: HttpProgressMonitor?) -> Promise<Data?>
	
	func get(from request: String, parameters: [String: String]??, progressMonitor: HttpProgressMonitor?) -> Promise<Data?>
	func get(from url: URL, parameters: [String: String]??, progressMonitor: HttpProgressMonitor?) -> Promise<Data?>

	// MARK: put
	func put(from request: String) -> Promise<Data?>
	func put(from url: URL) -> Promise<Data?>

	func put(from request: String, parameters: [String: String]?) -> Promise<Data?>
	func put(from url: URL, parameters: [String: String]?) -> Promise<Data?>

	func put(from request: String, progressMonitor: HttpProgressMonitor?) -> Promise<Data?>
	func put(from url: URL, progressMonitor: HttpProgressMonitor?) -> Promise<Data?>
	
	func put(from request: String, parameters: [String: String]?, progressMonitor: HttpProgressMonitor?) -> Promise<Data?>
	func put(from url: URL, parameters: [String: String]?, progressMonitor: HttpProgressMonitor?) -> Promise<Data?>

	// MARK: post
	func post(data: Data, to request: String) -> Promise<Data?>
	func post(data: Data, to url: URL) -> Promise<Data?>

	func post(data: Data, to request: String, parameters: [String: String]?) -> Promise<Data?>
	func post(data: Data, to url: URL, parameters: [String: String]?) -> Promise<Data?>

	func post(data: Data, to request: String, progressMonitor: HttpProgressMonitor?) -> Promise<Data?>
	func post(data: Data, to url: URL, progressMonitor: HttpProgressMonitor?) -> Promise<Data?>
	
	func post(data: Data, to request: String, parameters: [String: String]?, progressMonitor: HttpProgressMonitor?) -> Promise<Data?>
	func post(data: Data, to url: URL, parameters: [String: String]?, progressMonitor: HttpProgressMonitor?) -> Promise<Data?>

	// MARK: delete
	func delete(from request: String) -> Promise<Data?>
	func delete(from url: URL) -> Promise<Data?>

	func delete(from request: String, parameters: [String: String]?) -> Promise<Data?>
	func delete(from url: URL, parameters: [String: String]?) -> Promise<Data?>
}
