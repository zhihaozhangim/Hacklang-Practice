class Person {
    private string $name;

    public function __construct($name) {
        $this->name = $name;
    }

    public function greeting(): string {
        return "Hey, I am ".$this->name;
    }

    public static function greetingInGeneral(): string {
        return "Just greeting";
    }
}

<<__EntryPoint>>
function main(): void {
    $p = new Person("Zhihao");
    echo $p->greeting();
    echo Person::greetingInGeneral();
}