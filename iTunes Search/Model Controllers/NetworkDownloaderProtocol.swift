//
//  NetworkDownloaderProtocol.swift
//  iTunes Search
//
//  Created by John Kouris on 12/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol NetworkDownloaderProtocol {
    func executeRequestAsynchronously(request: URLRequest, completion: (Data?, Error?) -> Void)
}
