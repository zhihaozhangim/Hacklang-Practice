class Point {
    private float $x;
    private float $y;

    public function __construct(num $x = 0, num $y = 0) {
        $this->x = (float)$x;
        $this->y = (float)$y;
    }

    public function __toString(): string {
        return "(".$this->x.", ".$this->y.")";
    }
}

<<__EntryPoint>>
function main(): void {
    $p = new Point(10.9, 7.8);
    echo $p;
}