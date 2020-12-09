// Using propery access modifier, the params in construct function can be promoted to instance field;
// final class User {
//     public function __construct(private int $id, private string $user_name) {}

//     public function __toString(): string {
//         return "UserID: $this->id, UserName: $this->user_name";
//     }
// }

// Partial promo
final class AnotherUser {
    private string $user_name;

    public function __construct(private int $id, string $user_name) {
        $this->user_name = $user_name."partial promo construct";
    }

    public function __toString(): string {
        return "UserID: $this->id, UserName: $this->user_name";
    }
}

final class User {
    private static dict<int, string> $all_users;
    private int $age;

    public function __construct(private int $id, private string $name, int $birth_year) {
        // All other statements in the constructors will run after the params promo.
        $this->age = \Date('Y') - $birth_year;

        $all_users[$this->id] = $this->name;
    }

    public function __toString(): string {
        return "UserID: $this->id, UserName: $this->name, Age: $this->age";
    }
}

<<__EntryPoint>>
function main(): void {
    // $user = new User(1234, 'Zhihao');
    // echo $user;
    // $user = new AnotherUser(7891, "Zhihao");
    // echo $user;
    $user = new User(1234, "Zhihaooooooooo", 2000);
    echo $user;
}