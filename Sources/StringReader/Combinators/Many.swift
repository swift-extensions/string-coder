import Foundation

public extension StringReader {
    var many: StringReader<[Element]> {
        StringReader<[Element]> { input in
            var items: [Element] = []
            var input1 = input
            while case let .success((output, input2)) = self.decode(input1) {
                input1 = input2
                items.append(output)
            }
            return .success((items, input1))
        }
    }
}
