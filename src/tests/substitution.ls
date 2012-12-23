require! './unittest'
require! '../ciphers/substitution'

cipher = new substitution

eq \iyxbtyibtlmdiku cipher.encrypt \ilovelivescript \camntwqzipryofxkhdlusbevjg

eq \ilovelivescript cipher.decrypt \iyxbtyibtlmdiku \camntwqzipryofxkhdlusbevjg