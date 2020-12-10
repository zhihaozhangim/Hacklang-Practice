function apply_function(
    (function(int): bool) $f,
    int $value,
): bool {
    return $f($value);
}

// Variadic functions and generic types are also supported.
function takes_various_functions<T>(
  (function(): void) $no_params_no_return,
  (function(int, string): bool) $has_params,
  (function(float, int...): string) $has_varargs,
  (function(string, T): vec<T>) $has_generics,
): void {}

<<__EntryPoint>>
function main(): void {
    $f1 = (int $x): bool ==> $x < 100;
    echo apply_function($f1, 99);
}