enum ControlStatus: int {
    Stopped = 1;
    Stopping = 2;
    Starting = 3;
    Started = 4;
}

<<__EntryPoint>>
function main(): void {
    // echo convertType(ControlStatus::Stopping);
    // echo MathLibrary::sin(123.123);
}

function convertType(ControlStatus $control_status): string {
    switch ($control_status) {
        case ControlStatus::Stopped:
            return "Stopped";
        case ControlStatus::Stopping:
            return "Stopping";
        case ControlStatus::Starting:
            return "Starting";
        case ControlStatus::Started:
            return "Started";
        default:
            return "Nothing returned here";
    }
}

final class MathLibrary {
    const PI = 3.1415926;
    public static function sin(float $val): float {
        return $val;
    }
}

class C1 {}

class C2 {
    public static classname<C1> $p1 = C1:class;
    public static function f(?classname<C1> $p): classname<C1> {}
    public static array<classname<C1>> $p2 = array(C1:class);
}