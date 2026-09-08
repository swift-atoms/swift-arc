# Arc

A validated boundary parameterization. Constituent values carry their own validity;
center/coordinate frame, plane interpretation and compatible length units are the
calling domain's responsibility. No Vector evaluation, Matrix conversion, metric,
rendering or filled-region containment is installed.

Arc contains a generic center, Magnitude radius and Angle.Sweep interval. Signed
sweeps and full turns are preserved. Zero radius is accepted as a degenerate
parameterization. Equality compares parameters, not geometric loci. Production
URL dependencies are Magnitude and Angle.

Registered in atoms.xcworkspace. GUI-backed native umbrella build-for-testing
and all eight combined Arc/Ellipse tests passed on My Mac, 2026-09-08 21:33.
Final type-boundary and broader affected-owner audit remains open.
