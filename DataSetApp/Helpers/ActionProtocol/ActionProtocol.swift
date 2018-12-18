//
//  ActionProtocol.swift
//  DataSetApp
//
//  Created by Anand, Chetan [GCB-OT NE] on 18/12/18.
//  Copyright © 2018 SPHTech. All rights reserved.
//

import Foundation
// MARK: - ActionDelegate
// First we define the ActionDelegate and its action protocol once
public protocol ActionType {}
public typealias CompletionActionHandler = (_ sender : Any?,  _ success: ActionType) -> Void


public protocol ActionDelegate: class {
    func onAction(_ sender: Any?, _ action: ActionType)
}

public protocol ActionCompleting {
    var onCompletionAction: CompletionActionHandler? {get set}
}
