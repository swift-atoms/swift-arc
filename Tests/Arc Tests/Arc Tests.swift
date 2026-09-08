import Arc
import Testing
import Foundation

@Suite struct `Circular arc constituents` {
    @Test func `Reversal retains center radius and signed interval`() throws {
        let interval = try Angle.Sweep<Double>(start: Radian(_unchecked: 1), amount: Radian(_unchecked: -2))
        let arc = Arc(center: "origin", radius: try Magnitude(validating: 3), interval: interval)
        let reversed = try arc.reversed()
        #expect(reversed.center == arc.center)
        #expect(reversed.radius == arc.radius)
        #expect(reversed.interval.amount.underlying == 2)
        #expect(try reversed.reversed() == arc)
    }
    @Test func `Zero radius and complete turns remain valid parameters`() throws {
        let interval = try Angle.Sweep<Double>(start: .zero, amount: .pi.two)
        let arc = Arc(center: 0, radius: Magnitude<Int>.zero, interval: interval)
        #expect(arc.interval.amount.underlying == 2 * Double.pi)
        #expect(Set([arc, arc]).count == 1)
    }
    @Test func `Coding validates radius and angular interval`() throws {
        let arc = Arc(center: 1, radius: try Magnitude(validating: 2),
                      interval: try Angle.Sweep<Double>(start: .zero, amount: .pi.half))
        #expect(try JSONDecoder().decode(Arc<Int, Int, Double>.self, from: JSONEncoder().encode(arc)) == arc)
        #expect(throws: DecodingError.self) {
            try JSONDecoder().decode(Arc<Int, Int, Double>.self,
                from: Data(#"{"center":1,"radius":-1,"interval":{"start":0,"amount":1}}"#.utf8))
        }
    }
}
