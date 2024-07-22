//
//  3.Set.swift
//  WBChat
//
//  Created by Vladimir on 22.07.2024.
//

import Foundation

private struct PersonalSet {
    var setBool = true
    var setA: Set<Int> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    var setB: Set<Int> = [11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    //создал set из целых чисел
}

extension PersonalSet {
    mutating func setInsert(_ int: Int) {
        setA.insert(int)
    } //добавил новый элемент во множетво
}

extension PersonalSet {
    mutating func setRemove() {
        setA.remove(5)
    }//убрал элемент массива
}

extension PersonalSet {
    mutating func containsSet() {
        setBool = setA.contains(5)
    } //проверяю наличие элемента в массиве
}

extension PersonalSet {
    mutating func intersection() -> Set<Int>{
        setA.intersection(setB)
    } //применяю пересечение
}

extension PersonalSet {
    mutating func union() -> Set<Int> {
        setA.union(setB)
    } //преминяю объединение
}

extension PersonalSet {
    mutating func subtract() {
        setA.subtract(setB)
    } //преминяю разность
}
