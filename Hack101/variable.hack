/**
 * A local variable can be assigned to as a parameter in the parameter list of a function definition or inside any compound statement. 
 * It has function scope.
 */

function do_it(bool $p1): void {
    $count = 10;
    if ($p1) {
        // Even if message is declared inside of a if block, it has function scope
        $message = "Good to go";
    }
    echo $message;
}

<<__EntryPoint>>
function main(): void {
    do_it(true);
}