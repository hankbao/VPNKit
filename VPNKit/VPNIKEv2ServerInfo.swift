//
//  VPNIKEv2ServerInfo.swift
//  VPNKit
//
//  Created by Lex on 9/21/15.
//  Copyright © 2015 LexTang.com. All rights reserved.
//

import Foundation
import NetworkExtension


public struct VPNIKEv2ServerInfo : VPNServerInfoProtocol, VPNConnectable, VPNDisconnectable, VPNEditiable {
    
    public var name: String
    public var server: String
    public var username: String?
    public var group: String?
    public var alwaysOn: Bool
    public var passwordRef: NSData?
    public var secretRef: NSData?
    
    public var protocolConfiguration: NEVPNProtocol? {
        let config = NEVPNProtocolIKEv2()
        config.serverAddress = self.server
        config.username = self.username
        config.passwordReference = self.passwordRef
        config.sharedSecretReference = self.secretRef
        return config
    }
    
    public init(nilLiteral: ()) {
        name = ""
        server = ""
        username = nil
        group = nil
        alwaysOn = true
        passwordRef = nil
        secretRef = nil
    }
    
}