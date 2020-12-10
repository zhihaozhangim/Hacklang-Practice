function take_nullable_string(?string $input): string {
    return $input is null ? "Discard" : $input;

    // The following statement will return $input if it is not null or undefined; Otherwise, You are Null will be returned
    // return $input ?? "You are Null";
}

function take_nullable_string2(?string $input): string {
    return $input is nonnull ? $input : "Discard";
}

<<__EntryPoint>>
function main(): void {
    echo take_nullable_string(null);
    echo ", ";
    echo take_nullable_string("I am not null");
    echo ", ";
    echo take_nullable_string2(null);
    echo ", ";
    echo take_nullable_string2("I am not null");
}