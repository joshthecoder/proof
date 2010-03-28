import os/Terminal


Reporter: abstract class {
    current: static This = ConsoleReporter new() as This

    testStarted: abstract func(name: String)
    testCompleted: abstract func(passed: Bool)

    suiteFinished: abstract func 
}

// Register an at exit callback to invoke the Reporter suiteFinished()
atexit: extern func(...) -> Int
atexit(func { Reporter current suiteFinished() })

ConsoleReporter: class extends Reporter {
    passes, failures: Int

    init: func {
        passes = 0; failures = 0
    }

    testStarted: func(name: String) {
        "%s: Running..." format(name) print()
    }

    testCompleted: func(passed: Bool) {
        "\b" times(10) print()

        if(passed) {
            passes += 1

            Terminal setFgColor(Color green)
            "[Passed]  " println()
            Terminal reset()
        }
        else {
            failures += 1

            Terminal setFgColor(Color red)
            "[Failed]  " println()
            Terminal reset()
        }
    }

    suiteFinished: func {
        "\n%d " format(passes) print()
        Terminal setFgColor(Color green)
        "passes " print()
        Terminal reset()
        "%d " format(failures) print()
        Terminal setFgColor(Color red)
        "failures" println()
        Terminal reset()
    }
}
