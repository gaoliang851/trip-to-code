//
//  test.swift
//  Swift之内存管理
//
//  Created by mac on 2020/11/1.
//

import Foundation

func abc() {
    var c = Animal(fn: {
        print("1")
    })
    c.run()
}
