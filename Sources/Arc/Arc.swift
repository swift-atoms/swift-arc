@_exported public import Magnitude
@_exported public import Angle

/// A circular boundary interval in a plane supplied by the interpreting domain.
/// Center, radius and directed angular interval constitute its parameterization.
public struct Arc<Point, Radius: Magnitude::Scalar, Angular: BinaryFloatingPoint> {
    public var center: Point
    public var radius: Magnitude<Radius>
    public var interval: Angle.Sweep<Angular>

    public init(center: Point, radius: Magnitude<Radius>, interval: Angle.Sweep<Angular>) {
        self.center = center
        self.radius = radius
        self.interval = interval
    }

    public func reversed() throws(Angle.Sweep<Angular>.Error) -> Self {
        Self(center: center, radius: radius, interval: try interval.reversed())
    }
}

extension Arc: Equatable where Point: Equatable {}
extension Arc: Hashable where Point: Hashable, Radius: Hashable, Angular: Hashable {}
extension Arc: Sendable where Point: Sendable, Radius: Sendable, Angular: Sendable {}
#if !hasFeature(Embedded)
extension Arc: Encodable where Point: Encodable, Radius: Encodable, Angular: Encodable {}
extension Arc: Decodable where Point: Decodable, Radius: Decodable, Angular: Decodable {}
#endif
