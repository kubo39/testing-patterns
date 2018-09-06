import std.typecons;

// depended components.
class Y {}
class X {}

// dependent component.
class Z
{
    alias Dependency = Tuple!(X, Y);
    Dependency dependency;

    this(Dependency dependency)
    {
        this.dependency = dependency;
    }

    void doSomething()
    {
        // So something with X and Y.
    }

}

// All dependency should injected when
// the dependent component is constructing.
void main()
{
    auto z = new Z(tuple(new X(), new Y()));
    z.doSomething();
}
