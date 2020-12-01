<<__EntryPoint>>
function main() {
    $count = 1;
    echo ">\$count.$count"."<\n";
    $simpleClass = new SimpleClass();
    echo "\$simpleClass->pointer = $simpleClass->pointer\n";
}

class SimpleClass {
    public int $pointer = 1;
}