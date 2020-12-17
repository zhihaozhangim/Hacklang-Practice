// To strike a balance between flexibility, latency, and performance, we require that the awaits only appear in unconditionally consumed expression positions. 
// This means that from the closest statement, the result of the await must be used under all non-throwing cases. This is important because all awaits for a 
// statement will run together, we don't want to over-run code if its result might not be utilized. 

// All awaits within the same statement will execute concurrently.

// $sum =
//   await x_async() +      // yes!
//   await y_async();       // yes!

// $tuple = tuple(
//   await foo_async(),     // yes!
//   42,
// );

// $result = foo(
//   await bar_async(),     // yes!
//   await baz_async(),     // yes!
// );

// if (await x_async()) {   // yes!
//   // Conditional but separate statement
//   await y_async();       // yes!
// }

// $x = await async {       // yes!
//   await x_async();       // yes!
// }

// The following two expressions are not correct. 
// 1. For the first one, the second one doesn't necessarily need to be executed if they both executed concurrently. A waste of resources.
// 2. For the second one, the ternary expression will only choose one await statement to executed, it makes no sense to concurrently run both of them.
// The take-away is all the await in one expression will run concurently. It makes no sense if the expression contains conditional logic.

// $x =
//   await x_async() &&     // yes!
//   // Conditional expression
//   await y_async();       // no!

// $y = await x_async()     // yes!
//   ? await y_async()      // no!
//   : await z_async();     // no!

// In this example, you should make no assumptions about the order in which a_async(), b(), c_async() or d() are executed, 
// but you can assume that both await'ed functions (a_async() and c_async()) will be concurrently awaited.

// $x = foo(
//   await a_async(),
//   b(),
//   await c_async(),
//   d(),
// );

