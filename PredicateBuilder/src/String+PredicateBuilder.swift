//
//  String+PredicateBuilder.swift
//  PredicateBuilder
//
//  Created by Muronaka Hiroaki on 2017/06/11.
//  Copyright © 2017年 Muronaka Hiroaki. All rights reserved.
//

import Foundation

extension String {
    
    public var pred:PredicateBuilder {
        return PredicateBuilder(src: self)
    }
    
}
