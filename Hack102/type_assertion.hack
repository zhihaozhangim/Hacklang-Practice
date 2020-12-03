<<__EntryPoint>>
function main(): void {
    // echo (1 is num);
    // echo (1 is bool ? "true" : "false");
    // echo compute(100);
    // echo 1 is MyEnum;

    // Since is provides a runtime check, it cannot be used with erased generics. For generic types, you must use _ placeholders for type parameters.
    // $v1 = vec[1, 2, 3];
    // echo $v1 is vec<_>;
    // echo $v1 is vec<int>; // we can do it now actually

    $shape1 = shape(
        'foo' => 1,
        'bar' => 'good morning',
    );
    // echo $shape1 is TShape;

    $tuple1 = tuple(1, 2, 3, true, null);
    // echo $tuple1 is (int, int, int, bool, null);

    // as performs the same checks as is, it throws TypeAssertionException if the value has a different type.
    1 as int;
    // 1 as string;

    // echo compute_number(1.4);
    
    // ?as return null is type is not correct
    // echo (true ?as num);
    // echo (2 ?as num);

}

function compute(?int $number_a): ?int {
    return $number_a is nonnull ? $number_a + 100 : null;
}

// For enums, is also checks that the value is valid.
enum MyEnum: int {
    TYPE1 = 1;
    TYPE2 = 2;
}

type TShape = shape(
    'foo' => int,
    'bar' => string,
);

function compute_number(mixed $input_number): ?num {
    $input_number as num;
    if ($input_number is int) {
        return $input_number + 1;
    } else if ($input_number is float) {
        return $input_number + 1.5;
    } else {
        return null;
    }
}