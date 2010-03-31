use proof
import proof

test("1 + 4 = 5", func {
    sum := 1 + 4
    assert(sum == 5)
})

test("2 * 3 = 7", func {
    product := 2 * 3
    assert(product == 7, "2 * 3 is not 7 dummy!")
})

test("length of 'hello' is 5", func {
    length := "hello" length()
    assert(length == 5, "length was not 5")
})
