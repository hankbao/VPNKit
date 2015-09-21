//
//  VPNServerInfoProtocol.swift
//  VPNKit
//
//  Created by Lex on 9/12/15.
//  Copyright © 2015 LexTang.com. All rights reserved.
//

import Foundation


public protocol VPNServerInfoProtocol : NilLiteralConvertible /*, RawRepresentable */ {
    
    var name: String { get set }
    var server: String { get set }
    var username: String? { get set }
    var group: String? { get set }
    var alwaysOn: Bool { get set }
    var passwordRef: NSData? { get set }
    var secretRef: NSData? { get set }
    var mobileConfigRepresentation: String { get }
    
}

public extension VPNServerInfoProtocol {
    
    var mobileConfigRepresentation: String {
        // TODO: Return .mobileconfig file content.
        return ""
    }
}