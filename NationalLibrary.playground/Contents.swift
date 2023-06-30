import UIKit

// Протокол для книг, которые можно выдавать читателям
protocol Loanable {
    var isAvailable: Bool { get }
    func loan()
    func returnBook()
}

// Enum с типами литературы
enum LiteratureType {
    case book
    case magazine
}

// Структура для представления автора литературного произведения
struct Author {
    let firstName: String
    let lastName: String
}

// Базовый класс для литературных произведений
class Literature {
    let title: String
    let author: Author
    let type: LiteratureType
    
    init(title: String, author: Author, type: LiteratureType) {
        self.title = title
        self.author = author
        self.type = type
    }
    
    func displayInfo() {
        print("Title: \(title)")
        print("Author: \(author.firstName) \(author.lastName)")
        print("Type: \(type)")
    }
}

// Класс для книг
class Book: Literature, Loanable {
    private var isLoanable: Bool = true
    
    var isAvailable: Bool {
        return isLoanable
    }
    
    func loan() {
        if isLoanable {
            isLoanable = false
            print("Book \"\(title)\" has been loaned.")
        } else {
            print("Book \"\(title)\" is not available for loan.")
        }
    }
    
    func returnBook() {
        if !isLoanable {
            isLoanable = true
            print("Book \"\(title)\" has been returned.")
        } else {
            print("Book \"\(title)\" was not loaned.")
        }
    }
}

// Класс для журналов
class Magazine: Literature, Loanable {
    private var isLoanable: Bool = true
    
    var isAvailable: Bool {
        return isLoanable
    }
    
    func loan() {
        if isLoanable {
            isLoanable = false
            print("Magazine \"\(title)\" has been loaned.")
        } else {
            print("Magazine \"\(title)\" is not available for loan.")
        }
    }
    
    func returnBook() {
        if !isLoanable {
            isLoanable = true
            print("Magazine \"\(title)\" has been returned.")
        } else {
            print("Magazine \"\(title)\" was not loaned.")
        }
    }
}

// Enum с типами читателей
enum ReaderType {
    case student
    case teacher
    case researcher
}

// Структура для представления читателя
struct Reader {
    let name: String
    let type: ReaderType
}

// Класс для библиотеки
class NationalLibrary {
    private var libraryName: String
    private var books: [Book]
    private var magazines: [Magazine]
    
    init(name: String) {
        self.libraryName = name
        self.books = []
        self.magazines = []
    }
    
    func addBook(_ book: Book) {
        books.append(book)
    }
    
    func addMagazine(_ magazine: Magazine) {
        magazines.append(magazine)
    }
    
    func displayCatalog() {
        print("Library Name: \(libraryName)")
        
        if !books.isEmpty {
            print("\nBooks:")
            for book in books {
                book.displayInfo()
                print("---")
            }
        }
        
        if !magazines.isEmpty {
            print("\nMagazines:")
            for magazine in magazines {
                magazine.displayInfo()
                print("---")
            }
        }
    }
}

// Пример использования модели
let author1 = Author(firstName: "Александр", lastName: "Пушкин")
let book1 = Book(title: "Book 1", author: author1, type: .book)
let book2 = Book(title: "Book 2", author: author1, type: .book)

let author2 = Author(firstName: "Джон", lastName: "Smith")
let magazine1 = Magazine(title: "Magazine 1", author: author2, type: .magazine)

let library = NationalLibrary(name: "National Library of Tatarstan")
library.addBook(book1)
library.addBook(book2)
library.addMagazine(magazine1)

library.displayCatalog()
