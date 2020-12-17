async function getInt(): Awaitable<int> {
    return 2;
}

async function getFloat(): Awaitable<float> {
    return 1.2;
}

async function getString(): Awaitable<string> {
    return "a dummy string";
}

// async block is a syntax sugar, and can be thought of as an ad-hoc async function
// with no params. The return type is Awaitable.
async function useAsyncBlock(): Awaitable<float> {
    $x = async {
        $int_value = await getInt();
        $float_value = await getFloat();
        return $int_value + $float_value;
    };
    $x_awaited = await $x;
    return $x_awaited;
}

async function useAsyncBlock2(): Awaitable<string> {
    $awaited_string = async {
        return "awaitable string to return";
    };

    $string_to_return = await $awaited_string;
    return $string_to_return;
}

<<__EntryPoint>>
async function main(): Awaitable<void> {
    $ret = await useAsyncBlock();
    // \var_dump($ret);
    $ret2 = await useAsyncBlock2();
    \var_dump($ret2);
}