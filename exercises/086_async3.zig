//
// Because they can suspend and resume, async Zig functions are
// an example of a more general programming concept called
// "coroutines". One of the neat things about Zig async functions
// is that they retain their state as they are suspended and
// resumed.
//
// See if you can make this program print "5 4 3 2 1".
//
const print = @import("std").debug.print;

pub fn main() void {
    var n: u32 = 5;
    var foo_frame = async foo(&n);

    while(n > 0) {
        resume foo_frame;
    }

    print("\n", .{});
}

fn foo(countdown: *u32) void {
    while (countdown.* > 0) {
        print("{} ", .{countdown.*});
        countdown.* -= 1;
        suspend {}
    }
}
