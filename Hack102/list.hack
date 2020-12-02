<<__EntryPoint>>
function main(): void {
    $new_tuple = tuple("one", "two", "three");
    list($one, $two, $three) = $new_tuple;
    // echo($one." ".$two." ".$three."\n");

    $another_tuple = tuple("string", 1, true);
    list($str, $count, $state) = $another_tuple;
    consume_string($str);
    consume_number($count);
    consumer_bool($state);
    // echo("Everything is correct!");

    $third_tuple = tuple(1, 2, "pick this one", 34, "and this one");
    list($_, $_, $str1, $_, $str2) = $third_tuple;
    // echo($str1.' '.$str2);

    $forth_tuple = tuple(1, 2, tuple("target1", "target2"));
    list($_, $_, list($var1, $var2)) = $forth_tuple;
    // echo($var1." ".$var2);

    $tuple_vec = vec[
        tuple('name1_1', 'name1_2', 'name1_3'),
        tuple('name2_1', 'name2_2', 'name2_3'),
        tuple('name3_1', 'name3_2', 'name3_3'),
    ];

    foreach ($tuple_vec as list($name1, $name2, $name3)) {
        echo $name1.' '.$name2.' '.$name3;
    }
}

function consume_string(string $str): void {}
function consume_number(num $count): void {}
function consumer_bool(bool $state): void {}