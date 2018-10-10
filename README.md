# HttpEngineCore
A simple protocol designed to sit onto of Http engine implementations, so they can be more easily stubbed out

# Why?

To often recently, I've been required to design APIs which sit on top Http based implementations.  These introduce difficulties in unit testing the API (mocking/stubbing) as well as providing a easier layer as a dependency injection point

This is NOT a Http engine implementation, is intended to sit ontop of the other APIs/engines and commonalise the layer and, as a side effect, hide the underlying implementation, with the intention of providing a depedency injection enrty point for the higher level API/App, so that it can be more easily (unit) tested or stubbed
