//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
// 

import Foundation

var args = ProcessInfo.processInfo.arguments
// remove the name of the program from list of arguments
args.removeFirst()

let calculator = Calculator()
let result = calculator.calculate(args: args)
print(result)
