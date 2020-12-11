// T as sometype, meaning that T must be a subtype of sometype
// T super sometype, meaning that T must be a supertype of sometype
// T = sometype, meaning that T must be equivalent to sometype. (This is like saying both T as sometype and T super sometype.)

// In this case, only when T is int or float does it make sense.
function getMax<T as num>(T $num1, T $num2): T {
    return $num1 > $num2 ? $num1 : $num2;
}

// Sometimes some methods want to use some features of the type parameter, and others want to use some different features, 
// and not all instances of the class will satisfy all constraints. 
// This can be done by specifying constraints that are local to particular methods. 

// class MyWidget<Telem> {
//     public function showIt(): void where Telem as IPrintable {...}
//     public function countIt(): void where Telem as ICountable {...}
// }

// A where constraint permits multiple constraints supported; just separate the constraints with commas.
// class SomeClass<T> {
//   function foo(T $x) where T as MyInterface, T as MyOtherInterface
// }



<<__EntryPoint>>
function main(): void {
    echo getMax(4, 7);
    echo ", ";
    echo getMax(56.7, 78.9);
    echo ", ";
    echo getMax(12.3, 45);
}