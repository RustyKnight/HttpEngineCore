//
//  MultipartFormItem.swift
//  iOS
//
//  Created by Shane Whitehead on 1/12/19.
//  Copyright © 2019 Shane Whitehead. All rights reserved.
//

import Foundation

public enum MultipartFormItem {
	case data(_ value: Data, name: String, mimeType: String? = nil, fileName: String? = nil)
	case file(_ url: URL, name: String, mimeType: String? = nil, fileName: String? = nil)
}
