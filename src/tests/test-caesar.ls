require! './unittest'
require! '../ciphers/caesar'

cipher = new caesar

eq \bipk cipher.encrypt \ahoj \b
eq \ybelubyluishyfj cipher.encrypt \ilovelivescript \q
eq \livescript cipher.encrypt \livescript \a


eq \ahoj cipher.decrypt \bipk \b
eq \ilovelivescript cipher.decrypt \ybelubyluishyfj \q
eq \livescript cipher.decrypt \livescript \a


eq \bcdefghijklmnopqrstuvwxyza cipher.makeSubsKey \b
eq \abcdefghijklmnopqrstuvwxyz cipher.makeSubsKey \a
eq \rstuvwxyzabcdefghijklmnopq cipher.makeSubsKey \r