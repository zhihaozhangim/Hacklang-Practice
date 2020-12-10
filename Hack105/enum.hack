enum Position: int {
    TOP = 1;
    BOTTOM = 2;
    LEFT = 3;
    RIGHT = 4;
    CENTER = 5;
}

<<__EntryPoint>>
function main(): void {
    // Every enum type have a set of static methods, like getNames() and getValues().
    $names = Position::getNames();
    \var_dump($names);

    $values = Position::getValues();
    \var_dump($values);
}