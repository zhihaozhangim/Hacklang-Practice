abstract class Machine {
    public function openDoors(): void {
        return;
    }

    public function closeDoors(): void {
        return;
    }
}

interface Fliers {
    public function fly(): bool;
}

trait Plane {
    // This triat requires the class implements Fliers and extends Machine.
    require extends Machine;
    require implements Fliers;

    public function takeOff(): bool {
        $this->openDoors();
        $this->closeDoors();
        return $this->fly();
    }
}

class AirBus extends Machine implements Fliers {
    // The class extends Machine and implements Fliers, so it can use the trait.
    use Plane;

    <<__Override>>
    public function fly(): bool {
        return true;
    }
}

<<__EntryPoint>>
function main(): void {
    $ab = new AirBus();
    echo $ab->fly();
}