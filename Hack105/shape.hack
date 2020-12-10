// This kind of shape is called close shape, the field must be exactly as it is
type TShape = shape(
    'id' => int,
    'user_name' => string,
);

// Open shape, optional fields can be access using Shapes:idx
type OpenShape = shape(
    'create_time' => string,
    ...
);

// Shape with optional field, but it is hard to reason about. Better to use open shape or shape will null value
type OptionalFieldShape = shape(
    'id' => string,
    ?'create_time' => string,
);

type TTuple = (int, string);

<<__EntryPoint>>
function main(): void {
    $s = shape(
        'name' => 'Zhihao',
        'age' => 18,
    );

    // The field name must be string literal
    // \var_dump($s['name']);

    // The tutorial previously said we cannot access a field using a variable like this
    // Actually, we can do it now. But maybe there will be some type error if we activate type checker.
    $field = 'name';
    // \var_dump($s[$field]);

    // Shapes are copy-on-write
    $shape_1 = shape(
        'height' => 8848,
    );
    $shape_2 = $shape_1;
    $shape_1['height'] = 8849;
    
    // \var_dump($shape_1);
    // \var_dump($shape_2);  // The height in $shape_2 is still 8848

    // Shape can be created incrementally
    // $test_shape = shape();
    // \var_dump($test_shape);
    // $test_shape['weather'] = 'sunny';
    // \var_dump($test_shape);

    // $shape_3 = makeUser(123321, 'test_user');
    // \var_dump($shape_3);
    // $test_tuple = extractInformation($shape_3);
    // \var_dump($test_tuple);

    $test_open_shape = shape(
        'create_time' => '20201210',
        'id' => '12345678',
    );

    // handleOpenShape($test_open_shape);

    $test_optional_shape = shape(
        'id' => '12345',
    );
    // handleOptionalFieldShape($test_optional_shape);

    \var_dump(convertShapeToDArray($test_open_shape));
}

function makeUser(int $id, string $user_name): TShape {
    return shape(
        'id' => $id,
        'user_name' => $user_name,
    );
}

function extractInformation(TShape $shape): TTuple {
    return tuple($shape['id'], $shape['user_name']);
}

function handleOpenShape(OpenShape $open_shape): void {
    $create_time = $open_shape['create_time'];
    \var_dump($create_time);

    $id = $open_shape['id'];
    \var_dump($id);
    
    // Return null if the field doesn't exist
    $user_name = Shapes::idx($open_shape, 'user_name');
    \var_dump($user_name);

    // Return the default value if the field doesn't exist
    $country = Shapes::idx($open_shape, 'country', 'United States');
    \var_dump($country);
}

function handleOptionalFieldShape(OptionalFieldShape $shape): void {
    $id = $shape['id'];
    \var_dump($id);
    $create_time = Shapes::idx($shape, 'create_time', '0');
    \var_dump($create_time);
}

// Convert a shape to an darray
function convertShapeToDArray(OpenShape $shape): darray<arraykey, mixed> {
    return Shapes::toArray($shape);
}