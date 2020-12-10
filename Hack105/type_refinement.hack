function f1(?int $input = null): ?int {
    return $input is nonnull ? $input + 1 : null;
}

<<__EntryPoint>>
function main(): void {
    echo f1(100);
    echo f1();
}