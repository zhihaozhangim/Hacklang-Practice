class StackUnderflowException extends \Exception {}

class Stack<T> {
    private vec<T> $stack;
    private int $stackPointer;

    public function __construct() {
        $this->stack = vec[];
        $this->stackPointer = 0;
    }

    public function push(T $element): void {
        $this->stack[] = $element;
        ++$this->stackPointer;
    }

    public function pop(): T {
        if ($this->stackPointer > 0) {
            $this->stackPointer--;
            return $this->stack[$this->stackPointer];
        } else {
            throw new StackUnderflowException();
        }
    }
}

<<__EntryPoint>>
function main(): void {
    $stack = new Stack<int>();
    $stack->push(1);
    $stack->push(2);
    echo $stack->pop();
    echo ",";
    echo $stack->pop();
}