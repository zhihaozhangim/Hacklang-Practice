function swap<T>(vec<T> $vec, int $i, int $j): vec<T> {
    $temp = $vec[$i];
    $vec[$i] = $vec[$j];
    $vec[$j] = $temp;
    return $vec;
}

<<__EntryPoint>>
function main(): void {
    $test_vec = vec[1, 2];
    \var_dump($test_vec);
    $test_vec = swap($test_vec, 0, 1);
    \var_dump($test_vec);
}