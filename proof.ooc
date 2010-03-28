/**
    Proof - unit testing framework for ooc

    Copyright 2010 Joshua Roesslein
    See LICENSE for more details.
*/
import proof/Reporter


/**
    Add a test case to the suite.

    :param name: name of the test case
    :param test: the function that performs the actual testing
*/
test: func(name: String, test: Func) {
    Reporter instance testStarted(name)
    test()
    Reporter instance testCompleted()
}

/**
    Assert the condition is true to pass. If not the test will be marked as failed.

    :param condition: the condition to verify as true
*/
assert: func ~withMessage(condition: Bool, errorMsg: String) {
    if(condition == false) Reporter instance assertFailed(errorMsg)
}
assert: func(condition: Bool) {
    assert(condition, "")
}
