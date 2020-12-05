<<__EntryPoint>>
function main(): void {
    $test_vec = vec["red", "blue", "green"];
    // foreach ($test_vec as $element) {
    //     echo $element.'\n';
    // }

    $test_vec2 = vec["white", "purple", "pink"];
    // foreach ($test_vec2 as $key => $value) {
    //     echo $key.", ".$value."\n";
    // }

    $test_vec3 = vec["good", "great", "awesome", "splendid"];
    // foreach ($test_vec3 as $key => $_) {
    //     echo $key.", ";
    // }

    $test_dict = dict[
        "good" => "morning",
        "great" => "night",
    ];

    // foreach ($test_dict as $key => $value) {
    //     echo $key.", ".$value."! ";
    // }

    $test_vec_tuple = vec[
        tuple("foo", "bar"),
        tuple("bar", "foo"),
    ];

    // foreach ($test_vec_tuple as list($element1, $element2)) {
    //     echo $element1.", ".$element2.". ";
    // }

    $test_dict_tuple = dict[
        "keyOne" => tuple("foo", "bar"),
        "keyTwo" => tuple("bar", "foo"),
    ];

    foreach ($test_dict_tuple as $key => list($element1, $element2)) {
        echo $key.", ".$element1.", ".$element2.". ";
    }

}