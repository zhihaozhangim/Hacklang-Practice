namespace Hack\UserDocumentation\Fundamentals\ProgramStructure\Examples\LegacyHelloWorldFromPHP;

const int MAX_COUNT = 123;

class C {
    const int MAX_HEIGHT = 100;
    const int UPPER_LIMIT = C::MAX_HEIGHT;
    const int LOWER_LIMIT = MAX_COUNT;
}

<<__EntryPoint>>
function main(): void {
    echo C::MAX_HEIGHT.'\n';
    echo C::UPPER_LIMIT.'\n';
    echo C::LOWER_LIMIT.'\n';
    echo MAX_COUNT.'\n';
    echo __NAMESPACE__;
}