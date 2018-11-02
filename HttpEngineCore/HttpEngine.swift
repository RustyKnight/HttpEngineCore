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
	func get() -> Promise<Data?>
	func get(data: Data) -> Promise<Data?>

	// MARK: put
	func put(data: Data) -> Promise<Data?>

	// MARK: post
	func post(data: Data) -> Promise<Data?>

	// MARK: delete
	func delete() -> Promise<Data?>
}
