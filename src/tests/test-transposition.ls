require! './unittest'
require! '../ciphers/transposition'

cipher = new transposition

deepEq <[ab cd e]>, cipher.splitText 2, \abcde
deepEq <[a b c d e]>, cipher.splitText 1, \abcde

deepEq <[ab cd ex]>, cipher.addX 2, <[ab cd e]>
deepEq <[ab cd ef]>, cipher.addX 2, <[ab cd ef]>
deepEq <[a b c d e]>, cipher.addX 1, <[a b c d e]>

eq \acebdf, cipher.joinText <[ab cd ef]>
eq '', cipher.joinText []

deepEq [0, 4, 5, 2, 3, 1], cipher.pattern \coffee
deepEq [1, 0, 2], cipher.pattern \key
deepEq [0, 1, 2], cipher.pattern \abc

deepEq [0, 5, 3, 4, 1, 2], cipher.decPattern \coffee
deepEq [1, 0, 2], cipher.decPattern \key

eq \lvei, cipher.switchLetters \live, [0, 2, 3, 1]
eq \efignr, cipher.switchLetters \fringe, [5, 0, 2, 4, 3, 1]

deepEq ['ad', 'be', 'cf'], cipher.splitDecText 2, \abcdef
deepEq ['ace', 'bdf'], cipher.splitDecText 3, \abcdef

eq \levcpivisiolert cipher.encrypt \ilovelivescript \key
eq \iiimocecneetlrdcsxoetyfivsabeplvpafr cipher.encrypt \ilovelivescriptandmaybecoffeescript \coffee

eq \ilovelivescript cipher.decrypt \levcpivisiolert \key
eq \ilovelivescriptandmaybecoffeescriptx cipher.decrypt \iiimocecneetlrdcsxoetyfivsabeplvpafr \coffee