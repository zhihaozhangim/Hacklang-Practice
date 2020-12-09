abstract class User {
    abstract const type T as arraykey;

    public function __construct(private this::T $id) {}

    public function getID(): this::T {
        return $this->id;
    }
}

trait UserTrait {
    require extends User;
}

interface UserInterface {
    require extends User;
}

class AppUser extends User implements UserInterface {
    use UserTrait;
    const type T = int;
}

class WebUser extends User implements UserInterface {
    use UserTrait;
    const type T = string;
}

class OtherUser extends User implements UserInterface {
    use UserTrait;
    const type T = arraykey;
}

abstract class Box {
    abstract const type T;

    public function __construct(private this::T $id) {}

    public function get(): this::T {
        return $this->id;
    }

    public function set(this::T $value): this {
        $this->id = $value;
        return $this;
    }
}

class IntBox extends Box {
    const type T = int;
}

<<__EntryPoint>>
function main(): void {
    // $app_user = new AppUser(1);
    // $web_user = new WebUser("12");
    // $other_user_1 = new OtherUser(123);
    // $other_user_2 = new OtherUser("1234");
    // echo $app_user->getID();
    // echo ", ";
    // echo $web_user->getID();
    // echo ", ";
    // echo $other_user_1->getID();
    // echo ", ";
    // echo $other_user_2->getID();
    // echo ". ";
    $box = new IntBox(10);
    echo $box->get();
    echo ", ";
    $box->set(20);
    echo $box->get();
}