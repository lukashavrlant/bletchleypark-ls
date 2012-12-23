require! substitution: "./ciphers/substitution"

s = new substitution

text = 'ahojky'
key = 'bcdefghijklmnopqrstuvwxyza'
res = s.encrypt text, key
console.log res