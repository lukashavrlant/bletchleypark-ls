require! './unittest'
require! '../ciphers/transposition'

cipher = new transposition

eq \levcpivisiolert cipher.encrypt \ilovelivescript \key
eq \iiimocecneetlrdcsxoetyfivsabeplvpafr cipher.encrypt \ilovelivescriptandmaybecoffeescript \coffee

eq \ilovelivescript cipher.decrypt \levcpivisiolert \key
eq \ilovelivescriptandmaybecoffeescriptx cipher.decrypt \iiimocecneetlrdcsxoetyfivsabeplvpafr \coffee