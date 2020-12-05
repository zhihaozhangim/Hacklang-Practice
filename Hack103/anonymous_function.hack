<<__EntryPoint>>
function main(): void {
    $f = $x ==> $x + 5000;
    $f_with_type = (int $x): int ==> $x + 6000;
    // echo $f(100);
    // echo $f_with_type(500);
    
    $f_with_block = $x ==> {
        $x += 1;
        $x += 2;
        return $x;
    };
    // echo $f_with_block(2);

    $f_with_type_and_block = (int $x): int ==> {
        $x += 100;
        $x += 200;
        return $x;
    };
    echo $f_with_type_and_block(200);
}

