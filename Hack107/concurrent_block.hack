// Each of the statements in a concurrent block should be thought of as running concurrently. 
// This means there shouldn't be any dependencies between the statements in a concurrent block.

async function getInt(): Awaitable<int> {
    return 2;
}

async function getFloat(): Awaitable<float> {
    return 1.2;
}

<<__EntryPoint>>
async function main(): Awaitable<void> {
    // The order whether getInt() or getFloat() gets executed first is not guaranteed.
    // However, we don't rely on the order. So, it's ok.
    concurrent {
        $val1 = await getInt();
        $val2 = await getFloat();
    }
    $ret = $val1 + $val2;
    \var_dump($ret);
}