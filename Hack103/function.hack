function test_function(int $x, int $y): int {
    return $x + $y;
}

function test_function_with_optional_arguments(int $x, int $y = 100): int {
    return $x + $y;
}

// Optional arguments must come after the required ones. The following one is invalid.
function test_function_with_optional_arguments_invalid(int $x = 100, int $y): int {
    echo $x + $y;
}

// Variadic Functions
function sum_int(int $base, int ...$vals): int {
    $result = $base;
    foreach ($vals as $val) {
        $result += $val;
    }
    return $result;
}

// Take a function as an argument
function apply_function(int $value, (function(int): int) $f): int {
    return $f($value);
}


<<__EntryPoint>>
function main(): void {
    // echo test_function_with_optional_arguments(100);
    // echo test_function_with_optional_arguments(100, 5);
    // echo test_function_with_optional_arguments_invalid(200);
    
    // echo sum_int(100, 200, 300, 400);
    // vec can also be spread as the argument of variadic functions
    // $args = vec[200, 300, 400];
    // echo sum_int(100, ...$args);
    echo apply_function(100, $x ==> $x + 100);
}