<<__EntryPoint>>
function main(): void {
    
    // The part behind ?? will be evaluated if the first part is undefined or not.
    $nully = null;
    $not_nully = "I am a string";
    $arr1 = vec[
        $nully ?? "element1",
        $not_nully ?? "element2",
    ];
    // \print_r($arr1);

    $new_shape = shape(
        "green" => 1,
        "red" => 2,
    );

    $arr2 = vec[
        $new_shape["green"] ?? "I am undefined",
        $new_shape["red"] ?? "I am undefined",
        $new_shape["blue"] ?? "I am undefined",
    ];

    // \print_r($arr2);

    $not_nully = 4;

    // The second part will be executed if and only if the first part is undefined or null.
    // echo $not_nully ?? 100 / 0;

    $dict1 = dict[
        "blue" => 10,
        "green" => 100,
        "white" => null,
    ];

    // idx(key_container, key, value_otherwise) is similar to ??
    // Difference:
    // 1. ?? will use the second part if the first part is null or undefined;
    // 2. idx() will only use the third argument is the key doesn't exist;
    $vec1 = vec[
        idx($dict1, "blue", "idx works"),
        idx($dict1, "green", "idx works"),
        idx($dict1, "white", "idx works"),
        idx($dict1, "pink", "idx works"),
    ];

    // \print_r($vec1);
    $vec2 = vec[
        "foo",
        "bar",
        "count",
        "bar",
        "foo",
    ];

    // \print_r(get_counts_by_value($vec2));

    $people = dict[
        'Arthur' => 35,
        'Ford' => 110,
        'Trillian' => 35,
        'Zaphod' => 120,
    ];

    \print_r(get_people_by_age($people));
    // \print_r(get_people_by_age($people) |> Dict\map($$, $names ==> Str\join($names, ",")));

}

function get_counts_by_value(Traversable<string> $values): dict<string, int> {
    $counts_by_value = dict[];
    foreach ($values as $value) {
        // ??=: assign the right value to the left if the left if undefined or null
        $counts_by_value[$value] ??= 0;
        ++$counts_by_value[$value];
    }
    return $counts_by_value;
}

function get_people_by_age(KeyedTraversable<string, int> $age_by_name): dict<int, vec<string>> {
    $people_by_age = dict[];
    foreach ($age_by_name as $name => $age) {
        $people_by_age[$age] ??= vec[];
        $people_by_age[$age][] = $name;
    }
    return $people_by_age;
}