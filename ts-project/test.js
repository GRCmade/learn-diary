var values = [
    undefined,
    null,
    true,
    42,
    BigInt(42),
    "hello",
    Symbol("symbol"),
    function () { },
    {},
    []
];
values.forEach(function (value) {
    console.log("".concat(value, " is of type ").concat(typeof value));
});
