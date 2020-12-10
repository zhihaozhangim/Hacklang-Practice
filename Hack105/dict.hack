<<__EntryPoint>>
function main(): void {
    // In Hack, the dict is ordered. The order of the dict is the order that elements are inserted.
    $dict = dict[];
    $dict["one"] = "1";
    $dict["two"] = "2";
    // \var_dump($dict);

    // This is how we remove an element from a dict
    unset($dict["one"]);
    \var_dump($dict);
    
    // foreach ($dict as $key => $value) {
    //     echo $key.",".$value;
    // }

    // This is how we convert a dict into a vec. The vec function will extract all the values in the dict.
    // $vec = vec($dict);
    // \var_dump($vec);
}