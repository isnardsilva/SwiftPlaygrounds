import Foundation


// MARK: - Criando um Timer de REPETIÇÃO
class RepeatingTimer {
    func start() {
        let _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
    @objc
    private func fireTimer() {
        print("RepeatingTimer - Timer fired!")
    }
}

// Run
let repeatingTimer = RepeatingTimer()
repeatingTimer.start()



// MARK: - Criando um Timer de REPETIÇÃO (Com Closure)
Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
    print("Timer com Clusure - Timer fired")
}



// MARK: - Criando um Timer sem repetição
Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
    print("Timer sem repetição")
}

DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
    print("Timer sem repetição")
}
