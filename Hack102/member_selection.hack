class IntBox {
    private int $x;

    public function __construct(int $x) {
        $this->x = $x;
    }

    public function getX(): int {
        return $this->x;
    }

    public static function extractX(?IntBox $box): ?int {
        return $box?->getX();
    }
}

<<__EntryPoint>>
function main(): void {
    $box = new IntBox(43);
    // echo $box->getX();
    echo IntBox::extractX($box);
    echo IntBox::extractX(null);
}