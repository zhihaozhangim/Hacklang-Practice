// Single line comment
# Also single line comment
/**
 * Multi-line comment used for documentation
 */
 <<__EntryPoint>>
function main(): void {
    echo compute(5);
}

function compute(int $value): int {
    $count = $value + 1;
    return $count;
}