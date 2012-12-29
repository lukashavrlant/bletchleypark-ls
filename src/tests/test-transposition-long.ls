require! ['./unittest', fs, '../cryptanalysis/transposition-long', '../cryptanalysis/text-analyzer', '../ciphers/transposition']

cracker = new transpositionLong
trans = new transposition

# openText = \michaudziskalprotentoprojektinvesticidolaruodspoluzakladatelepaypalusluzbaelektronickeplatbynainternetupeterathieladikytomubudemocivytvoritfunkcniprototypaveatmospherevortexenginekterybudemitmetrunavyskuametruvprumerusilatornadajeneoddiskutovatelnaavmemnavrhuisnadnokontrolovatelnaprotozestacizastavitprivodteplehovzduchuajepotornaduuvadinasvemwebumichauduzvrocepostavilmensictyrmetrovymodelnovyprototypmarealneukazatzesvelikostivezeaturbinyporosteexponencialnejejivykonmichaudtvrdizetornadovevezioprumerumetruvyuzivajiciodpadniteplozmegawattoveelektrarnyvyrobidalsichmegawattuenergienakladynajednukilowatthodinupakpodlenejneprekrocitricentyhalerucozjemenenezazcentuutepelnychelektrarenvusasamozrejmejakozdrojeteplasedapouzittrebasolarnienergievykonsezvysujegeometrickouradousvelikostipredpokladamzekomercnezivotaschopnyprototyppostavimevrocereklmichaudkteremusenedarilosehnatinvestora

# cipherText = trans.encrypt openText, \bdcefa
# console.log cracker.crack analyzer, cipherText
# eq \f brute.crack analyzer, cipherText

deepEq {a: [0, 1, 7], b: [2, 3], w: [4], e: [5], r: [6]}, cracker.positions \aabbwera
deepEq {"t":[0,4],"w":[1],"e":[2,3],"i":[5],"n":[6],"g":[7]}, cracker.positions \tweeting

deepEq {"t":2,"w":1,"e":2,"i":1,"n":1,"g":1}, cracker.counter \tweeting
deepEq {"f":1,"r":1,"i":1,"n":1,"g":1,"e":1}, cracker.counter \fringe

ok cracker.matchCounter \fringe, {"f":1,"r":1,"i":1,"n":1,"g":1,"e":1}
nok cracker.matchCounter \fringe, {"f":1,"r":1,"i":1,"n":1,"g":1,"e":2}

deepEq [2, 7] cracker.keyLengths \regisaddfjnitd
deepEq [3, 5] cracker.keyLengths \fringeistheshow