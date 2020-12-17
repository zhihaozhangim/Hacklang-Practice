// The async keyword is merely an implementation detail. For this reason, async is not allowed in interfaces.
interface Car {
  // It doesn't matter to the caller how this is implemented, only that it returns an Awaitable<void>
  public function drive(): Awaitable<void>;
}

// This can be implemented with an async function, like this:
class Ford implements Car {
    public async function drive(): Awaitable<void> {
        // ...
    }
}

// It can also be implemented by a non-async function, like this:
class BMW implements Car {
    public function drive(): Awaitable<void> {
        $this->driveNormally();
    }

    private async function driveNormally(): Awaitable<void> {
        // ...
    }
}

// The use of async is strongly encouraged for all functions, except for:
// - Interface method declarations
// - Abstract method declarations