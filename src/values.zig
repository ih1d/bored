// Top-level declarations are order-independent:
const print = std.debug.print;
const std = @import("std");
const os = std.os;
const assert = std.debug.assert;

// Custom error set definition:
const ExampleErrorSet = error{
    ExampleErrorVariant,
};

pub fn main() void {

    // optional
    var optional_value: ?[]const u8 = null;
    assert(optional_value == null);
    print("optional 1\ntype: {}\nvalue: {?s}\n", .{
        @TypeOf(optional_value),
        optional_value,
    });
    optional_value = "hi";
    assert(optional_value != null);
    print("\noptional 2 \ntype: {}\nvalue: {?s}\n", .{
        @TypeOf(optional_value),
        optional_value,
    });

    // errors
    var number_or_error: ExampleErrorSet!i32 = ExampleErrorSet.ExampleErrorVariant;
        print("\nerror union 1\ntype: {}\nvalue: {!}\n", .{
        @TypeOf(number_or_error),
        number_or_error,
    });

    number_or_error = 1234;

    print("\nerror union 2\ntype: {}\nvalue: {!}\n", .{
        @TypeOf(number_or_error), number_or_error,
    });
}
