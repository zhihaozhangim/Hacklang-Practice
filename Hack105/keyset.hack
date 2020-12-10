<<__EntryPoint>>
function main(): void {
    // A keyset is ordered, the order of a keyset is the order that the keys are inserted.
    $keyset_1 = keyset["1", "2", "3"];

    // This is how we remove an element from the keyset
    unset($keyset_1["1"]);
    \var_dump($keyset_1);
    // A keyset is also a collection of key/value pair, the difference is that the key and value are the same.
    // foreach ($keyset_1 as $key => $value) {
    //     echo $key.", ".$value.'. ';
    // }

    // $vec_1 = vec[3, 2, 1];
    // $keyset_2 = keyset($vec_1);
    // // \var_dump($keyset_2);

    // $dict_1 = dict["one" => "1", "two" => "2"];
    // $keyset_3 = keyset($dict_1);
    // \var_dump($keyset_3);
}