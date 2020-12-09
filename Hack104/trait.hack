trait T1 {
    public int $x = 0;

    public function generate_even(): int {
        invariant($this->x % 2 === 0, "Number is not even.");
        $this->x += 2;
        return $this->x;
    } 
}

trait T2 {
    use T1;

    public function generate_odd(): int {
        return $this->generate_even() + 1;
    }
}

trait T3 {
    public static function is_odd(int $number): bool {
        return $number % 2 === 1;
    }
}

class C {
    use T2, T3;

    public function foo(): string {
        // return self::is_odd($this->generate_odd()) ? "Yes" : "No";
        return static::is_odd($this->generate_odd()) ? "Yes" : "No";
    }
}

<<__EntryPoint>>
function main(): void {
    $c = new C();
    echo $c->foo();
}