// An async function will always return an Awaitable interface that wraps the return type
// We have to await it to complete or join before we can access the result
async function getInt(): Awaitable<int> {
    return 2;
}

<<__EntryPoint>>
async function main(): Awaitable<void> {
    $result = await getInt();
    \var_dump($result);
}

// Sometimes we want to get a result out of an awaitable when the function we are in is not async. 
// For this there is HH\Asio\join, which takes an Awaitable and blocks until it resolves to a result.

// We should not call join inside an async function. This would defeat the purpose of async, as the awaitable and any dependencies will run to completion synchronously, stopping any other awaitables from running.


// At other times, we will gather a bunch of awaitables and await them all before moving on.

// Here we are using one of the library helper-functions in order to batch a bunch of awaitables together to then await upon:

// HH\Lib\Vec\from_async: vec of awaitables with consecutive integer keys
// HH\Lib\Dict\from_async: dict of awaitables with integer or string keys


// async function quads(float $n): Awaitable<float> {
//   return $n * 4.0;
// }

// <<__EntryPoint>>
// async function quads_m(): Awaitable<void> {
//   $awaitables = dict['five' => quads(5.0), 'nine' => quads(9.0)];
//   $results = await Dict\from_async($awaitables);

//   \var_dump($results['five']); // float(20)
//   \var_dump($results['nine']); // float(36)
// }