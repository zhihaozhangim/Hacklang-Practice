<<__EntryPoint>>
function main(): void {
    $text = "hello";
    // echo $text[0];
    $text[0] = "y";
    // echo $text;

    $arr1 = vec['element1', 'element2'];
    // echo $arr1[0];
    $arr1[0] = 'newOne';
    $arr1[] = 'element3';
    foreach ($arr1 as $ele) {
        echo $ele;
    }

    $dict1 = dict["1" => "one", "2" => "two", 3 => "three"];
    // echo($dict1["1"]).' ';
    // echo($dict1[3]).' ';
    $dict1[3] = "five";
    // echo($dict1[3]);
}