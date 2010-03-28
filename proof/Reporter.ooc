import os/Terminal


Reporter: abstract class {
    current: static This = ConsoleReporter new() as This

    testStarted: abstract func(name: String)
    testCompleted: abstract func(passed: Bool) 
}

ConsoleReporter: class extends Reporter {
    testStarted: func(name: String) {
        "%s: Running..." format(name) print()
    }

    testCompleted: func(passed: Bool) {
        "\b" times(10) print()

        if(passed) {
            Terminal setFgColor(Color green)
            "[Passed]  " println()
            Terminal reset()
        }
        else {
            Terminal setFgColor(Color red)
            "[Failed]  " println()
            Terminal reset()
        }
    }
}
