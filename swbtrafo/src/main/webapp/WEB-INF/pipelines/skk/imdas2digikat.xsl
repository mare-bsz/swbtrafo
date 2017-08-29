<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:my="http://swbexpo.bsz-bw.de"
	exclude-result-prefixes="my">

	<xsl:import href="../swbexpo.xsl" />

	<!-- XSL zur Verarbeitung von XML-Exporten aus IMDAS-Pro der SKK (Staatliche 
		Kunsthalle Karlsruhe @version: 1.0.04 @created: 18.07.2011 @modified: 20.11.2013 
		@author: christof.mainberger@bsz-bw.de -->

	<my:material>
		<entry key="Acrylglas">Glas</entry>
		<entry key="Ahornholz">Holz</entry>
		<entry key="Aluminium">Aluminium</entry>
		<entry key="Aluminiumblech">Aluminium</entry>
		<entry key="Aquarellkarton">Karton</entry>
		<entry key="Aquarellpapier">Papier</entry>
		<entry key="aufgezogen"></entry>
		<entry key="Augenbinde">Objekt</entry>
		<entry key="Baumwollstoff">Stoff</entry>
		<entry key="beige"></entry>
		<entry key="Beton">Stein</entry>
		<entry key="Blattgold">Blattgold</entry>
		<entry key="blau"></entry>
		<entry key="blaugrau"></entry>
		<entry key="bläulich"></entry>
		<entry key="Blech">Blech</entry>
		<entry key="Blütenstaub">Granulate/Pulver/Puder</entry>
		<entry key="braun"></entry>
		<entry key="bräunlich"></entry>
		<entry key="bräunlich-beige"></entry>
		<entry key="bräunlich-gelb"></entry>
		<entry key="bräunlich-grau"></entry>
		<entry key="Bronze">Bronze</entry>
		<entry key="Buche">Holz</entry>
		<entry key="Buchenholz">Holz</entry>
		<entry key="Buchenholzgitter">Holz</entry>
		<entry key="Bütten auf Pappe">Papier</entry>
		<entry key="Büttenjapan">Papier</entry>
		<entry key="Büttenkarton">Papier</entry>
		<entry key="Büttenpapier">Papier</entry>
		<entry key="Büttenpapier, gerippt">Papier</entry>
		<entry key="Caparol">Caparol</entry>
		<entry key="chamois"></entry>
		<entry key="Chinapapier">Papier</entry>
		<entry key="Chinapapier, aufgewalzt">Papier</entry>
		<entry key="cremefarben"></entry>
		<entry key="Draht">Draht</entry>
		<entry key="dunkelbraun"></entry>
		<entry key="Edelstahl">Stahl</entry>
		<entry key="Eichenholz">Holz</entry>
		<entry key="Eisen">Eisen</entry>
		<entry key="Eisenblech">Eisen</entry>
		<entry key="Eisendraht">Eisen</entry>
		<entry key="Eisenrohr">Eisen</entry>
		<entry key="Elektrozubehör">Objekt</entry>
		<entry key="elfenbeinfarben"></entry>
		<entry key="Erlenholz">Holz</entry>
		<entry key="Farbiges Papier">Papier</entry>
		<entry key="Fichtenholz">Holz</entry>
		<entry key="Fotografie">Fotografie</entry>
		<entry key="Fotokarton">Karton</entry>
		<entry key="Fotozellen">Objekt</entry>
		<entry key="gelb"></entry>
		<entry key="gelblich"></entry>
		<entry key="gelblich-braun"></entry>
		<entry key="Gips">Gips</entry>
		<entry key="Glas">Glas</entry>
		<entry key="Gläser mit Schraubdeckel">Glas</entry>
		<entry key="Glühbirne">Objekt</entry>
		<entry key="Glühlampe">Objekt</entry>
		<entry key="grau"></entry>
		<entry key="graubeige"></entry>
		<entry key="graublau"></entry>
		<entry key="graubraun"></entry>
		<entry key="grauer Karton">Karton</entry>
		<entry key="graugelblich"></entry>
		<entry key="graugrün"></entry>
		<entry key="gräulich"></entry>
		<entry key="grünblau"></entry>
		<entry key="grünlich"></entry>
		<entry key="grünlich-grau"></entry>
		<entry key="Haare">Haare</entry>
		<entry key="Hammerschlaglack">Lack</entry>
		<entry key="handgeschöpft"></entry>
		<entry key="Handschuhe">Objekt</entry>
		<entry key="Hartfaserplatte">Holz</entry>
		<entry key="hellbeige"></entry>
		<entry key="hellblau"></entry>
		<entry key="hellbraun"></entry>
		<entry key="hellgrau"></entry>
		<entry key="Holz">Holz</entry>
		<entry key="Holzlatten">Holz</entry>
		<entry key="imitiertes Japanpapier">Papier</entry>
		<entry key="Japanpapier">Papier</entry>
		<entry key="Jute auf Holz">Jute</entry>
		<entry key="Kaffeesatz">Granulate/Pulver/Puder</entry>
		<entry key="Kaliko">Kaliko</entry>
		<entry key="Kalksandstein">Stein</entry>
		<entry key="Karopapier">Papier</entry>
		<entry key="Karton">Karton</entry>
		<entry key="kaschiert"></entry>
		<entry key="Kastanienholz">Holz</entry>
		<entry key="Keramik">Keramik</entry>
		<entry key="Kiefernholz">Holz</entry>
		<entry key="Kiesel">Stein</entry>
		<entry key="Kork">Kork</entry>
		<entry key="Kreide">Kreide</entry>
		<entry key="Kunststoff">Kunststoff</entry>
		<entry key="Kupfer">Kupfer</entry>
		<entry key="Kupferdruck-Bütten">Papier</entry>
		<entry key="Kupferdruckkarton">Karton</entry>
		<entry key="Kupferdruckpapier">Papier</entry>
		<entry key="Kupferplatte">Kupfer</entry>
		<entry key="Kupferrohr">Kupfer</entry>
		<entry key="Lärche">Holz</entry>
		<entry key="Lattenrost">Objekt</entry>
		<entry key="Laubholz">Holz</entry>
		<entry key="Lautsprecher">Objekt</entry>
		<entry key="Leder">Leder</entry>
		<entry key="Leinen">Leinen</entry>
		<entry key="Leinwand">Leinwand</entry>
		<entry key="Leinwand auf Eichenholz">Leinwand</entry>
		<entry key="Leinwand auf Holz">Leinwand</entry>
		<entry key="Leinwand auf Karton">Leinwand</entry>
		<entry key="Leinwand auf Pappe">Leinwand</entry>
		<entry key="Leinwand auf Pappelholz">Leinwand</entry>
		<entry key="Leinwand auf Sperrholz">Leinwand</entry>
		<entry key="Leuchtweiß">Leuchtweiß</entry>
		<entry key="Lindenholz">Holz</entry>
		<entry key="Löschkarton">Karton</entry>
		<entry key="Luftballon">Objekt</entry>
		<entry key="Marmor">Stein</entry>
		<entry key="Maschendraht">Draht</entry>
		<entry key="Maschinenbütten">Papier</entry>
		<entry key="MDF-Platte">Holz</entry>
		<entry key="Messing">Messing</entry>
		<entry key="Metall">Metall</entry>
		<entry key="Metallkonsole">Metall</entry>
		<entry key="Nadelholz">Holz</entry>
		<entry key="Nadeln">Objekt</entry>
		<entry key="Nagel">Objekt</entry>
		<entry key="Nägel">Objekt</entry>
		<entry key="Naturpapier">Papier</entry>
		<entry key="Nessel">Nessel</entry>
		<entry key="Nußbaumholz">Holz</entry>
		<entry key="ockerfarben"></entry>
		<entry key="Offsetpapier">Papier</entry>
		<entry key="Packpapier">Papier</entry>
		<entry key="Papier">Papier</entry>
		<entry key="Papier auf Karton">Papier</entry>
		<entry key="Papier auf Leinwand">Papier</entry>
		<entry key="Papier auf Pappe">Papier</entry>
		<entry key="Papier auf Sperrholz">Papier</entry>
		<entry key="Papier, aufgewalzt">Papier</entry>
		<entry key="Papier, blau grundiert">Papier</entry>
		<entry key="Papier, braun grundiert">Papier</entry>
		<entry key="Papier, genarbt">Papier</entry>
		<entry key="Papier, gerippt">Papier</entry>
		<entry key="Papier, grau grundiert">Papier</entry>
		<entry key="Papier, grau-blau">Papier</entry>
		<entry key="Papier, hellgrün grundiert">Papier</entry>
		<entry key="Papier, rot getönt">Papier</entry>
		<entry key="Papier, strukturiert">Papier</entry>
		<entry key="Papier, ziegelrot grundiert">Papier</entry>
		<entry key="Pappe">Pappe</entry>
		<entry key="Pappe auf Holz">Pappe</entry>
		<entry key="Pappe, auf Keilrahmen genagelt">Pappe</entry>
		<entry key="Pappelholz">Holz</entry>
		<entry key="Pauspapier">Papier</entry>
		<entry key="Pergament">Pergament</entry>
		<entry key="Pergament auf Eichenholz">Pergament</entry>
		<entry key="Pergament auf Karton">Pergament</entry>
		<entry key="Pergamentpapier">Pergament</entry>
		<entry key="Pigmente">Granulate/Pulver/Puder</entry>
		<entry key="Plastikbeutel">Objekt</entry>
		<entry key="Plexiglas">Glas</entry>
		<entry key="Postkarte">Objekt</entry>
		<entry key="Pressspanplatte">Holz</entry>
		<entry key="Putz">Putz</entry>
		<entry key="Rasierklingen">Objekt</entry>
		<entry key="Rauhfasertapete">Papier</entry>
		<entry key="rot grundiert"></entry>
		<entry key="Rotbuchenholz">Holz</entry>
		<entry key="rötlich-braun"></entry>
		<entry key="Rupfen">Rupfen</entry>
		<entry key="Sägeblatt">Objekt</entry>
		<entry key="Sägemehl">Granulate/Pulver/Puder</entry>
		<entry key="Sand">Sand</entry>
		<entry key="sandfarben"></entry>
		<entry key="Sandguß">Sand</entry>
		<entry key="Schellack">Lack</entry>
		<entry key="Schichtholz">Holz</entry>
		<entry key="Schiefer">Stein</entry>
		<entry key="Schwämme">Objekt</entry>
		<entry key="Seide">Seide</entry>
		<entry key="Seide, synthetisch">Seide</entry>
		<entry key="Seil">Objekt</entry>
		<entry key="Socken">Objekt</entry>
		<entry key="Spanplatte">Holz</entry>
		<entry key="Sperrholz">Holz</entry>
		<entry key="Spiegelglas">Glas</entry>
		<entry key="Stahl">Stahl</entry>
		<entry key="Stein">Stein</entry>
		<entry key="Steinguß">Stein</entry>
		<entry key="Stoff">Stoff</entry>
		<entry key="Tannenholz">Holz</entry>
		<entry key="Terrakotta">Keramik</entry>
		<entry key="Tischlerplatte">Holz</entry>
		<entry key="Ton, ungebrannt">Ton</entry>
		<entry key="Tonpapier">Papier</entry>
		<entry key="Transparentpapier">Papier</entry>
		<entry key="Travertin">Stein</entry>
		<entry key="T-Shirt">Objekt</entry>
		<entry key="Tuffstein">Stein</entry>
		<entry key="Unterhose">Objekt</entry>
		<entry key="Velinkarton">Karton</entry>
		<entry key="Velinpapier">Papier</entry>
		<entry key="Videoband">Objekt</entry>
		<entry key="violett"></entry>
		<entry key="Wachs, rot">Wachs</entry>
		<entry key="Watte">Watte</entry>
		<entry key="weiß"></entry>
		<entry key="weißer Karton">Karton</entry>
		<entry key="weißes Papier">Papier</entry>
		<entry key="weißlich"></entry>
		<entry key="weißliches Papier">Papier</entry>
		<entry key="Zeichenfolie">Folie</entry>
		<entry key="Zeichenkarton">Karton</entry>
		<entry key="Zeichenkarton, genarbt">Karton</entry>
		<entry key="Zeichenpapier">Papier</entry>
		<entry key="Zeitungspapier">Papier</entry>
		<entry key="Zement">Stein</entry>
		<entry key="ziegelrot grundiert"></entry>
		<entry key="Zinkblech">Zink</entry>
		<entry key="Zinkplatte">Zink</entry>
	</my:material>

	<my:technik>
		<entry key="Abguss">Guss</entry>
		<entry key="Abklatsch (?) in Dunkelgrau">Abklatsch</entry>
		<entry key="Abklatsch in Dunkelblau">Abklatsch</entry>
		<entry key="Abklatsch in Dunkelgrau">Abklatsch</entry>
		<entry key="Abklatsch in Grün-Braun">Abklatsch</entry>
		<entry key="Abklatsch in Hellbraun">Abklatsch</entry>
		<entry key="Abklatsch in Schwarz">Abklatsch</entry>
		<entry key="Acryl über Bleistift">Acryl</entry>
		<entry key="Acrylfarbe">Acryl</entry>
		<entry key="Acrylharze">Acryl</entry>
		<entry key="Aquarell">Aquarell</entry>
		<entry key="Aquarell in Blau">Aquarell</entry>
		<entry key="aquarelliert">aquarelliert</entry>
		<entry key="aquarelliert in Rotbraun">aquarelliert</entry>
		<entry key="Aquatinta">Aquatinta</entry>
		<entry key="Asche">Granulate/Pulver/Puder</entry>
		<entry key="Ätzradierung">Radierung</entry>
		<entry key="Ätzung">Ätzung</entry>
		<entry key="Aussprengverfahren (Reservage)">Reservage</entry>
		<entry key="bemalt"></entry>
		<entry key="Bemalung in Grau"></entry>
		<entry key="Bitumen">Bitumen</entry>
		<entry key="Blattgold">Blattgold</entry>
		<entry key="blau aquarelliert">aquarelliert</entry>
		<entry key="blau laviert">laviert</entry>
		<entry key="blaue Kreide">Kreide</entry>
		<entry key="blau-grau aquarelliert">aquarelliert</entry>
		<entry key="Blau-grau laviert">laviert</entry>
		<entry key="Bleigriffel">Bleigriffel</entry>
		<entry key="Bleistift">Bleistift</entry>
		<entry key="Bleiweiß"></entry>
		<entry key="braun angelegt"></entry>
		<entry key="braun aquarelliert">aquarelliert</entry>
		<entry key="braun gedruckt"></entry>
		<entry key="braun laviert">laviert</entry>
		<entry key="braun und grau laviert">laviert</entry>
		<entry key="braun und gräulich-braun laviert">laviert</entry>
		<entry key="braune Kreide">Kreide</entry>
		<entry key="braune Tusche">Tusche</entry>
		<entry key="braun-grau laviert">laviert</entry>
		<entry key="bräunlich-grau laviert">laviert</entry>
		<entry key="braun-rosa laviert">laviert</entry>
		<entry key="braunrot aquarelliert">aquarelliert</entry>
		<entry key="Caparol">Caparol</entry>
		<entry key="Cetol-Wetterschutzfarbe">Wetterschutzfarbe</entry>
		<entry key="Chinesische Tusche">Tusche</entry>
		<entry key="Clair-obscur-Holzschnitt">Clair-obscur-Holzschnitt</entry>
		<entry key="Cliché verre">Cliché verre</entry>
		<entry key="Collage">Collage</entry>
		<entry key="collagiert">Collage</entry>
		<entry key="Deckfarbe">Deckfarbe</entry>
		<entry key="Deckfarbe in Schwarz">Deckfarbe</entry>
		<entry key="Deckfarbe in Weiß">Deckfarbe</entry>
		<entry key="Deckfarben">Deckfarbe</entry>
		<entry key="Deckfarbenhöhung">Höhung</entry>
		<entry key="Deckweiß">Deckweiß</entry>
		<entry key="Deckweißhöhung">Höhung</entry>
		<entry key="Dispersionsfarbe">Dispersionsfarbe</entry>
		<entry key="dunkelbraun laviert">laviert</entry>
		<entry key="Durchdruck">Durchdruck</entry>
		<entry key="Einritzungen"></entry>
		<entry key="Ei-Öl-Emulsion">Eitempera</entry>
		<entry key="Ei-Öl-Tempera">Eitempera</entry>
		<entry key="Eisendraht, gebogen">Draht</entry>
		<entry key="Eisenradierung">Radierung</entry>
		<entry key="Eitempera">Eitempera</entry>
		<entry key="Emulsionsfarbe">Farbe</entry>
		<entry key="Farbe">Farbe</entry>
		<entry key="Farbholzschnitt">Holzschnitt</entry>
		<entry key="farbig angelegt"></entry>
		<entry key="farbig aquarelliert">aquarelliert</entry>
		<entry key="Farbkreiden">Kreide</entry>
		<entry key="Farblithografie">Lithografie</entry>
		<entry key="Farbradierung">Radierung</entry>
		<entry key="Farbstifte">Farbstift</entry>
		<entry key="Feder">Feder</entry>
		<entry key="Feder in Blau">Feder</entry>
		<entry key="Feder in Braun">Feder</entry>
		<entry key="Feder in Braun bis Dunkelbraun">Feder</entry>
		<entry key="Feder in Braungrau">Feder</entry>
		<entry key="Feder in Braun-Grau">Feder</entry>
		<entry key="Feder in Braun-Grün">Feder</entry>
		<entry key="Feder in Braunschwarz">Feder</entry>
		<entry key="Feder in Dunkelblau">Feder</entry>
		<entry key="Feder in Dunkelbraun">Feder</entry>
		<entry key="Feder in Dunkelbraun bis Schwarz">Feder</entry>
		<entry key="Feder in Dunkelgrau">Feder</entry>
		<entry key="Feder in Dunkelgrau bis Schwarz">Feder</entry>
		<entry key="Feder in Dunkelgrau und in Dunkelbraun">Feder</entry>
		<entry key="Feder in Gelbbraun">Feder</entry>
		<entry key="Feder in Grau">Feder</entry>
		<entry key="Feder in Grau bis Schwarz">Feder</entry>
		<entry key="Feder in Graublau">Feder</entry>
		<entry key="Feder in Grau-Blau">Feder</entry>
		<entry key="Feder in Graubraun">Feder</entry>
		<entry key="Feder in Grau-Braun">Feder</entry>
		<entry key="Feder in Grau-Grün">Feder</entry>
		<entry key="Feder in Grünbraun">Feder</entry>
		<entry key="Feder in Grün-Braun">Feder</entry>
		<entry key="Feder in Grün-Grau">Feder</entry>
		<entry key="Feder in Hellbraun">Feder</entry>
		<entry key="Feder in Hellgrau">Feder</entry>
		<entry key="Feder in Rot">Feder</entry>
		<entry key="Feder in Rotbraun">Feder</entry>
		<entry key="Feder in Schwarz">Feder</entry>
		<entry key="Feder in Schwarzbraun">Feder</entry>
		<entry key="Feder in Schwarzgrau">Feder</entry>
		<entry key="Feder in schwärzlichem Blau">Feder</entry>
		<entry key="Feder in schwärzlichem Braun">Feder</entry>
		<entry key="Feder in Sepia">Feder</entry>
		<entry key="Feder in Violett">Feder</entry>
		<entry key="Feder in Weiß">Feder</entry>
		<entry key="Fettkreide">Kreide</entry>
		<entry key="Filzstift">Faserstift</entry>
		<entry key="Firnis">Firnis</entry>
		<entry key="fixiert"></entry>
		<entry key="Fotografie">Fotografie</entry>
		<entry key="Fotografie s/w">Fotografie</entry>
		<entry key="Fotomontage">Fotografie</entry>
		<entry key="Fresko">Fresko</entry>
		<entry key="gelb aquarelliert">aquarelliert</entry>
		<entry key="gelb gehöht">gehöht</entry>
		<entry key="gelblich-grau laviert">laviert</entry>
		<entry key="genäht">genäht</entry>
		<entry key="geschliffen">geschliffen</entry>
		<entry key="geschmiedet">geschmiedet</entry>
		<entry key="geschweißt">geschweißt</entry>
		<entry key="getuscht">getuscht</entry>
		<entry key="gewachst">gewachst</entry>
		<entry key="gewischt">gewischt</entry>
		<entry key="Gips">Gips</entry>
		<entry key="Gold">Gold</entry>
		<entry key="Goldbronze">Goldbronze</entry>
		<entry key="Goldbronzehöhung">Höhung</entry>
		<entry key="Goldschnitt">Goldschnitt</entry>
		<entry key="Gouache">Gouache</entry>
		<entry key="Grafit">Grafit</entry>
		<entry key="Grafit-Stift">Grafit</entry>
		<entry key="Graphit">Grafit</entry>
		<entry key="Graphitstift">Grafit</entry>
		<entry key="grau angelegt"></entry>
		<entry key="Grau laviert">laviert</entry>
		<entry key="grau und braun laviert">laviert</entry>
		<entry key="grau und gräulich braun laviert">laviert</entry>
		<entry key="grau und gräulich-braun laviert">laviert</entry>
		<entry key="grau-blau laviert">laviert</entry>
		<entry key="graubraun angelegt"></entry>
		<entry key="graue Tusche">Tusche</entry>
		<entry key="grauer Stift">Stift</entry>
		<entry key="gräulich-braun laviert">laviert</entry>
		<entry key="Griffelspuren"></entry>
		<entry key="Grisaille">Grisaille</entry>
		<entry key="größtenteils grau laviert">laviert</entry>
		<entry key="größtenteils laviert">laviert</entry>
		<entry key="grün angelegt"></entry>
		<entry key="grün aquarelliert">aquarelliert</entry>
		<entry key="Grundierung in Blau">grundiert</entry>
		<entry key="Grundierung in Bläulichgrau">grundiert</entry>
		<entry key="Grundierung in Braun">grundiert</entry>
		<entry key="Grundierung in Bräunlichgrau">grundiert</entry>
		<entry key="Grundierung in Dunkelgrau">grundiert</entry>
		<entry key="Grundierung in Grau">grundiert</entry>
		<entry key="Grundierung in Graubraun">grundiert</entry>
		<entry key="Grundierung in Graugrün">grundiert</entry>
		<entry key="Grundierung in Hellblau">grundiert</entry>
		<entry key="Grundierung in Olivgrün">grundiert</entry>
		<entry key="Grundierung in Rot">grundiert</entry>
		<entry key="Grundierung in Rötlichbraun">grundiert</entry>
		<entry key="Grundierung in Violett">grundiert</entry>
		<entry key="grün-grau laviert">laviert</entry>
		<entry key="grünlich-braun laviert">laviert</entry>
		<entry key="grünlich-grau laviert">laviert</entry>
		<entry key="gummiert">gummiert</entry>
		<entry key="Guss">Guss</entry>
		<entry key="handkoloriert">handkoloriert</entry>
		<entry key="Heliogravure">Heliogravure</entry>
		<entry key="hellbraun laviert">laviert</entry>
		<entry key="Höhung">Höhung</entry>
		<entry key="Holzschnitt">Holzschnitt</entry>
		<entry key="Holzstich">Holzstich</entry>
		<entry key="Kaltnadelradierung">Kaltnadelradierung</entry>
		<entry key="Kaseintempera">Kaseintempera</entry>
		<entry key="Kohle">Kohle</entry>
		<entry key="koloriert">koloriert</entry>
		<entry key="Kreide">Kreide</entry>
		<entry key="Kreide in Schwarz">Kreide</entry>
		<entry key="Kreidelithografie">Lithografie</entry>
		<entry key="Kreidetechnik (Crayonmanier)">Crayonmanier</entry>
		<entry key="Kugelschreiber">Kugelschreiber</entry>
		<entry key="Kugelschreiber in Rot">Kugelschreiber</entry>
		<entry key="Kunstharzfarbe"></entry>
		<entry key="Kupferoxydbraun"></entry>
		<entry key="Kupferstich">Kupferstich</entry>
		<entry key="Lack">Lack</entry>
		<entry key="laviert">laviert</entry>
		<entry key="Lavierung">laviert</entry>
		<entry key="Lavierung in Braun">laviert</entry>
		<entry key="Lavierung in Dunkelbraun">laviert</entry>
		<entry key="Lavierung in Grau">laviert</entry>
		<entry key="Lavierung in Graubraun">laviert</entry>
		<entry key="Lavierung in Hellgrau">laviert</entry>
		<entry key="Lavierung in Rosa">laviert</entry>
		<entry key="leichter Plattenton">Plattenton</entry>
		<entry key="Leim">Leim</entry>
		<entry key="Leimfarbe">Leimfarbe</entry>
		<entry key="Lichtdruck">Lichtdruck</entry>
		<entry key="Linolschnitt">Linolschnitt</entry>
		<entry key="Lithografie">Lithografie</entry>
		<entry key="Malöle"></entry>
		<entry key="Marmorsand">Granulate/Pulver/Puder</entry>
		<entry key="Materialspuren"></entry>
		<entry key="Metallstift">Metallstift</entry>
		<entry key="Mischtechnik">Mischtechnik</entry>
		<entry key="Monotypie">Monotypie</entry>
		<entry key="ockergelb aquarelliert">aquarelliert</entry>
		<entry key="Offsetlitho">Offsetlitho</entry>
		<entry key="Öl">Ölfarbe</entry>
		<entry key="Ölfarbe">Ölfarbe</entry>
		<entry key="Ölkreide">Kreide</entry>
		<entry key="Öltempera">Tempera</entry>
		<entry key="Papier, aufgeklebt">Papier</entry>
		<entry key="Papierschnitt"></entry>
		<entry key="Pastell">Pastell</entry>
		<entry key="Pastellkreide">Pastellkreide</entry>
		<entry key="Pigment">Granulate/Pulver/Puder</entry>
		<entry key="Pinsel">Pinsel</entry>
		<entry key="Pinsel in blassem Rosa">Pinsel</entry>
		<entry key="Pinsel in Blau">Pinsel</entry>
		<entry key="Pinsel in Blaugrün">Pinsel</entry>
		<entry key="Pinsel in Braun">Pinsel</entry>
		<entry key="Pinsel in Braungrau">Pinsel</entry>
		<entry key="Pinsel in bräunlichem Grau">Pinsel</entry>
		<entry key="Pinsel in Braun-Rot">Pinsel</entry>
		<entry key="Pinsel in Braunviolett">Pinsel</entry>
		<entry key="Pinsel in Deckfarben">Pinsel</entry>
		<entry key="Pinsel in Deckweiß">Pinsel</entry>
		<entry key="Pinsel in Dunkelblau">Pinsel</entry>
		<entry key="Pinsel in Dunkelbraun">Pinsel</entry>
		<entry key="Pinsel in Gelb">Pinsel</entry>
		<entry key="Pinsel in Gelbgrün">Pinsel</entry>
		<entry key="Pinsel in Gold">Pinsel</entry>
		<entry key="Pinsel in Goldbronze">Pinsel</entry>
		<entry key="Pinsel in Grau">Pinsel</entry>
		<entry key="Pinsel in Graublau">Pinsel</entry>
		<entry key="Pinsel in Graubraun">Pinsel</entry>
		<entry key="Pinsel in Grau-Grün">Pinsel</entry>
		<entry key="Pinsel in Grün">Pinsel</entry>
		<entry key="Pinsel in Hellblau">Pinsel</entry>
		<entry key="Pinsel in Hellbraun">Pinsel</entry>
		<entry key="Pinsel in Hellgrau">Pinsel</entry>
		<entry key="Pinsel in Rosa">Pinsel</entry>
		<entry key="Pinsel in Rot">Pinsel</entry>
		<entry key="Pinsel in Rotbraun">Pinsel</entry>
		<entry key="Pinsel in Rötel">Pinsel</entry>
		<entry key="Pinsel in Schwarz">Pinsel</entry>
		<entry key="Pinsel in Schwarzbraun">Pinsel</entry>
		<entry key="Pinsel in Schwarzbraun, laviert">Pinsel</entry>
		<entry key="Pinsel in Schwarzgrau">Pinsel</entry>
		<entry key="Pinsel in Sepia">Pinsel</entry>
		<entry key="Pinsel in Tusche">Pinsel</entry>
		<entry key="Pinsel in Violett">Pinsel</entry>
		<entry key="Pinsel in Weinrot">Pinsel</entry>
		<entry key="Pinsel in Weiß">Pinsel</entry>
		<entry key="Plattenton">Plattenton</entry>
		<entry key="Plinthe, verschweißt">geschweißt</entry>
		<entry key="Porzellan">Porzellan</entry>
		<entry key="Prägedruck">Prägedruck</entry>
		<entry key="Punktiermanier (Roulette)">Roulette</entry>
		<entry key="Quadrierung">Quadrierung</entry>
		<entry key="Quadrierung in Bleistift">Quadrierung</entry>
		<entry key="Quadrierung in schwarzer Kreide">Quadrierung</entry>
		<entry key="radiert">Radierung</entry>
		<entry key="Radierung">Radierung</entry>
		<entry key="Rohrfeder in Tusche">Feder</entry>
		<entry key="rosa aquarelliert">aquarelliert</entry>
		<entry key="rosa gehöht">gehöht</entry>
		<entry key="rosa laviert">laviert</entry>
		<entry key="rosa-braun laviert">laviert</entry>
		<entry key="rosa-grau laviert">laviert</entry>
		<entry key="rot aquarelliert">aquarelliert</entry>
		<entry key="rot gehöht">gehöht</entry>
		<entry key="rotbraune Kreide">Kreide</entry>
		<entry key="rote Kreide">Kreide</entry>
		<entry key="rote Tusche">Tusche</entry>
		<entry key="Rötel">Rötel</entry>
		<entry key="rötlich aquarelliert">aquarelliert</entry>
		<entry key="Roulette">Roulette</entry>
		<entry key="Sand">Granulate/Pulver/Puder</entry>
		<entry key="Sand, aufgestreut">Granulate/Pulver/Puder</entry>
		<entry key="Schabkunst (Mezzotinto)">Mezzotinto</entry>
		<entry key="schwarz aquarelliert">aquarelliert</entry>
		<entry key="schwarze Kreide">Kreide</entry>
		<entry key="schwarze Kreide (?)">Kreide</entry>
		<entry key="schwarze Tusche">Tusche</entry>
		<entry key="schwarzer Stift">Stift</entry>
		<entry key="schwärzlich-braun laviert">laviert</entry>
		<entry key="Schwefel">Granulate/Pulver/Puder</entry>
		<entry key="Sepiatusche">Tusche</entry>
		<entry key="Siebdruck">Siebdruck</entry>
		<entry key="Silberbronzehöhung">Höhung</entry>
		<entry key="Stahlstich">Stahlstich</entry>
		<entry key="stellenweise farbig aquarelliert">aquarelliert</entry>
		<entry key="stellenweise gewischt">gewischt</entry>
		<entry key="stellenweise grau laviert">laviert</entry>
		<entry key="stellenweise radiert">Radierung</entry>
		<entry key="stellenweise violett aquarelliert">aquarelliert</entry>
		<entry key="Stempel">Stempel</entry>
		<entry key="Stich"></entry>
		<entry key="Stipple">Stipple</entry>
		<entry key="Strichätzung">Radierung</entry>
		<entry key="Strichplatte, schwarz"></entry>
		<entry key="teilweise aquarelliert">aquarelliert</entry>
		<entry key="teilweise braun laviert">laviert</entry>
		<entry key="teilweise gelblich-grau laviert">laviert</entry>
		<entry key="teilweise grau laviert">laviert</entry>
		<entry key="teilweise gräulich-braun laviert">laviert</entry>
		<entry key="teilweise grün-gelblich aquarlliert">aquarelliert</entry>
		<entry key="teilweise gummiert">gummiert</entry>
		<entry key="teilweise laviert">laviert</entry>
		<entry key="Tempera">Tempera</entry>
		<entry key="Tonplatte">Plattenton</entry>
		<entry key="Tönung in Grau">Tönung</entry>
		<entry key="Tönung in Rot">Tönung</entry>
		<entry key="Tusche">Tusche</entry>
		<entry key="Tusche, farbig">Tusche</entry>
		<entry key="Tuschfeder">Tuschfeder</entry>
		<entry key="Tuschpinsel">Tuschpinsel</entry>
		<entry key="violett laviert">laviert</entry>
		<entry key="violette Kreide">Kreide</entry>
		<entry key="violett-grau laviert">laviert</entry>
		<entry key="Vorzeichnung">Zeichnung</entry>
		<entry key="Vorzeichnung in Graphitstift">Zeichnung</entry>
		<entry key="Vorzeichnung in Rötel">Zeichnung</entry>
		<entry key="Vorzeichnung in Stift">Zeichnung</entry>
		<entry key="Wachs">Wachs</entry>
		<entry key="Wasserfarben">Wasserfarben</entry>
		<entry key="Weichgrundätzung (Vernis-mou)">Vernis-mou</entry>
		<entry key="Weiß"></entry>
		<entry key="weiß gehöht">gehöht</entry>
		<entry key="weiße Kreide">Kreide</entry>
		<entry key="weißer Kreidegrund">grundiert</entry>
		<entry key="Weißhöhung">Höhung</entry>
		<entry key="Zeichnung">Zeichnung</entry>
		<entry key="Zinklithografie">Lithografie</entry>
		<entry key="zweifarbig"></entry>
	</my:technik>

	<xsl:template match="/">
		<xsl:apply-templates select="OBJECTS/OBJECT" />
	</xsl:template>

	<xsl:template match="OBJECT">
		<add>
			<doc>
				<field name="id">
					<xsl:value-of select="./IMDAS_ID" />
				</field>
				<field name="coll">
					<xsl:value-of select="./COLL_OBJ/SAMMLUNG" />
				</field>
				<field name="display">browse</field>
				<field name="a_kuenstler">
					<xsl:apply-templates select="PERSON" mode="kuenstler" />
				</field>
				<field name="a_person">
					<xsl:apply-templates select="PERSON" mode="person" />
				</field>				
				<field name="a_lebensdaten">
					<xsl:call-template name="lebensdaten" />
				</field>
				<field name="a_titel">
					<xsl:value-of select="./REAL_OBJ/OBJEKTTITEL" />
				</field>
				<field name="a_entstehungszeit">
					<xsl:value-of select="./OBJ_SPECIALS/ENTSTEHUNGSZEIT" />
				</field>
				<field name="a_technik">
					<xsl:call-template name="technik" />
				</field>
				<field name="a_material">
					<xsl:call-template name="material" />
				</field>
				<field name="a_masse">
					<xsl:call-template name="masse" />
				</field>
				<field name="a_inventarnummer">
					<xsl:value-of select="./INVENTARNUMMER" />
				</field>
				<field name="a_gliederung">
					<xsl:value-of select="./TERM/SAMMLUNGSGLIEDERUNG" />
				</field>
				<field name="katalogtext">
					<xsl:value-of select="./KATALOGTEXT" />
				</field>

				<xsl:apply-templates select="STOR_LOC[contains(BILDBEZEICHNUNG, '[DK BSZ=')]" >
					<xsl:sort select="number(substring-before(substring-after(BILDBEZEICHNUNG, '[DK BSZ='),']'))"></xsl:sort>
				</xsl:apply-templates>
				
				<field name="s_person">
					<xsl:apply-templates select="PERSON" mode="person" />
				</field>				
				<field name="s_titel">
					<xsl:value-of select="./REAL_OBJ/OBJEKTTITEL" />
				</field>				
				<field name="s_material">
					<xsl:call-template name="material" />
				</field>				
				<field name="s_technik">
					<xsl:call-template name="technik" />
				</field>				
				<field name="s_inventarnummer">
					<xsl:value-of select="./INVENTARNUMMER" />
				</field>				
				<field name="s_coll">
					<xsl:value-of select="./COLL_OBJ/SAMMLUNG" />
				</field>
				<field name="s_gliederung">
					<xsl:value-of select="./TERM/SAMMLUNGSGLIEDERUNG" />
				</field>
				
				<field name="x_coll">
					<xsl:value-of select="./COLL_OBJ/SAMMLUNG" />
				</field>

				<xsl:apply-templates select="PERSON"
					mode="x_person" />

				<field name="x_titel">
					<xsl:value-of select="./REAL_OBJ/OBJEKTTITEL" />
				</field>

				<xsl:apply-templates select="./TERM/TECHNIK" mode="x_technik" />

				<xsl:apply-templates select="./TERM/MATERIAL" mode="x_material" />

				<field name="x_inventarnummer">
					<xsl:value-of select="./INVENTARNUMMER" />
				</field>
				
				<field name="x_gliederung">
					<xsl:value-of select="./TERM/SAMMLUNGSGLIEDERUNG" />
				</field>

			</doc>
		</add>

	</xsl:template>

	<xsl:template name="lebensdaten">
		<xsl:variable name="anfang">
			<xsl:call-template name="extractYear">
				<xsl:with-param name="datum">
					<xsl:value-of select="GEBURTSDATUM_KUENSTLER" />
					<xsl:value-of select="OBJECT/GEBURTSDATUM_KUENSTLER" />
				</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="ende">
			<xsl:call-template name="extractYear">
				<xsl:with-param name="datum">
					<xsl:value-of select="STERBEDATUM_KUENSTLER" />
					<xsl:value-of select="OBJECT/STERBEDATUM_KUENSTLER" />
				</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<xsl:if test="(string-length($anfang) > 0) and (string-length($ende) = 0)">
			<xsl:text>*</xsl:text>
		</xsl:if>
		<xsl:value-of select="$anfang" />
		<xsl:if test="(string-length($anfang) > 0) and (string-length($ende) > 0)">
			<xsl:text> - </xsl:text>
		</xsl:if>
		<xsl:value-of select="$ende" />
	</xsl:template>

	<xsl:template name="masse">
		<xsl:variable name="sammlung">
			<xsl:value-of select="./COLL_OBJ/SAMMLUNG" />
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$sammlung = 'Kupferstichkabinett'">
				<xsl:if test="OBJ_VALUE[OBJEKTTEIL = 'Blatt']">
					<xsl:text>Blatt: </xsl:text>
					<xsl:apply-templates select="OBJ_VALUE[OBJEKTTEIL = 'Blatt']" />
				</xsl:if>
				<xsl:if test="OBJ_VALUE[OBJEKTTEIL = 'Platte']">
					<xsl:text>Platte: </xsl:text>
					<xsl:apply-templates select="OBJ_VALUE[OBJEKTTEIL = 'Platte']" />
				</xsl:if>
				<xsl:if test="OBJ_VALUE[OBJEKTTEIL = 'Darstellung']">
					<xsl:text>Darstellung: </xsl:text>
					<xsl:apply-templates select="OBJ_VALUE[OBJEKTTEIL = 'Darstellung']" />
				</xsl:if>
				<xsl:if test="OBJ_VALUE[OBJEKTTEIL = 'Trägerkarton']">
					<xsl:text>Trägerkarton: </xsl:text>
					<xsl:apply-templates select="OBJ_VALUE[OBJEKTTEIL = 'Trägerkarton']" />
				</xsl:if>
				<xsl:apply-templates select="OBJ_VALUE[not(OBJEKTTEIL)]" />
			</xsl:when>
			<xsl:when
				test="$sammlung = 'Neue Malerei (nach 1800)' or $sammlung = 'Alte Malerei (vor 1800)'">
				<xsl:if
					test="count(OBJ_VALUE[OBJEKTTEIL = 'Bildträger' and UNIT_NAME = 'Breite']) &lt; 2 and count(OBJ_VALUE[OBJEKTTEIL = 'Bildträger' and UNIT_NAME = 'Länge']) &lt; 2 or (count(OBJ_VALUE[OBJEKTTEIL = 'Bildträger' and UNIT_NAME = 'Tiefe']) &lt; 2) and (count(OBJ_VALUE[OBJEKTTEIL = 'Bildträger' and UNIT_NAME = 'Höhe']) &lt; 2) and (count(OBJ_VALUE[OBJEKTTEIL = 'Bildträger' and UNIT_NAME = 'Durchmesser']) &lt; 2)">
					<xsl:apply-templates select="OBJ_VALUE[OBJEKTTEIL = 'Bildträger']" />
				</xsl:if>
			</xsl:when>
			<xsl:when test="$sammlung = 'Plastik'">
				<xsl:if
					test="count(OBJ_VALUE[UNIT_NAME = 'Breite']) &lt; 2 and count(OBJ_VALUE[UNIT_NAME = 'Länge']) &lt; 2 or (count(OBJ_VALUE[UNIT_NAME = 'Tiefe']) &lt; 2) and (count(OBJ_VALUE[UNIT_NAME = 'Höhe']) &lt; 2) and (count(OBJ_VALUE[UNIT_NAME = 'Durchmesser']) &lt; 2)">
					<xsl:apply-templates select="OBJ_VALUE" />
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:message>
					<xsl:value-of select="$sammlung" />
				</xsl:message>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="OBJ_VALUE">
		<xsl:if test="not(OBJEKTTEIL) or (OBJEKTTEIL != 'Rahmen') and (OBJEKTTEIL != 'Keilrahmen')">
			<xsl:if test="position() != 1" >				
				<xsl:text>; </xsl:text>
			</xsl:if>
			<xsl:value-of select="UNIT_NAME" />
			<xsl:text>&#160;</xsl:text>
			<xsl:value-of select="VALUE" />
			<xsl:text>&#160;</xsl:text>
			<xsl:value-of select="UNIT" />
		</xsl:if>
	</xsl:template>

	<xsl:template match="STOR_LOC">
		<xsl:if test="contains(BILDBEZEICHNUNG, '[DK BSZ=')">
			<field name="image">
				<xsl:value-of select="substring(BILDPFAD, 4)" />
			</field>
		</xsl:if>
	</xsl:template>

	<xsl:template match="PERSON" mode="kuenstler">
		<xsl:if test="position() != 1">
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:value-of select="./VORNAME" />
		<xsl:text> </xsl:text>
		<xsl:value-of select="./NACHNAME" />
	</xsl:template>

	<xsl:template match="PERSON" mode="person">
		<xsl:if test="position() != 1">
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:value-of select="./NACHNAME" />
		<xsl:text>, </xsl:text>
		<xsl:value-of select="./VORNAME" />
	</xsl:template>

	<xsl:template match="PERSON" mode="x_person">
		<field name="x_person">
			<xsl:value-of select="./NACHNAME" />
			<xsl:text>, </xsl:text>
			<xsl:value-of select="./VORNAME" />
		</field>
	</xsl:template>
	
	<xsl:template name="technik">
		<xsl:call-template name="unique">
			<xsl:with-param name="ndes" select="./TERM/TECHNIK" />
			<xsl:with-param name="result" select="''"/>
		</xsl:call-template>		
	</xsl:template>

	<xsl:template match="TECHNIK" mode="x_technik">
		<xsl:variable name="technik" select="." />
		<field name="x_technik">
			<xsl:value-of select="document('')/*/my:technik/entry[@key=$technik]" />
		</field>
	</xsl:template>
	
	<xsl:template name="material">
		<xsl:call-template name="unique">
			<xsl:with-param name="ndes" select="./TERM/MATERIAL" />
			<xsl:with-param name="result" select="''"/>
		</xsl:call-template>	
	</xsl:template>
	
	<xsl:template name="unique" >
		<xsl:param name="ndes" />
		<xsl:param name="result" />	
		<xsl:choose>
			<xsl:when test="$ndes">
				<xsl:variable name="src" select="$ndes[1]" />			
				<xsl:choose>
					<xsl:when test="contains($result, $src)">
						<xsl:call-template name="unique">
							<xsl:with-param name="ndes" select="$ndes[position() > 1]" />
							<xsl:with-param name="result" select="$result"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="unique">
							<xsl:with-param name="ndes" select="$ndes[position() > 1]" />
							<xsl:with-param name="result">
								<xsl:choose>
									<xsl:when test="$result">
										<xsl:value-of select="concat(concat($result, '; '), $src)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$src" />
									</xsl:otherwise>
								</xsl:choose>								
							</xsl:with-param>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$result" />
			</xsl:otherwise>
		</xsl:choose>				
	</xsl:template>
	
	<xsl:template name="mapUnique" >
		<xsl:param name="ndes" />
		<xsl:param name="result" />
		<xsl:param name="map" />		
		<xsl:choose>
			<xsl:when test="$ndes">
				<xsl:variable name="src" select="$ndes[1]" />
				<xsl:variable name="trg" select="$map/entry[@key=$src]" />				
				<xsl:choose>
					<xsl:when test="contains($result, $trg)">
						<xsl:call-template name="mapUnique">
							<xsl:with-param name="ndes" select="$ndes[position() > 1]" />
							<xsl:with-param name="result" select="$result"/>
							<xsl:with-param name="map" select="$map" />
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="mapUnique">
							<xsl:with-param name="ndes" select="$ndes[position() > 1]" />
							<xsl:with-param name="result">
								<xsl:choose>
									<xsl:when test="$result">
										<xsl:value-of select="concat(concat($result, '; '), $trg)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$trg" />
									</xsl:otherwise>
								</xsl:choose>								
							</xsl:with-param>
							<xsl:with-param name="map" select="$map" />
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$result" />
			</xsl:otherwise>
		</xsl:choose>				
	</xsl:template>

	<xsl:template match="MATERIAL" mode="x_material">
		<xsl:variable name="material" select="." />
		<field name="x_material">
			<xsl:value-of select="document('')/*/my:material/entry[@key=$material]" />
		</field>
	</xsl:template>

</xsl:stylesheet>