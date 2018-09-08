import std.format;

class DiffTests
{
private:
    struct TestCase(T)
    {
        T expected;
        T actual;
    }

    static void assertEq(T)(uint line, TestCase!T testCase)
    {
        assert(testCase.expected == testCase.actual,
               format("failed at line %d: expected is %s, but actual %s",
                      line, testCase.expected, testCase.actual));
    }

public:
    static void testDiff()
    {
        TestCase!string[uint] testCases1 = [
            __LINE__: TestCase!string(
                "I'm not changed.",
                "I'm changed."
                )];

        TestCase!int[uint] testCases2 = [
            __LINE__: TestCase!int(2, 3)];

        foreach (line, testCase; testCases1)
        {
            assertEq!string(line, testCase);
        }

        foreach (line, testCase; testCases2)
        {
            assertEq!int(line, testCase);
        }
    }
}

unittest
{
    DiffTests.testDiff();
}

void main(){}
