class IntBox {
    public function __construct(protected int $value) {}

    public function get(): int {
        return $this->value;
    }
}

class MutableBox extends IntBox {
    public function set(int $value): void {
        $this->value = $value;
    }

    <<__Override>>
    public function get(): int {
        return $this->value + 100;
    }
}

class IncrementalIntBox extends IntBox {
    <<__Override>>
    public function get(): int {
        return parent::get() + 1000;
    }
}

class MyParent {
    public static function getSomething(): int {
        return 1000;
    }
}

class MyChild extends MyParent {
    <<__Override>>
    public static function getSomething(): int {
        return parent::getSomething() + 1000;
    }
}

abstract class Animal {
    public abstract function greeting(): string;
}

class Dog extends Animal {
    <<__Override>>
    public function greeting(): string {
        return "Bark";
    }
}

// abstract and final can be used together to group util class that cannot be initialized or subclassed.
abstract final class MyExample {
    public static function getSomething(): string {
        return "Hell ".MyExample::Helper();
    }
    private static function Helper(): string {
        return "Yes!!";
    }
}

class AnotherParentClass {
    public final function getStringInTheClass(): string {
        return "Something to return";
    }
}

// class AnotherChildClass extends AnotherParentClass {
    // A final method cannot be overloaded.
//     <<__Override>>
//     public function getStringInTheClass(): string {
//         return "Error in trying to overloading a final class!!!!!";
//     }
// }

<<__EntryPoint>>
function main(): void {
    // $box = new MutableBox(15);
    // echo $box->get();
    // $box->set(100);
    // echo ",";
    // echo $box->get();
    // $box2 = new IncrementalIntBox(1);
    // echo $box2->get();
    // echo MyChild::getSomething();
    // $dog = new Dog();
    // echo $dog->greeting();
    // echo MyExample::getSomething();
    $instance = new AnotherParentClass();
    echo $instance->getStringInTheClass();
    // $instance2 = new AnotherChildClass();
    // $instance2->getStringInTheClass();
}
