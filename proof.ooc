/**
    Proof - unit testing framework for ooc

    Copyright 2010 Joshua Roesslein
    See LICENSE for more details.
*/
import proof/Reporter

testPassed: Bool = true


/**
    Add a test case to the suite.

    :param name: name of the test case
    :param test: the function that performs the actual testing
*/
test: func(name: String, test: Func) {
    Reporter current testStarted(name)
    test()
    Reporter current testCompleted(testPassed)
}

/**
    Assert the condition is true to pass. If not the test will be marked as failed.

    :param condition: the condition to verify as true
*/
assert: func(condition: Bool) {
    testPassed = condition
}
