// Tipos de Objetos de Testes


// MARK: - Common
protocol Network {
    func fetchData(for id: Int, completion: @escaping ((Result<String, Error>) -> Void))
}



// MARK: - Dummy
// Criados apenas para satisfazer os parâmetros de um determinado método.
// Nesses tipos de objetos não são feitos declarações
final class MyClass {
    init(network: Network) { }
}

final class NetworkDummy: Network {
    func fetchData(for id: Int, completion: @escaping ((Result<String, Error>) -> Void)) { }
}

let myClass = MyClass(network: NetworkDummy())




// MARK: - Stub
// Usado para controlar o resultado de alguns métodos de dependência.
final class NetworkSpy: Network {
    private(set) var fetchedCalled: Bool = false
    private(set) var idPassed: Int?
    var fetchDataToBeReturned: Result<String, Error> = .success("")
    
    func fetchData(for id: Int, completion: @escaping ((Result<String, Error>) -> Void)) {
        fetchedCalled = true
        idPassed = id
        completion(fetchDataToBeReturned)
    }
}
