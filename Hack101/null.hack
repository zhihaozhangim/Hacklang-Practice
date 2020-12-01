type IdSet = shape(
    'id' => ?string,
    'url' => ?string,
    'count' => int,
);

<<__EntryPoint>>
function main(): void {
    $returnedShape = getShape();
    echo $returnedShape['id'].'\n'.$returnedShape['url'].'\n'.$returnedShape['count'].'\n';
}

function getShape(): IdSet {
    return shape(
        'id' => 1000,
        'url' => 10000,
        'count' => 100,
    );
}