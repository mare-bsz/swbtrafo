<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"	
	xmlns:java="http://xml.apache.org/xalan/java"
	xmlns:my="http://swbexpo.bsz-bw.de"
    exclude-result-prefixes="java my"
    >
	
	<xsl:import href="../conv2sap.xsl" />
		
	<!--
		XSL zur Verarbeitung von XML-Exporten des Staatlichen Naturkundemuseum Karlsruhe
		
		@version: 1
		@created: 2014-09-01
		@author: Christof Mainberger, christof.mainberger@bsz-bw.de
		
		Abgeleitet aus em LIM-Template
		2015-01-27
			-Schätzwert ausgeschlossen
		 
	-->	
	
	<my:map>
		<entry key="SAP-RT_0067">E-Lep 67 Smetacek 1977</entry>
		<entry key="SAP-RT_0068">E-Lep 68 Smetacek 1977</entry>
		<entry key="SAP-RT_0069">E-Lep 69 Küppers 1977</entry>
		<entry key="SAP-RT_0070">E-Lep 70 Küppers 1977</entry>
		<entry key="SAP-RT_0071">E-Lep 71 Kudrna (Portsmouth) 1977-1982</entry>
		<entry key="SAP-RT_0072">E-Lep 72 Diehl 1977</entry>
		<entry key="SAP-RT_0073">E-Lep 73 Küppers 1977</entry>
		<entry key="SAP-RT_0074">E-Lep 74 Smetacek 1977</entry>
		<entry key="SAP-HH_0003">Taxonomische Belegsammlung Amblypgi, digitalisiert (SMNK-AMBLY)</entry>
		<entry key="SAP-HH_0004">Taxonomische Belegsammlung Opiliones, digitalisiert (SMNK-OPIL)</entry>
		<entry key="SAP-HH_0005">Taxonomische Belegsammlung Pseudoscorpiones, digitalisiert (SMNK-PSEUD)</entry>
		<entry key="SAP-HH_0006">Taxonomische Belegsammlung Ricinulei, digitalisiert (SMNK-RICI)</entry>
		<entry key="SAP-HH_0007">Taxonomische Belegsammlung Schizomida, digitalisiert (SMNK-SCHIZ)</entry>
		<entry key="SAP-HH_0008">Taxonomische Belegsammlung Scorpiones, digitalisiert (SMNK-SCORP)</entry>
		<entry key="SAP-HH_0010">Taxonomische Belegsammlung Thelyphonida, digitalisiert (SMNK-THELY)</entry>
		<entry key="SAP-HH_0009">Taxonomische Belegsammlung Solifugae, digitalisiert (SMNK-SOLI)</entry>
		<entry key="SAP-INSA_01">Insektensaal</entry>
		<entry key="SAP-RT_0002">E-Lep 2 Dr. Müller 1961</entry>
		<entry key="SAP-RT_0003">E-Lep 3 Gremminger 1960</entry>
		<entry key="SAP-RT_0004">E-Lep 4 Sälzl jun. 1964</entry>
		<entry key="SAP-RT_0005">E-Lep 5 Reich 1964</entry>
		<entry key="SAP-RT_0006">E-Lep 6 Kabis 1913</entry>
		<entry key="SAP-RT_0007">E-Lep 7 Hanauer 1944(?)</entry>
		<entry key="SAP-RT_0008">E-Lep 8 Zerkowitz 1926(?)</entry>
		<entry key="SAP-RT_0009">E-Lep 9 Mees 1915</entry>
		<entry key="SAP-RT_0010">E-Lep 10 Bischoff &lt;Eingangsdatum&gt;</entry>
		<entry key="SAP-RT_0011">E-Lep 11 Brunkhorst 1957</entry>
		<entry key="SAP-RT_0012">E-Lep 12 Reutti 1895</entry>
		<entry key="SAP-RT_0013">E-Lep 13 Holz 1916</entry>
		<entry key="SAP-RT_0014">E-Lep 14 Wandres 1900(?)</entry>
		<entry key="SAP-RT_0015">E-Lep 15 Alte Hauptsammlung 1918-1938</entry>
		<entry key="SAP-RT_0016">E-Lep 16 Kleinere sammlungen und Doubletten 1964(?)</entry>
		<entry key="SAP-RT_0017">E-Lep 17 Sammelausbeuten und Centurien 1963/1964</entry>
		<entry key="SAP-RT_0018">E-Lep 18 Müting 1965</entry>
		<entry key="SAP-RT_0019">E-Lep 19 Sammelausbeuten und Centurien 1966-1968</entry>
		<entry key="SAP-RT_0020">E-Lep 20 Johann(es) Klapperich 1965</entry>
		<entry key="SAP-RT_0021">E-Lep 21 Johann(es) Klapperich 1966</entry>
		<entry key="SAP-RT_0022">E-Lep 22 Ebert, Müller 1966-1969</entry>
		<entry key="SAP-RT_0023">E-Lep 23 Ebert 1969</entry>
		<entry key="SAP-RT_0024">E-Lep 24 P.Henriot 1966</entry>
		<entry key="SAP-RT_0025">E-Lep 25 P.Henriot 1966</entry>
		<entry key="SAP-RT_0026">E-Lep 26 Strobel 1970</entry>
		<entry key="SAP-RT_0027">E-Lep 27 Wagner 1970</entry>
		<entry key="SAP-RT_0028">E-Lep 28 Lienig 1973</entry>
		<entry key="SAP-RT_0029">E-Lep 29 Fehrenbach 1971</entry>
		<entry key="SAP-RT_0030">E-Lep 30 Froitzheim 1971</entry>
		<entry key="SAP-RT_0031">E-Lep 31 Schausammlung 1969</entry>
		<entry key="SAP-RT_0032">E-Lep 32 Bender 1969</entry>
		<entry key="SAP-RT_0033">E-Lep 33 Bender 1974</entry>
		<entry key="SAP-RT_0034">E-Lep 34 Razowski 1974</entry>
		<entry key="SAP-RT_0035">E-Lep 35 Ebert, Naumann 1971</entry>
		<entry key="SAP-RT_0036">E-Lep 36 Boursin 1966</entry>
		<entry key="SAP-RT_0037">E-Lep 37 Noack 1972</entry>
		<entry key="SAP-RT_0038">E-Lep 38 Höne 1972</entry>
		<entry key="SAP-RT_0039">E-Lep 39 Brand, Richter, Schick 1974</entry>
		<entry key="SAP-RT_0040">E-Lep 40 Küppers 1974</entry>
		<entry key="SAP-RT_0041">E-Lep 41 Ohshima 1974</entry>
		<entry key="SAP-RT_0042">E-Lep 42 Bauer 1974</entry>
		<entry key="SAP-RT_0043">E-Lep 43 Smetacek 1974-1976</entry>
		<entry key="SAP-RT_0044">E-Lep 44 Diehl, Krikken, Küppers, Roesler 1976</entry>
		<entry key="SAP-RT_0045">E-Lep 45 Kleine Sammelausbeuten 1968-1974</entry>
		<entry key="SAP-RT_0046">E-Lep 46 Roesler 1974</entry>
		<entry key="SAP-RT_0075">E-Lep 75 Küppers 1977</entry>
		<entry key="SAP-RT_0076">E-Lep 76 Kühnert 1977</entry>
		<entry key="SAP-RT_0077">E-Lep 77 Küppers 1977</entry>
		<entry key="SAP-RT_0078">E-Lep 78 Dürr 1977-1980</entry>
		<entry key="SAP-RT_0079">E-Lep 79 Johann(es) Klapperich 1977</entry>
		<entry key="SAP-RT_0080">E-Lep 80 Küppers 1977</entry>
		<entry key="SAP-RT_0081">E-Lep 81 Larsen via Kudrna (Portsmouth) 1977</entry>
		<entry key="SAP-RT_0082">E-LEp 82 Bauer 1977</entry>
		<entry key="SAP-RT_0083">E-Lep 83 Küppers 1977</entry>
		<entry key="SAP-RT_0084">E-Lep 84 Küppers 1977</entry>
		<entry key="SAP-RT_0085">E-Lep 85 Singh 1979</entry>
		<entry key="SAP-RT_0086">E-Lep 86 Richter 1977</entry>
		<entry key="SAP-RT_0087">E-Lep 87 Küppers 1978</entry>
		<entry key="SAP-RT_0088">E-Lep 88 Dr. Steuer 1978</entry>
		<entry key="SAP-RT_0089">E-Lep 89 Heidelberger 1978</entry>
		<entry key="SAP-RT_0090">E-Lep 90 Kocak 1978</entry>
		<entry key="SAP-RT_0091">E-Lep 91 Tarmann 1978</entry>
		<entry key="SAP-RT_0092">E-Lep 92 Dr. Schlusche 1978</entry>
		<entry key="SAP-RT_0120">E-Lep 120 Schneider 1979</entry>
		<entry key="SAP-RT_0121">E-Lep 121 Singh 1980</entry>
		<entry key="SAP-RT_0122">E-Lep 122 Vollmer, 1980</entry>
		<entry key="SAP-RT_0123">E-Lep 123 Kocak 1980</entry>
		<entry key="SAP-RT_0124">E-Lep 124 Roesler, Küppers 1980</entry>
		<entry key="SAP-RT_0125">E-Lep 125 Schneider, 1980</entry>
		<entry key="SAP-RT_0126">E-Lep 126 Ebert 1977-1979</entry>
		<entry key="SAP-RT_0127">E-Lep 127 Süsse 1980</entry>
		<entry key="SAP-RT_0128">E-Lep 128 Kocak 1980</entry>
		<entry key="SAP-RT_0129">E-Lep 129 Beck 1980</entry>
		<entry key="SAP-RT_0130">E-Lep 130 Bauer, Traub 1980</entry>
		<entry key="SAP-RT_0131">E-Lep 131 Singh 1980</entry>
		<entry key="SAP-RT_0132">E-Lep 132 Junge 1980</entry>
		<entry key="SAP-RT_0133">E-Lep 133 Smetacek 1980</entry>
		<entry key="SAP-RT_0134">E-Lep 134 Kudrna (Portsmouth) 1980</entry>
		<entry key="SAP-RT_0135">E-Lep 135 Bauer 1980</entry>
		<entry key="SAP-RT_0136">E-Lep 136 Ebert 1980</entry>
		<entry key="SAP-RT_0137">E-Lep 137 Meineke 1980</entry>
		<entry key="SAP-RT_0138">E-Lep 138 Chua, Traub 1981</entry>
		<entry key="SAP-RT_0139">E-Lep 139 Heidelberger 1981</entry>
		<entry key="SAP-RT_0140">E-Lep 140 Ebert 1980</entry>
		<entry key="SAP-RT_0141">E-Lep 141 Naturhistorisches Museum Budapest 1981</entry>
		<entry key="SAP-RT_0142">E-Lep 142 Eckweiler 1981</entry>
		<entry key="SAP-RT_0143">E-Lep 143 Küppers 1981</entry>
		<entry key="SAP-RT_0144">E-Lep 144 Herrmann 1981</entry>
		<entry key="SAP-RT_0145">E-Lep 145 Roesler 1981</entry>
		<entry key="SAP-RT_0146">E-Lep 146 Partenscky 1981</entry>
		<entry key="SAP-RT_0147">E-Lep 147 Schüller 1981</entry>
		<entry key="SAP-RT_0148">E-Lep 148 C.C.Chua 1981</entry>
		<entry key="SAP-RT_0149">E-Lep 149 Hofmann 1981</entry>
		<entry key="SAP-RT_0150">E-Lep 150 Kleine Sammelausbeuten und Einzelstücke 1977-1986</entry>
		<entry key="SAP-RT_0047">E-Lep 47 Ebert et al. 1969-1975</entry>
		<entry key="SAP-RT_0048">E-Lep 48 Amsel 1975</entry>
		<entry key="SAP-RT_0049">E-Lep 49 Ebert 1980</entry>
		<entry key="SAP-RT_0050">E-Lep 50 Roessler 1975</entry>
		<entry key="SAP-RT_0051">E-Lep 51 Müller 1975</entry>
		<entry key="SAP-RT_0052">E-Lep 52 Roesler 1975</entry>
		<entry key="SAP-RT_0053">E-Lep 53 Ohshima 1976</entry>
		<entry key="SAP-RT_0054">E-Lep 54 Reisser 1974</entry>
		<entry key="SAP-RT_0055">E-Lep 55 Naumann 1976</entry>
		<entry key="SAP-RT_0056">E-Lep 56 Thomas 1976</entry>
		<entry key="SAP-RT_0057">E-Lep 57 Bauer 1976</entry>
		<entry key="SAP-RT_0058">E-Lep 58 Johann(es) Klapperich 1976</entry>
		<entry key="SAP-RT_0059">E-Lep 59 C.Wyatt 1976</entry>
		<entry key="SAP-RT_0060">E-Lep 60 Baduk Wankhar 1976</entry>
		<entry key="SAP-RT_0061">E-Lep 61 Küppers 1976</entry>
		<entry key="SAP-RT_0062">E-Lep 62 Roesler, Küppers 1976</entry>
		<entry key="SAP-RT_0063">E-Lep 63 Diehl 1977</entry>
		<entry key="SAP-RT_0064">E-Lep 64 Bauer 1977</entry>
		<entry key="SAP-RT_0065">E-Lep 65 Smetacek 1977</entry>
		<entry key="SAP-RT_0066">E-Lep 66 Smetacek 1977</entry>
		<entry key="SAP-RT_0093">E-Lep 93 Kocak 1978</entry>
		<entry key="SAP-RT_0094">E-Lep 94 Kudrna (Portsmouth) 1978</entry>
		<entry key="SAP-RT_0095">E-Lep 95 Diehl 1978</entry>
		<entry key="SAP-RT_0096">E-Lep 96 Bauer 1978</entry>
		<entry key="SAP-RT_0097">E-Lep 97 Kudrna (Portsmouth) 1978</entry>
		<entry key="SAP-RT_0098">E-Lep 98 Schneider 1978</entry>
		<entry key="SAP-RT_0099">E-Lep 99 Küppers 1978</entry>
		<entry key="SAP-RT_0100">E-Lep 100 Schneider 1978</entry>
		<entry key="SAP-RT_0101">E-Lep 101 Dürr 1978</entry>
		<entry key="SAP-RT_0102">E-Lep 102 Roessler 1978</entry>
		<entry key="SAP-RT_0103">E-Lep 103 Heidelberger 1980</entry>
		<entry key="SAP-RT_0104">E-Lep 104 Uni Heidelberg 1979</entry>
		<entry key="SAP-RT_0105">E-Lep 105 Bauer 1979</entry>
		<entry key="SAP-RT_0106">E-Lep 106 Schneider 1979</entry>
		<entry key="SAP-RT_0107">E-Lep 107 Kudrna (Portsmouth) 1979</entry>
		<entry key="SAP-RT_0108">E-Lep 108 Schiller 1979</entry>
		<entry key="SAP-RT_0109">E-Lep 109 Diehl 1979</entry>
		<entry key="SAP-RT_0110">E-Lep 110 Ohshima 1979</entry>
		<entry key="SAP-RT_0111">E-Lep 111 Kocak 1979</entry>
		<entry key="SAP-RT_0112">E-Lep 112 R. Bender 1979</entry>
		<entry key="SAP-RT_0113">E-Lep 113 Amsel 1979</entry>
		<entry key="SAP-RT_0114">E-Lep 114 Arenberger 1979</entry>
		<entry key="SAP-RT_0115">E-Lep 115 Kudrna (Portsmouth) 1979</entry>
		<entry key="SAP-RT_0116">E-Lep 116 Schneider 1979</entry>
		<entry key="SAP-RT_0117">E-Lep 117 Bauer 1979</entry>
		<entry key="SAP-RT_0001">E-Lep 1 M.Daub 1917</entry>
		<entry key="SAP-HH_0001">Taxonomische Belegsammlung Spinnen, digitalisiert (SMNK-ARA)</entry>
		<entry key="SAP-HH_0002">Ökologische Belegsammlung Spinnen, digitalisiert (SMNK-STUD)</entry>
		<entry key="SAP-MS_0001">Taxonomische Belegsammlung Pilze digitalisiert</entry>
		<entry key="SAP-MS_0002">Taxonomische Belegsammlung Pilze nicht digitalisiert</entry>
		<entry key="SAP-MS_0003">nicht wissenschaftliche Belege (Pilze)</entry>
		<entry key="SAP-MS_0004">taxonomische Belegsammlung Algen nicht digitalisiert</entry>
		<entry key="SAP-RT_0118">E-Lep 118 Sieder 1971</entry>
		<entry key="SAP-RT_0119">E-Lep 119 Ebert 1977-78</entry>
		<entry key="SAP-RT_0151">E-Lep 151 Schintlmeister 1980</entry>
		<entry key="SAP-RT_0152">E-Lep 152 Junge 1986</entry>
		<entry key="SAP-RT_0153">E-Lep 153 Heidelberger 1982</entry>
		<entry key="SAP-RT_0154">E-Lep 154 Ebert/Traub Biotopkartierung 1981</entry>
		<entry key="SAP-RT_0155">E-Lep 155 Ebert/Traub 1981</entry>
		<entry key="SAP-RT_0156">E-Lep 156 Roesler 1982</entry>
		<entry key="SAP-RT_0157">E-Lep 157 Kocac 1982</entry>
		<entry key="SAP-RT_0158">E-Lep 158 Heidelberger 1982 - 1983</entry>
		<entry key="SAP-RT_0159">E-Lep 159 Belter 1982</entry>
		<entry key="SAP-RT_0160">E-Lep 160 Tröger 1983</entry>
		<entry key="SAP-RT_0161">E-Lep 161 Biokartierung Ebert/Traub 1982</entry>
		<entry key="SAP-RT_0162">E-Lep 162 Pekarsky 1983</entry>
		<entry key="SAP-RT_0163">E-Lep 163 Heidelberger 1984</entry>
		<entry key="SAP-RT_0164">E-Lep 164 Verhaagh 1983 - 1984</entry>
		<entry key="SAP-RT_0165">E-Lep 165 Richter 1983</entry>
		<entry key="SAP-RT_0168">E-Lep 168 Traub 1984</entry>
		<entry key="SAP-RT_0169">E-Lep 169 Biebinger 1984</entry>
		<entry key="SAP-RT_0170">E-Lep 170 Heidelberger 1985</entry>
		<entry key="SAP-RT_0171">E-Lep 171 Ebert 1983-1985</entry>
		<entry key="SAP-RT_0172">E-Lep 172 Kaisila 1985</entry>
		<entry key="SAP-RT_0174">E-Lep 174 Heidelberg 1985</entry>
		<entry key="SAP-RT_0175">E-Lep 175 Hoegh-Guldberg 1986</entry>
		<entry key="SAP-RT_0176">E-Lep 176 Kocak 1986</entry>
		<entry key="SAP-RT_0177">E-Lep 177 Heidelberger 1986</entry>
		<entry key="SAP-RT_0178">E-Lep 178 Hesselbarth 1987</entry>
		<entry key="SAP-RT_0179">E-Lep 179 Heidelberger 1987 - 1988</entry>
		<entry key="SAP-RT_0180">E-Lep 180 Roesler 1988</entry>
		<entry key="SAP-RT_0181">E-Lep 181 Fa. Lörcher 1988</entry>
		<entry key="SAP-RT_0182">E-Lep 182 Heidelberger 1988</entry>
		<entry key="SAP-RT_0183">E-Lep 183 Heidelberger 1989</entry>
		<entry key="SAP-RT_0184">E-Lep 184 Heidelberger 1989</entry>
		<entry key="SAP-RT_0186">E-Lep 186 Bodeneck 1989</entry>
		<entry key="SAP-RT_0187">E-Lep 187 Heidelberger 1989</entry>
		<entry key="SAP-RT_0188">E-Lep 188 Staib 1990</entry>
		<entry key="SAP-RT_0189">E-Lep 189 Kiefer 1990</entry>
		<entry key="SAP-RT_0190">E-Lep 190 Heidelberger 1990</entry>
		<entry key="SAP-RT_0191">E-Lep 191 Wagner 1992</entry>
		<entry key="SAP-RT_0192">E-Lep 192 Fritz 1992</entry>
		<entry key="SAP-RT_0193">E-Lep 193 Bauer 1994</entry>
		<entry key="SAP-RT_0194">E-Lep 194 Biebinger 1997</entry>
		<entry key="SAP-RT_0195">E-Lep 195 Engelhardt 1995</entry>
		<entry key="SAP-RT_0196">E-Lep 196 Rausch 1998</entry>
		<entry key="SAP-RT_0197">E-Lep 197 W.Bender 1998</entry>
		<entry key="SAP-RT_0198">E-Lep 198 Schulte 2000</entry>
		<entry key="SAP-RT_0199">E-Lep 199 Calmes 2000</entry>
		<entry key="SAP-RT_0200">E-Lep 200 Staib 2001</entry>
		<entry key="SAP-RT_0201">E-Lep 201 Riegelbauer 2001?</entry>
		<entry key="SAP-RT_0202">E-Lep 202 Ehmann 2002</entry>
		<entry key="SAP-RT_0203">E-Lep 203 Klaus Jäckel 2002</entry>
		<entry key="SAP-RT_0204">E-Lep 204 Dr. Jörg Spelda 2002</entry>
		<entry key="SAP-RT_0205">E-Lep 205 Reinhard Sutter 2003</entry>
		<entry key="SAP-RT_0206">E-Lep 206 Thomas Marktanner 2003</entry>
		<entry key="SAP-RT_0207">E-Lep 207 Günter Baisch 2003</entry>
		<entry key="SAP-RT_0208">E-Lep 208 Ulrich Reber 2003</entry>
		<entry key="SAP-RT_0209">E-Lep 209 Clas M ./ Naumann 2004</entry>
		<entry key="SAP-RT_0210">E-Lep 210 Seipel 2004</entry>
		<entry key="SAP-RT_0211">E-Lep 211 R. Trusch 2004</entry>
		<entry key="SAP-RT_0212">E-Lep 212 Zosel 2004</entry>
		<entry key="SAP-RT_0213">E-Lep 213 G.Ebert/R.Trusch 2003</entry>
		<entry key="SAP-RT_0214">E-Lep 214 Ulrich Reber 2004</entry>
		<entry key="SAP-RT_0215">E-Lep 215 R.Trusch, G.Petschenka 2005</entry>
		<entry key="SAP-RT_0216">E-Lep 216 Rudloff 2005</entry>
		<entry key="SAP-RT_0217">E-Lep 217 R.Trusch,G.Petschenka 2004/2005</entry>
		<entry key="SAP-RT_0218">E-Lep 218 Axel Hofmann 2005</entry>
		<entry key="SAP-RT_0219">E-Lep 219 Ulrich Reber, 2005</entry>
		<entry key="SAP-RT_0220">E-Lep 220 Prof. Schmidt 2006</entry>
		<entry key="SAP-RT_0221">E-Lep 221 Gyulai, Garai 2006</entry>
		<entry key="SAP-RT_0222">E-Lep 222 Dr. Bernd,Müller 2006</entry>
		<entry key="SAP-RT_0223">E-Lep 223 Otfried Legler 2006</entry>
		<entry key="SAP-RT_0224">E-Lep 224 Röll 2006</entry>
		<entry key="SAP-RT_0225">E-Lep 225 R.Trusch,G.Petschenka 2006</entry>
		<entry key="SAP-RT_0226">E-Lep 226 Schröder </entry>
		<entry key="SAP-RT_0227">E-Lep 227 Keil, R.Trusch 2006</entry>
		<entry key="SAP-RT_0228">E-Lep 228 Häusler 2006</entry>
		<entry key="SAP-RT_0229">E-Lep 229 Bloy 2006</entry>
		<entry key="SAP-RT_0230">E-Lep 230 R.Trusch, M.Falkenberg 2007</entry>
		<entry key="SAP-RT_0231">E-Lep 231 Jörg-Uwe Meineke 2007 und 2010</entry>
		<entry key="SAP-RT_0232">E-Lep 232 R.Trusch, M.Falkenberg, 2007 U.u K.Ratzel 2006</entry>
		<entry key="SAP-RT_0233">E-Lep 233 G. &amp; R. Schwarz 2007</entry>
		<entry key="SAP-RT_0234">E-Lep 234 Th.Keil, R.Trusch 2007</entry>
		<entry key="SAP-RT_0235">E-Lep 235 Prof. H.Peters via D.Hamprecht 2007</entry>
		<entry key="SAP-RT_0236">E-Lep 236 Heinz Schmegner 2007</entry>
		<entry key="SAP-RT_0237">E-Lep 237 R.Trusch, M.Falkenberg 2007</entry>
		<entry key="SAP-RT_0238">E-Lep 238 R.Trusch, M.Falkenberg 2007</entry>
		<entry key="SAP-RT_0239">E-Lep 239 Bernd &amp; Anita Plössel; Gerhard M. Tarmann 2006</entry>
		<entry key="SAP-RT_0240">E-Lep 240 TU Karlsruhe 2007</entry>
		<entry key="SAP-RT_0241">E-Lep 241 Alain Scheubel 2007</entry>
		<entry key="SAP-RT_0242">E-Lep 242 Günter Mader 2007</entry>
		<entry key="SAP-RT_0243">E-Lep 243 Albert Rautenstrauch, Rolf Mörtter, Axel Hofmann 2007</entry>
		<entry key="SAP-RT_0245">E-Lep 245 R.Trusch, M. Falkenberg 2008</entry>
		<entry key="SAP-RT_0246">E-Lep 246 Otmar Ries 2008</entry>
		<entry key="SAP-RT_0247">E-Lep 247 R.Trusch, M. Falkenberg, Bernd Müller 2008</entry>
		<entry key="SAP-RT_0248">E-Lep 248 Ebert, Trusch, Falkenberg, Steiner, Bernd Müller 2008</entry>
		<entry key="SAP-RT_0249">E-Lep 249 Hans Messmer 2008</entry>
		<entry key="SAP-RT_0250">E-Lep 250 via S. Assad 2008</entry>
		<entry key="SAP-RT_0251">E-Lep 251 Günter Baisch 2008</entry>
		<entry key="SAP-RT_0252">E-Lep 252 Wolfgang ten Hagen 2008</entry>
		<entry key="SAP-RT_0253">E-Lep 253 R.Trusch M. Falkenberg 2008</entry>
		<entry key="SAP-RT_0254">E-Lep 254 Karl und Ulrich Ratzel 2008</entry>
		<entry key="SAP-RT_0255">E-Lep 255 Alfred Eberhard 2009</entry>
		<entry key="SAP-RT_0256">E-Lep 256 Walter Baldenhofer 2009</entry>
		<entry key="SAP-RT_0257">E-Lep 257 R.Trusch M. Falkenberg 2009</entry>
		<entry key="SAP-RT_0258">E-Lep 258 R.Trusch M. Falkenberg 2009</entry>
		<entry key="SAP-RT_0259">E-Lep 259 Hossein Rajaei 2009</entry>
		<entry key="SAP-RT_0260">E-Lep 260 Bernd Müller 2009</entry>
		<entry key="SAP-RT_0261">E-Lep 261 Wilhelm Meyer via Anneliese Böhme &amp; Kinder 2009</entry>
		<entry key="SAP-RT_0262">E-Lep 262 Clas M. Naumann, via Museum Alexander König 2009</entry>
		<entry key="SAP-RT_0263">E-Lep 263 Armin Hauenstein 2009</entry>
		<entry key="SAP-RT_0264">E-Lep 264 Björn Schuschk 2009</entry>
		<entry key="SAP-RT_0265">E-Lep 265 Wolfgang Eckweiler 2009</entry>
		<entry key="SAP-RT_0266">E-Lep 266 Helmut Herrman via Uni Konstanz (Herr V.	Hellmann) 2010</entry>
		<entry key="SAP-RT_0267">E-Lep 267 R.Trusch, M. Falkenberg 2010</entry>
		<entry key="SAP-RT-0268">E-Lep 268 Hauenstein, Falkenberg, Ratzel, Trusch 2010</entry>
		<entry key="SAP-RT_0269">E-Lep 269 Helmut Hagemann 2010</entry>
		<entry key="SAP-RT_0270">E-Lep 270 Jürgen Oeder 2010</entry>
		<entry key="SAP-RT_0271">E-Lep 271 Thomas Hacz (Ungarn) 2010</entry>
		<entry key="SAP-RT_0272">E-Lep 272 Robert Bantle 2010</entry>
		<entry key="SAP-RT_0273">E-Lep 273 Mehr, via Jürgen Alberti (Realschule Bad Schönborn)</entry>
		<entry key="SAP-RT_0274">E-Lep 274 Gerhard Jurzitza 2011</entry>
		<entry key="SAP-RT_0275">E-Lep 275 Dorothea und Dr. Wulf Gatter, via Heinz Jüngling 2011</entry>
		<entry key="SAP-RT_0276">E-Lep 276 Karl Keller, via Walter Schön 2011</entry>
		<entry key="SAP-RT_0277">E-Lep 277 R.Trusch, M. Falkenberg, Jonas Eberle, Hauptzollamt Gießen 2011</entry>
		<entry key="SAP-RT_0278">E-Lep 278 Thomas Hacz (Ungarn) 2011</entry>
		<entry key="SAP-RT_0279">E-Lep 279 Walter Grün via Jörg Gerspach 2011</entry>
		<entry key="SAP-RT_0280">E-Lep 280 Wolfgang Eckweiler 2011</entry>
		<entry key="SAP-RT_0281">E-Lep 281 Michael Fiebiger 2012</entry>
		<entry key="SAP-RT_0282">E-Lep 282 Biebinger 2012</entry>
		<entry key="SAP-RT_0283">E-Lep 283 F. Hahn 2012</entry>
		<entry key="SAP-RT_0284">E-Lep 284 R.Trusch, M. Falkenberg 2012</entry>
		<entry key="SAP-RT_0285">E-Lep 285 Frank Joisten (Stefan Kruck/hr. Senger) 2012</entry>
		<entry key="SAP-RT_0286">E-Lep 286 Rolf Mörtter 2012</entry>
		<entry key="SAP-RT_0287">E-Lep 287 Wolfgang ten Hagen 2012</entry>
		<entry key="SAP-RT_0288">E-Lep 288 Dorothea und Dr. Wulf Gatter 2013</entry>
		<entry key="SAP-RT_0289">E-Lep 289 Klaus Jäkel 2013</entry>
		<entry key="SAP-RT_0290">E-Lep 290 Universität Landau 2013</entry>
		<entry key="SAP-RT_0291">E-Lep 291 Tom Rubner 2013</entry>
		<entry key="SAP-RT_0292">E-Lep 292 R. Trusch, M. Falkenberg 2013</entry>
		<entry key="SAP-RT_0293">E-Lep 293 Klaus von Ramin 2013</entry>
		<entry key="SAP-RT_0294">E-Lep 294 Werner Weißig 2013</entry>
		<entry key="SAP-RT_0295">E-Lep 295 Markus Gurrath 2013</entry>
		<entry key="SAP-RT_0296">E-Lep 296 Heinz Jüngling 2013 </entry>
		<entry key="SAP-RT_0297">E-Lep 297 Svenja Ahlborn 2013</entry>
		<entry key="SAP-RT_0298">E-Lep 298 Svenja Ahlborn 2014</entry>
		<entry key="SAP-RT_0299">E-Lep 299 Hans Judex via Gym. Knittlingen 2014</entry>
		<entry key="SAP-RT_0300">E-Lep 300 R.Trusch, M. Falkenberg 2014</entry>
		<entry key="SAP-RT_0301">E-Lep 301 Frank Joisten 2014</entry>
		<entry key="SAP-HH_0013">Taxonomische Belegsammlung Copepoda, digitalisiert (SMNK-COPE)</entry>
		<entry key="SAP-HH_0012">Taxonomische Belegsammlung Myriapoda, digitalisiert (SMNK-MYRIA)</entry>
		<entry key="SAP-HH_0011">Taxonomische Belegsammlung Onychophora, digitalisiert (SMNK-ONY)</entry>
		<entry key="SAP-RT_0244">E-Lep244 Ulrich Reber 2008</entry>
	</my:map>
	
	
		
	<xsl:template match="/">		
		<xsl:apply-templates select="imdasData/object/row[field[@id='SAP-Bewertung abgeschlossen'] = 'Ja']" mode="rec" />
	</xsl:template>

	<xsl:template match="row" mode="rec">
	
		<xsl:variable name="inventarnummer" select="./field[@id='Inv.Nr.']" />
			 
		<xsl:call-template name="ausgabe">				
		
			<xsl:with-param name="bezeichnung_1" select="document('')/*/my:map/entry[@key=$inventarnummer]" />
			
			<xsl:with-param name="bezeichnung_2" select="./field[@id='Titel (Museumsobjekt)']" />			
			
			<xsl:with-param name="inventarnummer" select="./field[@id='Inv.Nr.']"/>
			
			<xsl:with-param name="imdas-nummer" select="./field[@id='IMDAS ID']" />
						
			<xsl:with-param name="aktivierungsdatum" >	
				<xsl:if test="normalize-space(./field[@id='Eingangsdatum']) != ''">	
					<xsl:value-of select="./field[@id='Eingangsdatum']" />
				</xsl:if>
				<xsl:if test="normalize-space(./field[@id='Eingangsdatum']) = ''">						
					<xsl:call-template name="normDate">
						<xsl:with-param name="datum" select="./field[@id='Eingangsdatum (Text)']" />
					</xsl:call-template>
				</xsl:if> 
			</xsl:with-param>		
			
			<xsl:with-param name="kostenstelle">
					<xsl:choose>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Aufsammlungen')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Alte Sammlungsbestände')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Dauerleihnahme')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Depotfund')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Donation')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Eigenprodukt')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Erwerbungen')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Funde')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Fund')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Kauf')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Leihnahme')"><xsl:text></xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Museumsstiftung')"><xsl:text>7940111111</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Nachlass')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Schenkung')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Spende')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Tausch')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Unbekannt')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'unbekannt')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Zuweisung')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Zentralfonds')"><xsl:text>7940111111</xsl:text></xsl:when>					
					</xsl:choose>
				</xsl:with-param>
						
			
			<xsl:with-param name="ordnungsbegriff" select="'Konvolut'" />
			
			<xsl:with-param name="menge">
				<xsl:if test="normalize-space(./field[@id='Teile']) != ''">
					<xsl:value-of select="./field[@id='Teile']" />
				</xsl:if>
				<xsl:if test="normalize-space(./field[@id='Teile']) = ''">
					<xsl:text>1</xsl:text>
				</xsl:if>
			</xsl:with-param>
						
			<xsl:with-param name="kummulierte_ahk">
								
				<xsl:choose>
					<xsl:when test="./subObject[@id='SAP-Wertekategorie']/row/field = 'A - Erinnerungswert 1 Euro'">1</xsl:when>
					<xsl:when test="./subObject[@id='SAP-Wertekategorie']/row/field = 'B - Mittelwert 50.000 Euro'">50000</xsl:when>
					<xsl:when test="./subObject[@id='SAP-Wertekategorie']/row/field = 'C - Mittelwert 500.000 Euro'">500000</xsl:when>
					<xsl:when test="./subObject[@id='Währungen']/row/field[@id='WType'] = 'Vermögensbewertung A - Erinnerungswert 1 Euro'">1</xsl:when>
					<xsl:when test="./subObject[@id='Währungen']/row/field[@id='WType'] = 'Vermögensbewertung B - Mittelwert 50.000 Euro'">50000</xsl:when>
					<xsl:when test="./subObject[@id='Währungen']/row/field[@id='WType'] = 'Vermögensbewertung C - Mittelwert 500.000 Euro'">500000</xsl:when>
					<xsl:when test="./subObject[@id='Währungen']/row[starts-with(field[@id='WType'],'Vermögensbewertung D')]">
						<xsl:value-of select="./subObject[@id='Währungen']/row[starts-with(field[@id='WType'],'Vermögensbewertung D')]/field[@id='WValue']" />
					</xsl:when>
					<xsl:otherwise>						
						<xsl:if test="normalize-space(./subObject[@id='SAP-Einzelbewertung (D) in Euro']/row/field) != ''">
							<xsl:value-of select="translate(./subObject[@id='SAP-Einzelbewertung (D) in Euro']/row/field, '.', '')" />
						</xsl:if>
						<xsl:if test="normalize-space(./subObject[@id='SAP-Einzelbewertung (D) in Euro']/row/field) = ''">
							<xsl:call-template name="waehrungen">
								<xsl:with-param name="waehrungen" select="./subObject[@id='Währungen']"/>
							</xsl:call-template>		
															
						</xsl:if>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:with-param>
			
		</xsl:call-template>	
		
	</xsl:template>
	
	<xsl:template name="waehrungen">
		<xsl:param name="waehrungen" />
		<xsl:choose>
			<xsl:when test="$waehrungen/row[contains(field[@id='WType'],'Versicherungswert')]">
				<xsl:for-each select="$waehrungen/row[contains(field[@id='WType'],'Versicherungswert')]"> 
					<xsl:sort select="concat(
										substring(
											java:bsz.swbtrafo.util.XsltUtil.sortableDate(field[@id='WNote'])
											, 1, number(field[@id='Gültigkeitsdatum']='01.01.0001') * 10),
										substring(
											concat(
												substring(field[@id='Gültigkeitsdatum'],7,4),
												substring(field[@id='Gültigkeitsdatum'],4,2),
												substring(field[@id='Gültigkeitsdatum'],1,2)
											)
											, 1, number(not(field[@id='Gültigkeitsdatum']='01.01.0001')) * 8))"  data-type="text" order="descending"/>								
					<xsl:if test="position() = 1">
						<xsl:call-template name="calcAmount">
							<xsl:with-param name="unit" select="field[@id='WUnit']" />
							<xsl:with-param name="value" select="field[@id='WValue']" />
						</xsl:call-template>		     								 
					</xsl:if>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$waehrungen/row[contains(field[@id='WType'],'Kaufpreis')]">
				<xsl:for-each select="$waehrungen/row[contains(field[@id='WType'],'Kaufpreis')]">
					<xsl:sort select="concat(
										substring(
											java:bsz.swbtrafo.util.XsltUtil.sortableDate(field[@id='WNote'])
											, 1, number(field[@id='Gültigkeitsdatum']='01.01.0001') * 10),
										substring(
											concat(
												substring(field[@id='Gültigkeitsdatum'],7,4),
												substring(field[@id='Gültigkeitsdatum'],4,2),
												substring(field[@id='Gültigkeitsdatum'],1,2)
											)
											, 1, number(not(field[@id='Gültigkeitsdatum']='01.01.0001')) * 8))"  data-type="text" order="descending"/>   									
						<xsl:if test="position() = 1">
							<xsl:call-template name="calcAmount">
								<xsl:with-param name="unit" select="field[@id='WUnit']" />
								<xsl:with-param name="value" select="field[@id='WValue']" />
							</xsl:call-template>
						</xsl:if>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$waehrungen/row[contains(field[@id='WType'],'Inventarbucheintrag')]">
				<xsl:for-each select="$waehrungen/row[contains(field[@id='WType'],'Inventarbucheintrag')]">
					<xsl:sort select="concat(
										substring(
											java:bsz.swbtrafo.util.XsltUtil.sortableDate(field[@id='WNote'])
											, 1, number(field[@id='Gültigkeitsdatum']='01.01.0001') * 10),
										substring(
											concat(
												substring(field[@id='Gültigkeitsdatum'],7,4),
												substring(field[@id='Gültigkeitsdatum'],4,2),
												substring(field[@id='Gültigkeitsdatum'],1,2)
											)
											, 1, number(not(field[@id='Gültigkeitsdatum']='01.01.0001')) * 8))"  data-type="text" order="descending"/>   									
					<xsl:if test="position() = 1">
						<xsl:call-template name="calcAmount">
							<xsl:with-param name="unit" select="field[@id='WUnit']" />
							<xsl:with-param name="value" select="field[@id='WValue']" />
						</xsl:call-template>				
					</xsl:if>
				</xsl:for-each>
			</xsl:when>
		</xsl:choose>	
	</xsl:template>
	
	<xsl:template name="calcAmount">
		<xsl:param name="unit" />
		<xsl:param name="value" />
		<xsl:variable name="amount" select="translate(translate($value, '.', ''),',','.')" />
		<xsl:choose>
			<xsl:when test="contains('€,EURO,EUR',$unit)">
				<xsl:value-of select="$amount" />
			</xsl:when>			
			<xsl:when test="contains('DEM,DM',$unit)">
				<xsl:value-of select="number($amount) * 0.51129" />
			</xsl:when>			
		</xsl:choose>
	</xsl:template>
	

</xsl:stylesheet>