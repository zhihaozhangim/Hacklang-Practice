class ConstBox {
    // const int A_CONST = 100;
    // For const, type can be omitted;
    const A_CONST = 100;
}

<<__EntryPoint>>
function main(): void {
    echo ConstBox::A_CONST;
}