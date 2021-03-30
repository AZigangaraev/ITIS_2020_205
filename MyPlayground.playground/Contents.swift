import UIKit

func print(x: Any) {
    Swift.print(x)
}

func print<T>(x: T) -> T {
    Swift.print(x)
    return x
}

func add<T: Numeric>(x: T, to y: T) -> T {
    return x + y
}

func concat<T: Collection, Z: Collection, Element>(x: T, z: Z) -> [Element] where T.Element == Element, Z.Element == Element {
    let a = Array(x)
    let b = Array(z)
    return a + b
}

// [1, 3, 2]
// .
// ...
// ..
func printDots<T: UnsignedInteger>(from array: [T]) {
    // ...
}

class Foo {
    final func bar() {
        print("Bar")
    }
}

let foo = Foo()
foo.bar()

extension Array where Element: UnsignedInteger {
    func printDots() {
        for element in self {
            for _ in 0..<UInt(element) {
                print(".", terminator: "")
            }
            print()
        }
    }
}

let array: [UInt] = [1, 2, 3, 4, 6, 9]
array.printDots()

print(x: 123)

//typealias UserId = String
//
//struct User {
//    let id: UserId
//}

protocol Wallet: AnyObject {
    associatedtype Money

    func store(value: Money)
    func getAll() -> [Money]
}

class AnyWallet<Money>: Wallet {
    typealias Money = Money

    private let _store: (Money) -> Void
    private let _getAll: () -> [Money]

    init<T: Wallet>(wallet: T) where T.Money == Money {
        _store = wallet.store
        _getAll = wallet.getAll
    }

    func store(value: Money) {
        _store(value)
    }

    func getAll() -> [Money] {
        _getAll()
    }
}

struct PaperMoney {
}

class PaperWallet: Wallet {
    typealias Money = PaperMoney

    private var storage: [Money] = []

    func store(value: Money) {
        storage.append(value)
    }

    func getAll() -> [PaperMoney] {
        defer {
            storage = []
        }
        return storage
    }
}
class ImaginedWallet: Wallet {
    typealias Money = Void

    func store(value: Money) {
    }

    func getAll() -> [Money] {
        []
    }
}

var x: [AnyHashable] = []
x.append(AnyHashable(1))
x.append(AnyHashable("123"))

enum Institute {
    case itis
    case other
}

struct Student {
    let name: Int
    let age: Int
    let birthDate: Bool
    let institute: Institute
}

let intLayout = MemoryLayout<Int>.self
print(intLayout.alignment)
print(intLayout.stride)
print(intLayout.size)


let studentLayout = MemoryLayout<Student>.self
print(studentLayout.alignment)
print(studentLayout.stride)
print(studentLayout.size)
