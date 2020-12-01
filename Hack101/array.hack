<<__EntryPoint>>
function main(): void {
    $arr1 = vec["green", "yellow"];
    $arr1[] = "red";
    echo $arr1[0].$arr1[1].$arr1[2];
    $dict = dict[];
    $dict[0] = "pink";
    $dict[1] = "white";
    echo $dict[0].$dict[1];
    $arr2 = array();
    $arr2[] = 1;
    echo $arr2[0];
    $arr3 = ["seattle", "slu", "WA"];
    echo $arr3[0].$arr3[1].$arr3[2];
}