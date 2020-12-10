type Point = (int, int);

function makePoint(int $x, int $y): Point {
    return tuple($x, $y);
}

function getDistance(Point $point): int {
    return $point[1] - $point[0];
}

<<__EntryPoint>>
function main(): void {
    $p = makePoint(1, 2);
    \var_dump($p);
    $distance = getDistance($p);
    \var_dump($distance);
}