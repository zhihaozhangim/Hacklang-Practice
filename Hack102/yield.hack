function serials(int $start, int $end, int $inc): \Generator {
    for ($i = $start; $i <= $end; $i += $inc) {
        yield $i;
    }
}

function square(int $start, int $end, string $key_prefix): \Generator<string, int, void> {
    for ($i = $start; $i <= $end; ++$i) {
        yield $key_prefix.$i => $i * $i;
    }
}

<<__EntryPoint>>
function main(): void {
    // foreach (serials(0, 16, 2) as $key => $value) {
    //     echo "key = $key, value = $value, ";
    // }
    foreach (square(1, 10, "prefix") as $key => $value) {
        echo "key = $key, value = $value, ";
    }
}