<<__EntryPoint>>
function main(): void {
    // 1 + 1 + 100 - 2
    echo (1 + 1 |> $$ + 100 |> $$ - 2);
}