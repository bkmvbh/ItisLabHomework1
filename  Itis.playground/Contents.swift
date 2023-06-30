import UIKit

protocol HomeworkService {
    // Функция деления с остатком, должна вернуть в первой части результат деления, во второй части остаток.
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int)
    
    // Функция должна вернуть числа фибоначчи.
    func fibonacci(n: Int) -> [Int]
    
    // Функция должна выполнить сортировку пузырьком.
    func sort(rawArray: [Int]) -> [Int]
    
    // Функция должна преобразовать массив строк в массив первых символов строки.
    func firstLetter(strings: [String]) -> [Character]
    
    // Функция должна отфильтровать массив по условию, которое приходит в параметре `condition`. (Нельзя юзать `filter` у `Array`)
    func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int]
}

struct MathematicalCalculations: HomeworkService {
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int) {
        return (x/y , x%y)
    }
    
    func fibonacci(n: Int) -> [Int] {
        if n <= 0 {
            return []
        } else if n == 1 {
            return [1]
        }
        var f = [1, 1]
        for i in 2..<n {
            f.append(f[i - 1] + f[i - 2])
        }
        return f
    }
    
    func sort(rawArray: [Int]) -> [Int] {
        var sortedArray = rawArray
        var count = sortedArray.count
        
        while count != 0 {
            for i in 0..<sortedArray.count - 1 {
                if sortedArray[i] > sortedArray[i+1] {
                    let a = sortedArray[i];
                    sortedArray[i] = sortedArray[i+1]
                    sortedArray[i+1] = a
                    print(sortedArray)
                }
            }
            count-=1
        }

        return sortedArray
    }
    
    func firstLetter(strings: [String]) -> [Character] {
        return strings.map({ str in str.first ?? Character("") })
    }
    
    func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int] {
        var newArr: [Int] = []
        for element in array {
            if condition(element) {
                newArr.append(element)
            }
        }
        return newArr
    }
}

let math = MathematicalCalculations()
math.sort(rawArray: [0, 12, 10, 8, 4, 5, 7, 3, 2, 1])

math.firstLetter(strings: ["asd", "qwe", "zxc", "fgh"])

print(math.filter(array: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], condition: {element in element > 5}))
