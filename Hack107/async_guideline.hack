// 1. Be Liberal, but Careful, with Async. There is no penalty to use async
function sayHello(): string {
    return "hello world";
}

async function sayHelloAsync(): Awaitable<string> {
    return "hello world from async";
}

// The above 2 functions are equivalent. Async is great, but you still have to consider things like caching, batching and efficiency.

// 2. Do Not Use Async in Loops.
// DON'T await IN A LOOP, It totally defeats the purpose of async.
class User {
    public function __construct(public string $user_id) {}

    public static function get_name(int $id): User {
        return new User(\str_shuffle("ABCDEFGHIJ").\strval($id));
    }
}

async function load_user(int $id): Awaitable<User> {
    return User::get_name($id);
}

async function load_users_await_loop(vec<int> $ids): Awaitable<vec<User>> {
    $result = vec[];
    foreach ($ids as $id) {
        // Don't do this!!!!
        // 1. Making the loop iterations the limiting factor on how this code is going to run. By the loop, we are guaranteed to get the users sequentially.
        // 2. We are creating false dependencies. Loading one user is not dependent on loading another user.
        $result[] = await load_user($id);
    }
    return $result;
}

// Instead, we will want to use our async-aware mapping function, Vec\map_async.
async function load_users_no_loop(vec<int> $ids): Awaitable<vec<User>> {
    return Vec\map_async(
        $ids,
        $id ==> await load_user($id),
    )
}

// 3. Considering Data Dependencies Is Important

// Here is the general flow of how to make sure async code is data dependency correct:
// 1. Put each sequence of dependencies with no branching (chain) into its own async function.
// 2. Put each bundle of parallel chains into its own async function.
// 3. Repeat to see if there are further reductions.
class PostData {
    public function __construct(public string $text) {}
}

async function get_all_post_ids_for_author(int $author_id): Awaitable<vec<int>> {
  // Query database, etc., but for now, just return made up stuff
  return vec[4, 53, 99];
}

async function fetch_post_data(int $post_id): Awaitable<PostData> {
    return new PostData(\str_shuffle("ABCDEFGHIJKLMNOPQRSTUVWXYZ"));
}

async function fetch_comment_count(int $post_id): Awaitable<int> {
    return \rand(0, 50);
}

// async function fetch_page_data(int $author_id): Awaitable<vec<(PostData, int)>> {
//     $post_ids = await get_all_post_ids_for_author($author_id);
//     // An async closure that will turn a post ID into a tuple of
//     // post data and comment count
//     $post_fetcher = async function(int $post_id): Awaitable<(PostData, int)> {
//         list($post_data, $comment_count) = await Vec\from_async(vec[
//             fetch_post_data($post_id),
//             fetch_comment_count($post_id),
//         ]);
//         invariant($post_data is PostData, '$post_data has wrong type');
//         invariant($comment_count is int, '$comment_count has wrong type');
//         return tuple($post_data, $comment_count);
//     }
//     return await Vec\map_async($post_ids, $post_fetcher);
// }

async function generate_page(int $author_id): Awaitable<string> {
    $tuples = await fetch_page_data($author_id);
    $page = '';
    foreach ($tuples as $tuple) {
        list($post_data, $comment_count) = $tuple;
        $page .= $post_data->text.' '.$comment_count;
    }
    return $page;
}

// The above example follows our flow:
// 1. One function for each fetch operation (post ids, post text, comment count).
// 2. One function for the bundle of data operations (post text and comment count).
// 3. One top function that coordinates everything.


// 4. Memoization May be Good, But Only Awaitables.
// Given that async is commonly used in operations that are time-consuming, memoizing (i.e., caching) 
// the result of an async call can definitely be worthwhile. 

// The <<__Memoize>> attribute does the right thing, so, use that. However, if to get explicit control of the memoization, 
// memoize the awaitable and not the result of awaiting it.


<<__EntryPoint>>
async function main(): Awaitable<void> {
    // \var_dump(sayHello());
    // \var_dump(await sayHelloAsync());
    // $ids = vec[1, 2, 5, 99, 332];
    // $result = await load_users_await_loop($ids);
    // \var_dump($result);
} 

