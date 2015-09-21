//
//  VPNProtocol.swift
//  VPNKit
//
//  Created by Lex on 9/12/15.
//  Copyright © 2015 LexTang.com. All rights reserved.
//

import Foundation
import NetworkExtension


// MARK: - Edit
public protocol VPNEditiable {
    var protocolConfiguration: NEVPNProtocol? { get }
    func load( completion: ((NSError?) -> Void)? )
    func save( completion: ((NSError?) -> Void)? )
    func remove( completion: ((NSError?) -> Void)? )
}

public extension VPNEditiable {
    func load( completion: ( (NSError?) -> Void )? ) {
        NEVPNManager.sharedManager().loadFromPreferencesWithCompletionHandler { error in
            completion?(error)
        }
    }
    
    func save( completion: ( (NSError?) -> Void )? ) {
        guard let protocolConfiguration = protocolConfiguration else {
            return
        }
        NEVPNManager.sharedManager().protocolConfiguration = protocolConfiguration
        NEVPNManager.sharedManager().saveToPreferencesWithCompletionHandler { error in
            completion?(error)
        }
    }
    
    func remove( completion: ( (NSError?) -> Void )? ) {
        guard let protocolConfiguration = protocolConfiguration else {
            return
        }
        NEVPNManager.sharedManager().protocolConfiguration = protocolConfiguration
        NEVPNManager.sharedManager().removeFromPreferencesWithCompletionHandler { error in
            completion?(error)
        }
    }
}

// MARK: - Connect
public protocol VPNConnectable : VPNEditiable {
    func connect() throws
}

public extension VPNConnectable {
    func connect() throws {
        guard let protocolConfiguration = protocolConfiguration else {
            return
        }
        let manager = NEVPNManager.sharedManager()
        manager.protocolConfiguration = protocolConfiguration
        manager.enabled = true
        try NEVPNManager.sharedManager().connection.startVPNTunnel()
    }
}

// MARK: - Disconnect
public protocol VPNDisconnectable : VPNConnectable {
    func disconnect()
}

public extension VPNDisconnectable {
    func disconnect() {
        NEVPNManager.sharedManager().connection.stopVPNTunnel()
    }
}
