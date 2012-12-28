require! './unittest'
require! '../ciphers/vigenere'

cipher = new vigenere

eq \spmfijszccgpstr cipher.encrypt \ilovelivescript \key
eq \ilovelivescript cipher.encrypt \ilovelivescript \aa
eq \ttme cipher.encrypt \text \apple


eq \ilovelivescript cipher.decrypt \spmfijszccgpstr \key
eq \ilovelivescript cipher.decrypt \ilovelivescript \aa
eq \text cipher.decrypt \ttme \apple