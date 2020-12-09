class Point {
    public static int $counter = 0; 
    private float $x;
    private float $y;

    public function __construct(num $x = 0, num $y = 0) {
        $this->x = (float)$x;
        $this->y = (float)$y;
        
        // The following 4 statements are the same
        // ++self::$counter;
        // ++Point::$counter;
        // ++static::$counter;
        ++$this::$counter;
        
        // This doesn't work
        // ++$counter;
    }

    public function __toString(): string {
        return $this->x.' '.$this->y;
    }
}

<<__EntryPoint>>
function main(): void {
    $p1 = new Point(1, 2);
    echo $p1.' ';
    $p2 = new Point(2, 3);
    echo $p2.' ';
    $p3 = new Point(3, 4);
    echo $p3.' ';
    echo Point::$counter;
}