fun extractFromTypedTuple(params: [int]) {
    var [payload: int] = params;
    return payload + 10;
}

@method_id(101)
fun test101(x: int) {
    var params = [x];
    return extractFromTypedTuple(params);
}

fun autoInferIntNull(x: int) {
    if (x > 10) { return null; }
    return x;
}

fun typesAsIdentifiers(builder: builder) {
    var int = 1;
    var cell = builder.endCell();
    var slice = cell.beginParse();
    {
        var cell: cell = cell;
        var tuple: tuple = createEmptyTuple();
        var bool: bool = tuple.tupleAt<int>(0) > 0;
    }
    return int;
}

fun main(value: int) {
    var (x: int, y) = (autoInferIntNull(value), autoInferIntNull(value * 2));
    if (x == null && y == null) { return null; }
    return x == null || y == null ? -1 : x + y;
}

/**
@testcase | 0   | 3      | 9
@testcase | 0   | 6      | -1
@testcase | 0   | 11     | (null)
@testcase | 101 | 78     | 88
*/
