require! assert
global.eq = assert.strictEqual
global.deepEq = assert.deepEqual
global.ok = assert.ok
global.nok = (a, b = '') ~> assert (not a), b