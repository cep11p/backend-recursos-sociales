-- MariaDB dump 10.18  Distrib 10.4.17-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: recursosocial
-- ------------------------------------------------------
-- Server version	10.4.17-MariaDB-1:10.4.17+maria~focal

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `audit_data`
--

DROP TABLE IF EXISTS `audit_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `data` blob DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_audit_data_entry_id` (`entry_id`),
  CONSTRAINT `fk_audit_data_entry_id` FOREIGN KEY (`entry_id`) REFERENCES `audit_entry` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16301 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_data`
--

LOCK TABLES `audit_data` WRITE;
/*!40000 ALTER TABLE `audit_data` DISABLE KEYS */;
INSERT INTO `audit_data` VALUES (16245,8623,'audit/request','xœÍWÚFþ+R¤¤ÅøýÀUŽ10µMsQS¡Å^`{`;¶¹ã\ZÝïìÚîB«TªÔžt·ÞÙyíÌ73{È’4ëkaVk³GÅ­²DëësaI¢Õ*JT\'q«G,Y{@W­VŽ¿qQŽ1ŠqÎd$‰ê£]Z”-`“Ag–ŠHšà‚/Òˆ =.:û4B{ÊB-œóh‹“²¢€†YúÙï‘ uDîí$õ¸)IŽ\'îdê+]}ÇÙY¶Çñú)M1:ŠÎ½ý0gÓ6·\'÷˜áè>}Ç9»<=`Á4:bG•M±cš\\€6(\'µ5¨[-E8«¬+šÕ*ñ©våaßF`‡D¨÷…¥üxzM=ì{_úb§Û&¸ƒ€È¦þ|Äë¬¡fÉ¶ýƒðc5_((È6Á1OÑ%[Ü{è¯•J#óGk¼ãq¥1I¶•›VkûÉÚ\\Œ!k%~Å»UG0Ì²\0¼{7hã¢v\'•#ªE;ÌGiRæ)KK×jÐ‰&¥/Ò½Aó½Á9ÎéNƒí®,3Kþ&½Í«€âI„cƒ“?‘¸/3—ÀÓc¶Í:<I\nsÌ×€*˜SVKb+$çÄoÒüå1D)Kó\nYVËdŽIæK0ùP9)¨u±¤!I”Œ¸¾Ö	ì =O²}’!w$\0Ÿ« Â²ÜºÂ¶N¡MUÞñ‹ôóïŸ\Z‹ñªƒš†à’wÒôž`*,[_‰EëF¯˜7&ƒ¾&™ª¦w»Š¨n¤Å’¬ÆR€ISQâ—¡r×zÜ‚í%û\'Z5ÑE«¨È7ý.Žµî&ÆkÅìªÝX_Ëš#YF±®ëëØÐeE•E#Rul¬±‚\rµkÆ¢„´¢Š®¢7Š-Ãïã=E|£¼/`Õ(I–™\rXJO¥úT‘«ã†)›z’å¹¦.Ë!\'Ê¢¢…Ò	Þ\'RT’oŒÁå*7)»Ê3ƒ•{ÊHŽYÒeHO¸;¶9©ËÍÓXL‰MK“-QäF³°«Ãàê\\àªCb’”/Ê4Çm¾ ÛÜáX”ï´\'m.ƒÎÄÃQtßa¨«7u#Xäh{@tc2LOƒ&jš>eUa©W­¢ÇAýæ.ûËpÈ›ìzJé±.ÎnÕè†vR>	ûtK’s¢½€ÕðÅø¾ÌÉñð™\n|®ËrHüÔÂÎ™fY•ì”j{û®ñµ\".PŽWýâ\rmç´÷\"‹µ}0~Àå.eõ±¹aí)ìßÑ©Õ[WÐ¥„ÅÁ „!\r…Ö\")˜‹Lp})zJ+K:÷iütñ\nT®ÿ‹ëS’Ê†­BßL|×	WAh‡Ë öP]Éã0\\¬Æ^~ï¨Ñj™%X[Ù#wþ\'ó†Æùa;Ž»ÿSG_¸¸rçŽ7˜ÌG9z^Líùh	!þžùcÖ¢ŽíŒÝ•ãÍCß›Þ\ZB×ŒÓw‡®Oáò/Œ\"¥ñ|¹ùöÀ]Mæë,}¬ü¼tƒ0¸žGç{Þ­†žÿÑöî€~Ý\Z&À-Ýàþˆ½)¿ðüðÅ”å[\\¾zôT­âÓ$âÆ¦ònLúÐ«E|×ž®&‹Û7¶…ŽYã„{A¼s¡Š|±&‰uµ?o/ì£Ú²?yš–B\'JÐ­!m8‰SÆÕ¼*ŸWÁd4‡Îà3”KM‘7ÇÞ0„K²S®ng´™rGíHPå¼&(yÇ½\ZÞÒY~nÏÜïm-){0ø\rÚ+¦orHÏ|wæ…îmzSyÏYÎ s­|Ï«Z\r÷Ê…ÇÇGÖ=hhRWCx@eU—¹‚e ÕæÞ…\0w8¹»Š#…^sølÊWq˜MæM}ÿš¤ŠcbÁm	$ô·s®ýb8™º×ñþF»@’Ÿ:Ù.{®&” KU5CmÜ8O¥?mDª6pž»ô\Z#;t?ÚŸ êC×ÚŽ[¿vÑD*l_AŠU•Su§ºm¹®Â=sÃ±7x9P©Opê‚qæ×­´Á¬t]ú“¿òV:G«‰…ÈËÀ˜ì}	E=Þf Ùhl…“™»\ZN=Œ¡°DÃáÇè¨fVéÉ;{€ž+<¡|ûpæ!¢Œlê7¸:_°x5ýÏû0q/$8DðâáÂÍÞœý£Yÿ¿ºZmª÷GÅöüü\'©qq²','2020-12-11 12:20:08'),(16246,8623,'audit/db','xœíW[oÚH~Ï¯ù\"%Ø3¶Çö VbSw›…íLìIâ­/Y_’Ò*ÿ}Ï$¸Á<4ImRÌxæÜ¿ó\r\'œaö­`.ÓQüRZ—Ãë·ˆY° ratfR¦M>Œ>¡÷gƒ:\rÎ>\'èýxô-xFå\\¤e¾\\hÝˆaøs\rxP$˜iË(š…ç³“,Ix\Z2öo%ò¥”4»!ÃÔp>NÇ&.5©×]ùÆ+ßœÙ2B‹iQ,40iÃZ¿á¹~{{«_•I¬ßˆ4Ìrý\\„âkt™êà«°ô\"ô¾\\u®¯®¥6(ÇQ*¤{‚Í®Êý¢Jƒ2ÊRyŽAàR”S~‹Ip%®|2-ˆyQ(	§–RšŠUÐ,—×*FÂ´ãß´îÝ]ÄlðäÛ¢†ÑU¯Ï(«GŸTV[Ö›¬ªC­UUzU©áAYý2=@ðùT K‹2çQZÎSžˆ£ÚA\\%é£Í\\\\ˆ\\¤ç¥y÷qMý@á¥Yžpý¼P™Þ‹—ç›8\nÔŸ <8øst:lÒú,–÷Ö+ÉL)ÎÑh¨âh«gCz/yœ]¢oÚ4Û;TO\'h(²?|·ÃÈZâP™:”‚M•^e²Éz{‡’,å–Šªï§þØo¶ÕC!DvÎÑVÑ(£+è\Z$Ö‰m°…ãVp­G6šDžyÕyÔ6ÞäUgÓ6,IJwOÊ=)_‡”Oý¡ôL¿MRR‹(Rb£ÎJì˜L;Nüñ§£ïÇÔ^äYUŠÅZT…ÈçQ(—Ñµ|òøù¨gQÎQ^eê<È/E¸8D÷gþµ[R[/DPåQ¹Ô¡Y£´u¤ºõµ°C:Øí{lüáOaÕ\"1Ž19ÆaÂˆÁ§u¸}íšÛ‹/àªMÃ€I5Äæ.ˆ)ýAˆ“,q±BÚ—µk€Sº\r7œüF<Æ¸–ÔïÀŽ>Èßˆ±²<Ü´¬Ê/JÄ¶·ó\0?ùCxõLLèÖ{g3él¦œÍVŽfG;ó\"?“ƒ&ÁÉ¬zø“alCGlxŽK,5¹bü6ø¸¹qžiâ=÷||]>º&±\\…Úwÿ {0>œýõ®?õ1qâOÑ\"¬r5.zF‡ÂØk9ŽG,Ó¢°.I–/ç	°²‡MÇ¶×B«ii¼í¹ ñ¬3·ƒ	¡®¹&ùµäqf—ŸLž—¼l²¼|RG__²ÍêS6mèõF_¡ÍžtGË6³-Ûóö}ö?ê3×²)lÜýCÊ¤','2020-12-11 12:20:08'),(16247,8623,'audit/log','xœÝW[Oã8~çWX})HÐÄN“4®ºR²Ã\nÚ-3/•Z71m–\\;é þû»WhÂ\r¬4S)©kŸûùÎñ)£˜>JÚ •˜KÉ¦\\Vš~>†Ô„…³XHj9´ÒÿÔûŠÎ®/.ÐIïâú²ÛGgW½K4fyf#ždb>®4CŠá©ÃC€`Z™‡á0˜OÒ8fI@é·œ‹¹\"´šÅŽéº&|ÜšM\\Œ‰ffÊ¬…	¶²¯N+7aÄ+ Ñ†µqÏ„ñðð`Ì²82îy¤Â˜ð€ÿ§‰úÈ‘6ÊÂ7ÚjU»›Ý)n`ŽÂ„+í[MíùMžøY˜&êÁ”g6‰xßŸñ˜i´âGLJMány”$|Í\nœÙüNÛHhåè¯Jóé)¤6hò°m9Øi>©ØlÕºÞOÂdŠN‘¿GQ<—ß\":KeÖÜÏ…LG2õC‚I3˜$,æ«ƒÅþNà­3)MA]Ièmï½ƒÝF]…ÞÙ½cz\0èÎEçd°‡àsëç5ˆ¿Ì“l¤â{¸uåqòbSð.xâó`”)“Ë·Ø÷tÅ„ÉM*b¦¬IíéŠ<SÞØ!Q»„¿÷Oï¼[ÄuËç+é¹*^EÊQ¯«íØ×ï÷|–±(¢/Úï]­9÷KXÏû¨«ZA»{Z\"dIq E(Â¢H/<Ù±d¹]Â¤B¹Ã¢ãûõSçªS,«…°lÂ$ß×Öh¡‹ÔPì-ÛäŽ«[­®úBFÉ¯uC ‹ÿÄš´ˆiÛDÕ¤·]“Ø…žuÞíw®è¼;è=¿YÐþX¤yÆÇ‡hœK.Fa –áz³Ùwõ-8„Sf£˜g³TŸû‚³Œãô¥}qÝé£ýªâ6¤jža67\0ªaR=ÔX=DUì’\ZnÔÌ\Z†=6þî`U%&109ÂaB‰IM·zðjÓ]æ—M/Ê°åxÄ]&Ø*K°ã¼1Áq\ZðH.òÜQ¡+H6vœÝdÃ¹d÷üe†·œ:†Òhý=¿â~*‚’</®¹ÿÅÛÞõôˆµyÛžX€Õ•²¡R6ÔÊ†EÃ¢R¿ÈGV Ep¡3¿£3”nŠ›ž[·†Î\ZyVŽ ­C!‚dÆTQY?{à“á’´dÄ€Š²ŽeáŸÁÝ.CIÀo3æñ\"šº†ïCþ ‹¸(ìh¤ ¡Yº¡µ£è9ãr§ŸÙ;.½\råeh(µÿy\'*òÃ-Áxp±cÿ²ZÕ-6ü\nÞ„e÷\rÖÃ\r›‰4‚àK£¿ôád½WØtÞäˆ·åÈFîëWÆvÝuˆž÷à>ÛB³âÚ¾EYŠ>É§S.P(a„<@AÎÕÉùgÄ‚@(:xÏÚÒ\Z\ZÌ8ZÞ.j\\ß\"ëKÃYUYUÈÒ­px™yÄ)…›Ô¿]XSP)˜˜\rË[U\n)«k·R4ž\"6‡{R\Z1+D“ëí&Z	äà8\ræ;Y ›rxMEµðÛ£É²ëuõ—TùW†&h|×ŸOÛƒÎ‹!¥ß q=¦[€B\\×#u«îx0Ä<NÅ|ÃÀÒÂ–kÛð÷-ÆÖ1Œ4­püÊ\\¡ðCly?ÃÏÇ‚)òƒ‹÷í‚Cý…?Þó\n~37LSûçþ¶MË1m¼I7Î©–óÅÓÓˆèâ','2020-12-11 12:20:08'),(16248,8623,'audit/profiling','xœíX[oâ8~ï¯°x¡•ZˆíÄIŒX‰i™®:°*tç	Lâ¶ÞÉ¥‡v˜Qÿû\'´0%¬vz™jQ‘Æ>>—ïœÏ9‰à”×œñZ,ã4›×ZŠcê:ŽëÙ-Ím^ËU,k­[\rF‰çb1BöñAÀ3µR×Z‚c‹WœÀˆ™.áµþ•LTrŽÞ¡ Mä*M8ŠçúKÄ/S·3Ì2Žu\Z(Ãi+œ&\"–wå|á|=«e¬hN(¯Í•\Z…ÓÑáR1OÁž‘¥à7f–ëZðq÷˜·«¥ƒ‚;\0ô\\E¨æŒ›×\"kÞÜÜ4/ó8j^Ë$L³æT†ò›ºHš`‘ˆY¨ò¦Î‚fÇŒ\ZW—Wµ±H%ÒX\'˜–Ï’Â1³ŽAàBæC1ä ¸”±(lòZ	­	·\"¦…ê|~Uø˜üVkÝÞ*nâñ1³‰eµnMÈ/Œ½Ï‰½çø.ÞFð‰Ãl@å¶í|\n¤\Z|èBïÏNNÐaÿäìco€ÞŸö?¢IáÿX&y6Ÿ¬5^ñ!ŽErþe&Kr®ÃÊ(ó·V›•5í<Öe½þ¬>¶í­DÕev‰ª»Š*³|€µ{Ò=î ø|f\r8.tž	•äcsì¯,D³8y0™És™É$á87.o^^Ù¾SäM%çiãýX‘Þ‰çæ@Zú¡Qg€²`çþq¯j×g9¿Ó>3÷$#ÆQ¿Wø±[\\+ÂD.¢ôµAyÕ|ÿô~çî†­ÇÔ3ÙémP²Ø+TíÁ*¤ËHÖ<YLoØd \\ÛRàûéC÷´[­«Bðl*´Ü-¼)”–©«ØY¶Ì-,×WW £Jä‰GÏk+:J¨cÙ†”Þ)ßHù:¤|ìÒ§ÖV¶u”@S][«¬Ä.4¾Ç½A÷tˆŽ{ÃþmÚdé,—“}4™i™Uh†êÊ\\Åßâ«ùÍ$à©óq,óË´X2)rNöÐ_“³î\0íÖÍî¦6-¸ÊçM(V•Ô÷‹jÝGuì’ö\ZVÃœ¿w‡0ª‹X˜`Œ0áÄâ–[ßû÷Ç¦E†åW0•ËªCƒÉÜEŠé¦3ö“)ŽÓPFºÌt×`W‘nÌØzºa]‹kù0Ç+A½vt@þZžÊ ÍÂ\r™6¨ü¢@g=°“Ý»·\Z	…j½362ÆF…±Qih´4´1.ò’¤WSÖð3Ãù’ŽØò]ØEçŠñvð±úQú?ðÑ§¿ññ¯ËGÛ+²öÃºíÃÙŸGa÷Ý!š„³¬è\'m«Á íµ]×\'6µ™¬+ßAŽc`eûî-$*»¥	ð¶íÁŽ\'ÝÌ¼&„ytAòkÉãUô./Lžçk¼²î¼ù«©oÏYf«]¦ÔÆ¢\rc¯Pf:£M™9¶ãûouö?ª3ÏvLÜþÕ\0[','2020-12-11 12:20:08'),(16249,8624,'audit/request','xœåXmÚFþ+R¤\\\nøý£ûà3æE˜Ú¦wQS¡Å^À=c;¶áH¢ûï]ÛÀÝÑ¼õC+õCbvvvvæ™gf6A:/ë_r]Õ«åœ7ºHçô/O¹Îsz#/P±ËÍ$Àn¨‹œÐ¹¤72üq‡óbˆQ€3z†ç‰ØÚ$yÑ\05l¦(!?Lbœ·òÄQ„óv”ø(\"*ä†]Ž³Zã¸(%`a’|£±r›cÞÞó|—‡ñîÀ4e¡HWŒ‘¦¾ÃËÛ°`eQm‹\nóövèMÆM&\n03ÀþCrÅ˜›,ÙbVSÛ\\[4®­iŒ‹V(«SäBEo ßÇiy»(ë\nvSl£&‚{Bà>{ ’_/¥Û¨ûñškwšáb`Ñ>\\U?ñ2­¥i¼n¾cßQUí™<\\Ç8háƒ¿Añ\Zw÷×K±´Hý‘kïZ8ö“ Œ×¥›zcý9L›L€!k~¡©\\L³\0º€½å6q^¹ŠãÒ‘*|?IÂR—‡ål8s-×õ®e^“d¥Ó9iÅû(à)à;\0Ï¯4QºÌÂÏ³Õurgà¥¨u¤N ,Y  @Q”e *‚(	œêK\nV—XÄªÔÑŽGòJUQ‘ÐÑàÏõ&„÷F¼Éá+‘ Ð;àR²ËW»¢Pnßªš )qše²4/î¼Ö=\'p¢ìñäÚïÃ¼<ùFí‘\0UBÜÎpFV ¶)ŠTgÙ¯ð”%e£dÆ#8´K×ð¾Æ9öwnUÕÓ<è\rž~ËCk•d( Åi’•e¡74Ž*hÏàš}é:œÜÁ¼ŒxŽW\"ëå£¨¦uéðªÐæ5`7\\øT2\0âHpë¬0R—Ää}k–<BðAëæSm²\re¦€™\në†¦‘p§·Ù5¾ÃL“=|4žá4]tŽc¯æ¢‰ü\rn™I\\d	­kn‹“V^$n2ðË\'\ZMf»Ëb¢0\0Ú6™zE¶ü‡kV\0eµ¨¸9ËÐz‹ÈB£©j9NÊ\ZúéTLˆÓÐzZÞ§´,é¬t¨Ê,ÇÅõÜë·4\n2Á8ÙU%§”í‹EÁ6ŒÙ0ðáØSj×dXø¡ÈÂÝöÑþà—@EŸ9iº^So¯j/Káeh™™–™‚–‰3ÒG‘N[8Ü³ÅÅ&¡t¬,¯r&Ì?x¶Ô¹Z0;¨DÐ\'Ý¿–j†¹KÉ\rÎÅ¸Š†ì¢ñÇp“ŸNL»–ó›å‘D!¥cõFŽez×3¼¹[ù\'p\\Eì¡çÍCÛõ¾wlÈÕ™9Ü¶0ÖÔûWfÁúa˜¦5óþ‹Dàž¹¸°¦¦ÝM;F^ÓÁ þŽYr„Ã´íÛ‘õ¿˜(¤:iÌŽÕ·BüŸlFbû|6pŒžµM]Ëœ;Xþun¹ž{>\\ŽYº_ômçÎpzVüº4H.hÿ@½]<?³ïÙ<„KZŽíÙ”“šF¯ë¾qyú‘\'guÄ±Œñb4»)¨ÍoH\'Äˆ	Úù2Œõ³õqyÚ ?Ê%ý+K’‚mûÉ¦¤jã ¡Zuï/}^¸£ÁúšC.Õ-ªÞ¶ûIwEÝHÉc…¶Ôæ¡Gõð2Dñó|“ZªÎO‰õ½ñtÊèõ^³A~¡ô*‡dÏ±&¶g]6 Ô}£g›ó	ôÝ…cÛeã#pïQÆ>>>ÒÞGÚWºŠÂ×Ze0gt \n¦=õ¬{èbõG÷g8êÕ›?p§p†Ãd4­Ÿ[¿Ç	ƒ‚\0@Ì™u	ýã˜+ÓA·ëÆÖ9Þ¯¬—C¾nÒpÕP‚-I’U­vã8ûæÎøèó¥GÙžug¼‡Ú÷,§o˜Võ(3#–/~F,Z[¦=®ÞC¤>ŽZg O,oh÷ž?\nˆg°ë¼‡‘ìTã f.::wF_÷™?\"W£Fèò$N\0(ðqÿ²ÉL}£7šX‹þØ6ÀÍ\0ŠŒSUŽãx¥-KâÑ“*ùGéI©äÊÖûÓ“¤øD‘¾]jÎög´ž½aêù… 0¾ÐÊq„QÁ‰oM²Š\ntÔ”5aÿã±Fü	éíd\0¨|úÖà‚÷ký„%<wO1«„Sž==\r¢ÅbU>\nÿ!Àa†‹]Ï³è+Ôxzú_ÊÜQ','2020-12-11 12:20:16'),(16250,8624,'audit/db','xœíV]oÚ:¾ï¯°r•Zb;‰“1‰uÙÖ#Ð³$p·õ–.	mÙÔÿ~lSJVÂÅÚnÕ©ˆDpü~<öË(¢?êQ#áEÁÎya´™üü)¨#D-`» ¡ÆèãàxÒë£AïäSÞŸÀŒÍ#QNyZæ‹™ÑÉŸåKAŒ¨±bNŽ²$aiDé÷9ÏŠÓjGèºBDZÛ¶|I°¥m´´Í¨£<´©q&bnH•Ž\\›W,7¯¯¯Í‹2‰Í+žFYnžòˆÿç©)\râCí–Yä¡ÙU«ÖåÅ¥’–Â±H¹2‘ÕÖ±ŸÍÓ°YªèH2œórÌNc>\n/xÂ´Mj„1+\nÍáVBJS~/*%ËÅ¥öSãðÑ¾½UyÔ·ÂiËOò”´úäqiõ‰û*³jaßÕYõªY%Ð—i\rzÁÑxÈç[8o…YZ”9i9MYÂ*„xž¤6s~Æsž†<š–ÊåíäŠøž®›HÏ²<aÊûi¡#]±—‚ÅÓµèŽ@îý38î×I}ã‹•ö¹B¦b—ÆÁ ¯ýhêwMx!+YœƒŽT^·?ÞK6·ˆ@_5d·ÿn‹’;Ž}­j_1ÖezÉ†\'wÛ[„T*7Dt~¿|†A½®ˆ¤g§¬àMíVº,]\rÇÞ]`ëÚJr£¸Æu,O<ê\\ÛE¯“D*Lú;Lî0ù2˜|ä=éº˜¼RPZÐÖ D¨ŠJäBj÷GÁpŽûãÁ¯ShÎòl^òÙ˜ÍžOE¤–âR½ÙWv£þs.óY”Ó„—™¦‡9g%fûàßnï$fCI›,JDjŠ4â7Ýª \\ÜB^¶ÜƒrãC0–«†\"|ˆ@˜b(ÕØß<r­ÍòòJ§ë\nŒä™»\Z„¬mõ%ä7ë›d‹e™•¸šZ#B6k-é»â\\	ê­„FWò_ñ!³<ÚRf••¿ˆãlÆ!íä÷îU#±d«®ŒM”±‰66Y\Zš¬\rmÿI\0ZÕ³làg†Ò5BÄñžZ~`\\Ÿµ¿	Fâ#Æ_Œ.ô°­«fWÁèKÎ“ÏïºãàGÁÌ¢y®çÂY¶ íÙÄB Ç±|\"1—ð$ËÓDb²£Ðî[ØËAi&QÛñ¶Ÿ|•y>\\]eøï¢Ç«[þ0zžoærð¦óêS¤,?ž³ÏªB6ñä£ãs^¢Ï{JcìY¾¿k´ÿO£¹¶°Ü¸ýÿþÊ','2020-12-11 12:20:16'),(16251,8624,'audit/log','xœÝWÛoÚ:ï_añB+µ;‰Œ8kÙY§¦BÏ^ÀÄ.ø4—ÎIÚ²ªÿûù.MK˜t´nCŠqìïúû.v8Ãì)e>«E2Mù\\¦µ6g{RÌ‚	]MR†]V…Jb”f\\gRÔÚŠaxxÌjK¥Ær6^“2–ÜÉØÚmÁ0µ<Ï²,L†-˜9³ØÓ³b.¼ù¶Ëo?É%í6íŸ_ÑÇë‹t:¸¸¾ìÑÇ«Á%šò\\¨l\"ãL/§ûL³ñiE<Œ}Ë¥^VšäR‚ñÚ&¼AÀ5ð8¬v£BY‘.Ì›÷\\7š‹,\n›÷2‰nÎ¤ßÕ<n‚BrRXÕLuÐìšYãnqg¸9T±4ê	¶Ûð7yd\0–ÙÇ@0—ÙˆÏB92â…NVBž¦…Wr)Žå–8³å]a#aµ“¿jíç5ª-ÛoÙÄ2¨’2ªÐ\r >*ž£³(ØŠc(Z¦ßB¶HÒ¬£eë4™¤I x8³¶˜Å<’›Õúòv…™?H—Rç„¾å¹–c ÷ÊÐS«Ý»èŽünƒ¼ø§™æ*Î&ßãÒF˜Gñ›E-o¤–q Å$3&ïß.±%£â›DGÜX?IO7ä™‰ð‹)ê‘>ÎûU\\·r¹‘ž›ÞaÈA9\Zô;‹±Â½€g<Læ¨Â«ÖW[ÎÃ=¬çCÔ7½ Û?Û#dMqTˆ:2„UH¯<Ù±d½¼‡É@¹ÃRàûõSïªW-«ƒX6ã©<,¬)„®BWAq°vì%¶°]/õºúU$?×=Çþ#KÒñ<ìÑâŒy}Äy«÷‡½«:ï¯t8ÕIžÉé1šæ©Ô%ÌTÝ™‘ÿËÍ¿–\0gšM\"™-’b?Ð’ÃY9=Bÿt/®{CtX7ÜM.\"7U,äcý¸HÔcTÇi`¿a50¬Y°ðwo³:±ˆu‚É	ÆF,ˆSýè‡w\\ù=:“UáÅõÍigï‹/¥ÿ3¾Q\"d˜®ÂÜ3ÀUÄ\ZSºkØOù½|à’W 0º@/¯dh±\'Ì««ÃoqÄuwý\0=zk^ÙRu£ll”eã•¢ñ‹¢½~‘_Y€6Á•Î¬øaì¥1ÆpçrŠó\Z@©[@yýå¬;ê½)Ãao„¦\"×ÅA4íX\rËñjc‹b×µ[j.’Q¢—“j²\n\\¸üøhÕ™§PµŸçg«Ç÷½mõß[=~E§üÅÕó~mÞ%»Æ›WóP}Ï<+÷|Ý¢G\nÿè«<ƒ{X7àse	r–ÏçR#•Â<VR ‘K³sþq!´¡ƒ!Óª°¾F‰Ö]ß\\£Kd bÛÏé&ÝÈ&ÝZëÀ…ãËDä¡dŽ¸àveMUÒãÖ&é^>šÀ9¿åøðÕôüüü±g','2020-12-11 12:20:16'),(16252,8624,'audit/profiling','xœíX[oâ8~ï¯°x¡•Z°ÄqŒX‰i™®:°*tç	Lâ¶ÙÉ¥“„¶Ì¨ÿ}20%¬vz™jQ‘š:öñ¹|ç|ö),ñ-LÔb§Ù¼Ö\n!Üá¶ÃZ¹°E­cUk7°ãpÊ±gÛœÚ”p×	®wæ¹¼Py­%Áâ[(,1=À áRQë_©$L.ÐÑ;ä§I¢ü\"Lâyþ%—i^´3åÏ²<ç©ÊhL[Á4‘±Z,”óÆ=øã”SKÔæa8\n¦£Ã¥b‘‚=-kã„a×ÅÖ`Øaœk¶öµôP\nGC\0¡ž‡„šÆÍk™5onnš—E5¯U¤Ysªõ5¼Hš`’ÈYÍ<ó›=j\\]^ÕJÌ¢0QÚ<%V	Ñù,1žéuªÊi¤þ¥Š¥±)j~$óÜH¸AÝ«.æWÆG\0õà·Zëî.Xò,Ïó(nÝ•¡½(ø{$øÌÞJèmB=Ê[æuzH5øÐÿ„ÞŸœ ÃþÉÙÇÞ\0½?íDãÿX%E6Ÿ¬×4Yñ!Žeñe¦JrV€j[ÞvÂJ(BðÊžë²ZV¹[‰ªE=× ÊWQeØX»\'ÝÃá‚ÏgÖ€Ã\"/2&ÅXû+Ñ,NLfê\\e*ñU0.´Ë›—W¶ï˜¼…ÉyšÅR{?ÎM¤ñBGK?rÔ Ìßù£Ü«ÚõYÍÚgúJÒâ`õ{Æ]ó¬Ï—…ŒÒÔåUóýÓï;w7l= ž.ÈNïhƒ’{‰=£jOV!]F²æÉýô†M\ZÊµ-ßOº§Ýj]m€gS™«]ãQZ¦®Bbç>°ena¹¾B¸úU\"O<ê\\ÛÝÎ„cRÞÝÞ\'ß8ù:œ|ä=éº”m))-lR²ÊJâbQ;î\rº§CtÜöì:Ðî$Kg…šì£É,WÙ8ô0¼ÒOù·¼Õÿ3xæÅ8VÅejÖýLÉB“=ôWçä¬;@»u½»)ƒ8Lša¨Ûú¾)Õ}T\'.mÞÀ\rs&~ïaT§˜âBA„\nŠ!Qõ½ÿÆtŸ^u}~¡ªLàÌ]4BÖ¦ü2ö“ùÓ@Ey™æ®®\"×„±õ\\Ãz.¯ÕÃ¯õ¨Ñùkuªü46¤Y£ò‹qœõ8ÀNöÝ½ÕH,(Õ…±‘662ÆF¥¡ÑÒÐÆ¸èKÐ¢¤2˜²€Ÿ1!–\\$„0‡Óµºd¬þýÈÈ<â½‘ñŒ¯KFsj›¬ýð[“’gu†Ý4t‡hÌ2ÓNÚ¸mn3‹`FÇòp®üõq\'ÛšížE9*¥	°¶ÍµŸ|•q/®2úkÙÃ+Ú–fÏóõ\\]w^¿†‰ŒÂ¯ÏYg«\r!6ãð1ñ9¯Qg=¥)å–ç½Úÿ§Ð\\‹Z&îþÇã','2020-12-11 12:20:16'),(16253,8625,'audit/request','xœåW[o£Fþ+ÈR¤Mk›ûÅXy _Û¸€›¬º•5†±Mƒì8»ÚÿÞ3ø’d»»íC+õ!Îœëwnc¤ó²þ9×U½±ŠP¾Áy£‹tNÿü%×yNoä*v¹™¸Ñ\ruãº@—ôF†?îp^1\npFexžè£M’\r`@gšòÃ$Æy+OüE8oG‰\"ÂB,ìrœµÐ\ZÇEI\r“äSEˆ•Ûóîç»Ì8Œwæ )EºfŒ4ð=^Þ…+‹j[T˜wwCo2n2Qøˆ™ö“kÆÜdÉ³šÚæÚ’ qmMc\\´BYXIƒŠÞ@¾ÓÒº(ë\nvSl£&;¡\npŸ=ÊÏ‡—ÔmÔýxÃµ;Íp1°h®ª×\'¼Lkj\Z¯›?±?QVíBA®c´ðÁß x»û›¥Xj¤þÈµw-ûIÆëÒM½±þ¦M&Àµ¿à@ÕÓ,\0/`o¹MœW®â¸t¤\nßO’Ç°äåás6œ¹–ëŽz72¯I²Òéˆœ´â}ð‚ð€ÎçWš(]fáçÙê¦ƒ¹³\nðRÔ:R\'P–‚,HP (Ê2PA”Nõ%«K,bUêhÇ#y%Šª¨HèJ4ø»RoCxpWâmO™Ú€\'PÉ)_ŠBy|§j‚¦Äi–ÉÒ¼¸÷ZœÀ‰²Çk¿óRòJí‘\0UR¸+œáŒ|I€Ø¦(Reÿ¢NYR l”¬Ã˜bB»tAÝ·Â8Çþ.Ã­ªrš½ÁÓ\'`yh­’ì	e¤8M²²-ô†ÆQí’ÌìKÇxàáäæeÄs¼\ZZ‡0gE­0­[‡W…6¯AuƒÁ/e@in5&ío¢ò¡5Kž ø uû\\«€lC›) ¦ÂÇ:¤a†i$Øô6»&Ãw˜i²‡‡Æ3œ¦Ë‚ÎqÌ`âÕµh\"ƒ[fYBûZkqÒÊ‹$ÃMÞ|ÂÑd¶»¼€ ö(\n(Û&“Â¬hÁ‘ÿxÃÁ@Y}Tµ9ËÐz‹È‡F5R=5DÄ Œ–÷œ–å+5o—ŽÊr\\ÜÌ½~K£\0|’]Õ.rô°4…añ|J1	¤;É‡|~,²p·ý@>øeœÀûÁ­„Í#M×KÙ1Ñöîºöµ$ÎP†¶gð†Á‡32\r«Dñ-.6	M:`;°¼Ê§07þ@‡Fw©s5avFP	¡OfxM!æÔEÆ¸\nŠœ’rácü6	žO^j×r~µB’èX\'¥åX½‘c™ÞÂõoîVþÁJ¨Êsèy³ÅÐv½ïþr%3kc`M½e¨†iZ3ï¿¸îÂÅ…55íÞh:øê2x)06¦ƒ9@üá‡iÛw#ë±H‡Ò˜«o9¤ðÿævkÜç³cô¬ÅhêZæÜ±@ó/sËõÜóqÌÒÃ¢o;÷†Ó³zäí­ùN²ð÷ôÛ›ò3Ûñ.¶’ ¼ÅåØžMA)1©Ëèc=7ÞÞaäâX‰8–1^ŒfoG\nl3ÃÒ±qÆb‚v¾cýìûøy: /å\'ý—%IÁ¶ýd»RµÇqP®zI—>/ÜÑ`\nsÍ¡.Õ#ª>¶ûIOEÝHÉ*b…¶ÔæaFõð2Dñ5s¹OI/UòScb}ï`<I½Þëj_0½Ê!9s¬‰íYo+Pê¹Ñ³ÍùæîÂ±írð¸÷(cŸžžèì#ã«N]UÂ×Ze0gå@L{êY”‹Õ=œáHJ¯>ü›Â“Ñ´¾4ý\'\n\01gÖ!$ô÷c®LgÓ®?\Z[çx¿ÒÎ†q€ít“¾€«†tI’¬jµÇÝ7wÆµÈ‹Ö\'aÏº7ÞC×{–Ó7L«ºT™ƒË—µ}VR´«L{\\]oHg¹ÎàžXÞÐî]^ˆOpê¼‡eìT‹ ®Yþ$:wF_ó–?¢U#EJäN}hêqÿm’Ú–7šX‹þØ6ÀÁ\0\Z‹SUŽãx¥­ˆôåˆä‰ü¤<1–õ„²õþt)	>a¤w–\Z³ó€gw—zo!hˆÏôfr\\]Dpâ[¬*ºbÊ^Ðÿñ:#þ„ôfvÒ\r\0T>}kaÁ\r¶¾Ä’úv/n‘4<{z\ZH‹Åª¼Îó„˜áb—Åó,:¶-lÃ¸L.Xùò\'žÄõ','2020-12-11 12:20:16'),(16254,8625,'audit/db','xœíX[oâ8~ï¯°ò•Zb;Ä	F¬Äv2;]1°ºó‚DÜÄm³“K7—v˜Qÿû›R˜¦íLµHÇ>÷s>ûÁ	ÿVp—‰,\nq)£+àõ[Äm05ÀÝ‚[Œ“£OèýÙ`€NFƒ³Ã	z?}D¾¨Â¨œË´Ì¾Ñ8¯‹áA‘n,¢hžÏN²$iÈù¿•ÌŠÒê†œ0ì8cÂZÌÁ£Xhƒn²Ô-¸­,lsã\"Š¥\"m›7\"7oooÍ«2‰Í™†YnžËP~.SÒcm–YäÙW£ÖõÕµâæ8J¥RO‰ÕÕ¾_TiPFYªÖ	\\Êr*Îc9	®d\"´Nn±(\nMál¸”¦ò8ËÅµ¶‘rãø7£{w§âñN›`›¹]xeÏ	k‡=-¬.Æo3¬¥®«»V†;WoàL|>U+ÈÒ¢ÌE”–óT$òhc!®’ôÑd./d.Ó@†óR™¼{yƒý@\'.J/²<Êúy¡=]‘—‘ˆçk;\nÔŸ <8øst:¬ãú,+é•‚¦\"åh4Ôv4õ³Æ½@”\"Î.Q„×ÍÆœÍ¬§4TÙ¾Û!äžâP‹:T„u‘^z²eÉýô&Ê-ßO¼±W/«‡B°ì\\²©­ÑB—©«¡8¸wl[Xnl ®ñHFÉ3÷:baJÞ$(NÛf\n”=(÷ |P>ñ¤$¶Cß$&]j9\Z“„l‚’87N‡o<E§Ãéèû¶5ý<«Jé!¿*d>B5Œ®ÕSü#¾¨ß\\B8‹ržÈò*ÓëA.E)CÿýÝœyÔl(n³A•GåÂ„ZÒÆ‘.Ö#Ô m·…[æ0LüáMaÔ ˜âcB	A„rŠ!UÃí]×ÚN°üªJY›b×¡lÕY»rÌØæ8ÉBËT{*x5ù&ŒmçÖq#\'yÃ«ß} ¿‘cdy¸#Õ*,¿ÈÛÞöôäæmzbA¹®”Í”²™V6[*š­íô‹þLZp×9³,ât†ó5	!mÕ•ë¬Ñ·ÈõŽûc€t‰×£= ÷€|]@Ú/¯’ä»>:@yö×»þÔ{Å‰7E~Xåº=ô{¸…íŽKAµIÇ¶à.‘I–/æ	à²G,§\rÇ0FË~Éäö\\Fígžgn[¶»‚ýµðqkú—ŸŸ—k¾lºm¼zRG__²Ð6;1bÙêÞ·lÅØkÚ÷i3ÇfûBû?Z·aG»»û$ºŒ','2020-12-11 12:20:16'),(16255,8625,'audit/log','xœÝW[Oã8~çWX})HÐØÎÝ+¦³Ã\nÚ-3/•Z71%K.ŒÀtÿ}“Þ )«ÑÀJ;•š:ö¹_¾ãrFØ£bk$B)>ªÑæðú1§Z(FlÖ\0E”¥Hå\\æ\"l´#FàkÁ—	%¬1¢Ñƒ˜Ž¤Œew\"Õ„f;dÄÁ®‹1&NËqlÇÄ7g˜=>EÌ†7Ï4±çÒö“½¡Þt@ý§þWôñêüöÏ¯.zôñ²&¼£|,Ò\\Î\'»l\n§£Ó,Ix\Z2ö­r^k“ocË_ØD–!°u|,Ö¸ŽbÑ\0‘6¬{.‡‡ã&Obã^¤a&©Åh–\Z •VJFG¯Zw7wš˜ã(Z=%f»Œüu‘9DKŸ ˜‰|È§±7\"á¥NÖb®TIán¸”¦bÅ\nœùü®´‘²ÆÑöÓ\"ª¾éyŽYF•nFÕº>$(JgèÃ	\nVâJæê[Ìn2•KRec•Çá´NSžˆåAµ¿y³ÆÌWêÁ·-ë·½ïxÄÑ¡w7Cï`*º{Þ=î!øÜEâ¯rÉ£4ëønÄE’¾Ø”âZH‘\"çÚäÝÇì{eËDéu&®­«ÒÓ%y®3¼¶C¡Î\0É`ï¯þY¯ŽëVÌ—Ò\rš”£~¯´c¿|Ö¸ðœÇÙƒðºýþåŠsëÙ\0õ4tzvYP”¢4a]¤+O¶,Ylï`Ò¡Üb)ãûõS÷²[/ë…`Ù”+±_ZS\n­RWC±·pl[8nn`]ó…Œ:’_‚C—PÇû[Òr›T3æùŒs³Îzƒîåõ†ýç£íOdVäbrˆ&…r…zÝé\'ÿ›×¿R@8U>ND~“•ç†åä\0}éœ_uh¿©¹\r¥Á3Êç”j”6ËZ=DMâÒñZ¸E`ÃÆŸÝ!¬šS|Dè!ˆPF1¤ªyð*è.ò+¾ƒ¦\\ÔfØs¼å¼3weØq~2ÃIŠXU‰îêÐÕd›8Îv¶á\\ñ{ñ2ÅN@kt€þ^\\Š “áŽDW—‡ÿÄÛÞöôÈ•y›ž˜P¬Ke#­lT*UŠFkE;ý¢ïÙ‚&%µÎT%ü†Î0¶îFBˆeZØ+³fn¶£²p“Dy†B1-f3!Q¤`F\"Da!ôÉÙgÄÃPj:xä2*mo¡á@‹~Ôœ\r2±j3gÙCtÙCþ¢Ü´ÂÑE±`À\'¸­¬©é$›€•Ëë,ÝÕJævFâA1Ÿ²(#qQ“×ßN’|’…ó-D¤ëkøÿS=âîª¥PÜBd‹¤ª¥Á`Âå2‹c!•1X Ùéj¯¶éÝÍ’†Bnù±Èƒ‡£µÜ×±˜¶é»p·žUP^}þÐv_Àú ;D“°åÅfrŒ[Øö=J±GmâÛ&OD’Éù8Œ?&¦kù–‡Q5é\'0Ž=‡Ú¿Å.¶Lâþk½{5“÷±øí®\r6Ý6^¿F)£o‰Z/êŒºÆ¥îÿµ\\¼ºá­ÿƒƒo66]øÏòôô‹6%ü','2020-12-11 12:20:16'),(16256,8625,'audit/profiling','xœíX[oâ8~ï¯°x¡•Zð…8‰+1-³ÓUV…î¼ IÜ6;$aâÐ3êßc§-L	»š^¦ZÔJ\rŽ}|.ß9Ÿ/‘‚‰ïZpQ‰Uœf‹J3„¹v¸×Ô¢!*y«J3¸†¹Ã™KáœyÄcŽž™©µ¼PºÒ”‚`ñ=ZÜ40H¸TTz3•DÉ:z‡‚4ITGi\"P¼Ð_¦â2Õy+SÁ<ÓéH§A$§£pÒ\'‰ŒÕÝ@ÑoÝƒÃƒ‚rÊDeEÃp2<\\*)Ø3²\'».Æ˜ð\Zç>Äe4Œ¯…‡R8õ<šB¨Z8Ð®_É¬~}}]¿ÌãiýJ%ašÕ\'*Tß¢‹¤&éœ‡Q^×YPo›Vmv9«˜M£Dó”°¢óyb=3ã.T>“©ê—*–Ö¦¨S©µ•pK‚ºU/fÖG\0õà·Jóæ&Xò™ïSF›7Eh/\n¾Ï¾‹õ·ü¡´›öu|´êè}BïÏNNÐaïäìc·ÞŸö>¢±õ¤’<[Œ×«š¬øÇ2	…ø2W=K`åÔßNXí2¯ü)°.ëõç`õ0ÞNX¥ž…Õ[…•cpíœt;þ>ó\Z¬:Ïd”ä#³ì¯Lçqò 3Sç*SI ÂQn\\Þ<¼2}Ç&.JÎÓ,–Æû‘¶‘Þ‰çfEZú¡Q»²`çÞq·lÖgµ¸Ó>7»’ã¨×µ~ìÚgIxÌå4½@-P^Öß;½Ÿ¹»aêquME¶»G”ÜJìYU{F°é\"’5On»7L2P®M±ø~úÐ9í”ëj¡<›H­v­7Vi‘º‰ÛÀ–¹…áê\nãªt”‰<q­#ÓíÜB\\¿ápCJÿ”o¤|R>r§$ŽK·’“e®å$!«¤$.|»ýÎé\0w½hwœ¥ó\\÷Ñx®U6ŠBÓŒfæ)ÿ–_Ío¦\0Nb•_¦v<È”ÌU8ÞCµOÎ:}´[5³ëÚÁ£|Q‡Z’ê¾-Ö}T%.­¯†kú0tüÞ@«J1Å„‚Cªª{ÿ~oºM°ú\n¦rUšbÏ¥üî0Ä6å˜óŸÌqœ†jª‹Twx%ù†Ûæz¾a\\Ë+õ0É+Q½v´AþJª ÍÂ\r©6°ü¢@g=°“Ý»·\Z	ƒr½364Æ†ÖØ°04\\\ZÚ}I2Ø„Ë‚)ŠøƒbÉGBHÃœÊmÖèv²ü.ýß„ôƒëÑ!ßùº„t(.®’ä‡/>HžýyÔtP±ß q8ÏìñpÜÂ5ìø%Ô!¾Ãð®ø9Š—-ÂÜlÃç¥10·åqê<q?sqƒ9÷ßé¯¥Wr~yaú<ßáË¡ëÎ›×(‘ÓèÛsÚêIŒ0ÇÜûŠ£B{ä:íbî:ü­ÐþO…ÖÀ\rXÑnnþ½à›','2020-12-11 12:20:16'),(16257,8626,'audit/request','xœåXëoÚÈÿW,¤¬ÚÆolåƒcÌCLÙ{»²{\07`³c’Výßï™ñƒdÕv«»ûa¥$öÌœçï<æ8È”4óKfêfcµEÙgKdŠæ—¯™)‰f#ËQ~Èì4ÂËØ”EñöU³AðœåŒ\"LO!Ž6i–7€L™{D(ŒÓg|–†1Úâ¬µMC´¥$TÃ!Ã„GkœäÅH§Ÿãí	ZKäÞ-$é’ÅÉá‘{4ÚA[}ÏYûýßâåMœš¢·”6÷îfàGMnßc®Ãûô=goHºÃ‚¡·Ä–*bË0¸Z!—\\Ò™0MrÐÏoq²Î7tW1²¨Ð·¶Ù@aˆ÷Ì:•®@y¢|>eiÒärü˜ŸÐÊBïó&÷«ðë%÷Ç•Ø%¦B«dð8	Ó(NÖl”¬?Çû&aÀ>Ç/h·(Y\0†%Ð‚Î¬‰³K*¹ÓÄ	{1—|r\"Ú3Õ8·õ‘?ü*%;þ@¶Ì]rá‘çWs¿Ç¥ÃašÞÇ…^	–ÓÁtæÌfÃî•&ªÖîtQ]I!Š$Y¤€J+CQ@\\fduÕÁ‘ÖYEx©µµ—²¦EH–QÔn·—‘Þ–UõPmc}‰¬«#%¤­EWÚ*ºP,~/ôëâ…rÁS£[²ÌtÀvé©Tž*rq|£²ÑNö„hê<¿õù…±Ô|éÍÜ»8+8/ônémJâuœ°¨ÓìÍó½)ßH\\VÀ\nLÔÚ÷ð	4Ó…mZ*£1{ä©+|žÞc¶g@Ìvhþáød/;¿Ý#Òùô´ÕXç£;{¹ù°=ÞÕtž,f÷ñ§ãñ³t<JV¤ö¬àéi–†Ç°ûé?*ÎC^=gøaáè×ë«+¦³MuBèóû”¥j6‘ç`ñCá#5WÔ:XÒ$JzD÷:”˜`´åã}UÎ’.·$*N:),›È;ÆE}Ñª[ŒG\0Í+—_‹ì\0÷i’ág­…ujÀ‚Ÿ¦G@=â¯Ÿ*…Ð(Ú ´Œó¸	ícàXèoMNêp“ô†Ä‰†©É¦(rý±_Õ¡Â\ræm(!’²\0·A[’òYžÜäà-¤MnwÈrðçmãJ¶Éí¡ÛñpÞ_‰°\"¸Z”Ù5%h½C,¸L\"“Sj—5ë—5«H¯ûË«œ(Lé¡ì¢‡\n$ÎŸN)ÆzD\ZÐEø>\'ña÷‘2|w·€òÇYÉl×{¦YðŽ¨´wï+“‹Í)\"h÷ìª\0Ø¡ƒcB«£Œ(ßá|“²LpOÝ™_\ZgÖ\'ôØ¸\\šRµ1-7Ä\"†qÖ£·QµCÓ2Î˜,Lpé=¥i#ÕÒu\Z=Q”*eJˆ9ÿ\'Û\"$‰‡Ž,©Dx/úÜÿ§V/”.üüÂÂÈ,»Ð®ÙâBë^¡h\'çg{”eÇ”Dõqv~Nðï–˜Œ1¥A€õÕ‰‚E0ïbæ;—§Ü)¼G­ô÷oiQPÒÏm;™P§5½\"©›eQUîWÏ¨D|g;ÐÃXA>\"–q¯~ýÊÄÌï7Ç£úÕ¢ý€VÏé=Çöƒ™oùóY=(ˆe3øþ4”yþ=ãVòÌA[`õ‰ÿÍ@¶;ñA0r&}p>ÑúbvZ¶íLý¿>	Éâ™ À™Ønw8éÿé8ô’adMús\0ê;g¢Ê)ÿnêüLñ×\0Ø®{3tþ“Qí³ë\rûÃÉÍG|Æì9=Ç£uôW§$½´ì™×|÷Æ™ü}¨Î¼EÐs½[Ëë:]úööœ#KoPÿ@\'x“êzþÙt&ËoQy®ï–w,…·*W„UG{{–£= dñk§ßôÔs>Ì™¢o‡EËxk¬+.« 0\0\nˆ0\r0u¶ŒóÙº^žØK±dHšæB+Lw0xA¢<à$JU5nn³aMÚcÅ\n^Tý¶:v{>àÂN@ËÚÓ¹L[jK‚†ÛÅË%ï¹óá’–DÉ?±ÆÎ÷vù—Õí¾N íÑ«°Ó3Ï»¾ó¶€vÕ>»®=Ó~ç¹®_Uð€ˆ\0mNØä»­pÄË*Peø‚™=p\ngžeP}%,|È0§7\\<Ã‘æ@uø:åg8Œ‹ŽB»ÿ&)‡¢@Ì¸uý½Ž•í\r¡é÷†p)=Ãû•t!N\"üØÚoö/àª Yªªéõ½P_äsoT±¼Ñxú–ïÜZwÁ\\õz–í”_v(H-éEJ±B´ÝQ9–Ð\"©©žÁ=vüÛ}1S£àØ»ƒÑÂ+/Ä*i¥ïÜþ™¹R\rWÍ‘sdvcA#õÞ& á¨tùÃ±ôF®FPY¢®‹¢(uZz»C_j(Oäô_D\'ÂÂCDÖ§ï„b#¤„lr‡¤í;þÙyÉ¿ròdRªAøÂÆÊzÊ`Í\n0ÿÖ°QšZ#\') é§\'jOÌ>ÇN²cöGmúÖlîUŸ®´žggßŽÌ=wR;\r[A°*¾\0ëÿFJt“àü@’9ÙÖ­†Õƒ¾Èe:ÁÿçoPe','2020-12-11 12:20:19'),(16258,8626,'audit/db','xœíZkoÚ:þÞ_ñ…ö¨Û‰\'ˆ#±Žj=b°S`û‚DÜÄm³æÂriË¦þ÷c;Ð²NÅm•ªT*8±_¿·çyãØPZ¿‹X•€%	½fI¥A-¨Y¿<ó–.\Z ‘XªnUúŸzß”³a§£œö:ÃÏÝ¾rvÑû¬Ø4s½tÌÂ4žÚ•†gAþO\0ÿ@\\A«2õ¼‘{9:‚€†®eýÈX<#Õ†kA\0\0š5¢\ZÈ€&ïÐ„¹njaa¢fU®<ŸUø”˜·ëw4®ßßß×oÒÀ¯ß±Ðâú%sÙOï:¬s…èDšUOb§Þ­Úäf\"¤¹°ï…L¨GPmHç¯²ÐI½(ýÜùÊ5KôÒg}ç†Tê´*ŽO“DŽ0\\\nCö$Ê%ÓéDÚˆ¬ÊÉß•Æã£ˆ£g™\Z4 D\r~©oVSß,¬†Fà»«Jˆ!ÃJÃª“ÇµÝiŸþwëd5\'\n“4¦^˜ŽC\Z°ã…?Â7cvÅb:Ì§ÂäÕÝâ2q^xÅÖéé|xêQülG¢´úJìüÓ;ïIÝ²é|öLpSçÊ•^WÚq(?ÜshJýèZiòÉ‹î÷.ž$Wˆž÷•®@d«ûqÅ$³Grª#1°(Ò¹\'K–Ìn¯¡\\‘ñýö©}Ñ.ž«©¸Ü²Kš°Ciœ4O]Áˆƒ™cÏ¹åÝÕÆU_ÌQ4dËZG2Þ%\'	6U]pÒ,9Yròm8¹áƒ’hú;}PB°$%„‹¬„:ïöÛå¼;èý¾ìPí8ÊRf+v–°xì¹¢éMÄ\'ýNÄwÌx<“t°ô&’ýNÌhÊ\\ûHùÚêÛ}å°*¤ë	s²ØK§uV/¬K´+Uh \Z$5Pƒüä7¾ôúÞ¬\"€À	D\'*YXÐ¬-—]u9ÅìëJYQ’5¬B4O²º*Éº¾f’ƒÈe~’çº-¢Wp¨ëË	çý	½c/³¼àÕÎÇ.˜ÅîŠ\\‹°ü!G0^öƒë‰ŸÌ[ôDåx+	e#©l”+\Z=+ZéÚ\'U†\"grïÐËz&$„ë@2kè0ò¹è®ÉHU­$dIÈ·%¤FdÖ´EBjx¾nUþš½šîØJ¾ò‘b)b7«Ô\r8‹¶{/ÀPÇæ«\'VÛe·iìeAlIò3/tY\\„~X€~Žò(\\Š2$O.äÀÿ7·\rÜïÆdM+X2‰k.1ä¢¦ÃY>–øËõÏU„–Q®e-ëk81ãmG”Ö3þ\"QXÈ²;¹Ó‹Ûõü-½zB»©©i2Wx\'hßlÅ!¯–þì%Ø·;FóÒn,‚™«·_%ê·,åj¸w	î}‚h˜Z^ÉÉFàÞ°r#]ÓËuJ‰î=£[3‘¯É,¢›¸ÜN.·“×ÝNÈ[µ,û¶}â›ªa–E±,Šû.Š*Ê‹\",‹bYÿTQÜp¥¨\"¤–+Å²(î¹(bÍ@ò%ý¶kr¬¿|l\rÚ/ŽRúíb»Y,‹Ý5tÕÔ\0F˜Ïe+vÀ‚(žŽú`7!B„×W4ßó\\»It¤oyiÀß£Þæðƒ?ïùðcwgç-Ÿ³†úÞÏ]üyŒ5È#êvÊSò>|å&ºvq³è¤¸ŽñÉ‹è\"2#\nü¨5™øžC_ÿA\0DP‡jþ‹D„ß€.žš\0™¯n©•l)Ù²s¶è*²=>>þÈŽ','2020-12-11 12:20:19'),(16259,8626,'audit/log','xœíXÝO\";÷¯hxAo¦ïnÂº˜uãÂ^ÁÝ(3ç:lgFe7þï÷´8Ê°†¨÷a£	XÚsz¾~ç´§Œbú+¥­E<MÙŒ§µ£X£¿ªÁÈ*)Å&­\r€$Hb”fLdÜ¯µŠácÀ‡\0	Á´¶‚Ñ-ŸŽ–¤”&sKB½åSli¶­i\ZvŽNtÓRÌŒ‚´û€šðËÑuFë^î\\’®[ ýSÿ;:¹8;CÇý³‹/½:9ïA–ûA6æq&“m*ùÓÑqE,ö)ý‘s±¨TÉ\"Žî.uÂ+˜Ò?­]!¯Á–&Œ›7L4ooo›WY6oxì\'¢9å>ÿÌâ&$GJ«f*¼fGŽ\Zó«¹äæ0ˆ¹O°ÞRž¿Ìc/gÉu3ž\rÙ4äïŠGLÉ¤5/diª(ì’IqÌ×¬À™-æJGBkG×Z÷K¯ººkb—H¯’²Wm ëC|‚x†>~@Þz;Š¢Eú#¤WIšµ÷r‘&ã4ñŽýiËŸÆ,â«…b~Ãóz…š¿ƒ€ø]ohºniÒõvÙõ–æ¢»gÝãá‚¿k/o€ÿÓL° ÎÆÒ¿‡¥…0â\'“‚_rÁcûãLª¼}¹Ä¾§R&ˆ/1©ý8U–®È3á=RÔ áí}îŸöª¸®ùbµ{.‹‡$á¨ßSzì«ï\nó<–±0™¡6l^5ß?_sîoa= ž¬ÞÇ-›,)ÔV’°ÊÓ…%š,§·0IWn°(ÿ~ÿÔ=ïVïÕF>h6e)ßWÚ¨M‹ÐUPì-\r{ˆ-,×Kµ®þd*’—•CGÖŒ?1%â:Åóøˆ³é´7èžÑioØ|´ ý‰HòŒOÑ$O¹¾sùÍþewò¿ààÎ4G<»JÔº\'8ƒ³rr€¾uÎ.º´_—ÜÍTÏ [4ªA\\?TX=Dul“v\ZZÃ†‰¯ýÁ†u¢í“#Œ&”h»õƒßVÝe€ùˆÊxUˆ\r“ØÆêÄÓ·ÅØ²vŒq”ø<L‹Pw¥ó*â-k3Þ°ž²þ4È%«>@rt€þ†Ÿs/þ–P×‡ÿÅÓÜ´äˆµzeKt€ëJØH\n)a£BÐèAÐV»È[&¡Np¥1ˆ_ÑJòclÝrTÔôrB\ZæêŒD-/{2w&¨¨²ê‡,{“vùdÑ‹ê‰-b>›¦¶Å×>¿ÎDG…¯UŽŸ±ÏEøqøäI¼ádì¬M(pÿO¡ÿ°•áV¾YŸåoà¸\0Ö‹‹e86Òä¯D¤”Q!e\'Œ[;±LÛ3YYOàÎRY~œMsˆYeN_t#„/´j\rvWwlSÝÅ%°w{‹£Pÿ2p¬ÙïØ~Çö[b›hX7¬âfå–±mºæ{·óÞíìÚíHämksÔÚK¢«™ï%ñ½$¾mI4à¼/žÞ½½¹pÜw<§)Êäói>›q‚ÆqÀ}äç\\®œ~EÌ÷…¤ƒ/¯Ôo áGËnS>ß•È`‹ui­2„¬2Ä]âK\n}Iü<ä”BBz×…6™âjšn®çÈ¶L±wˆ˜,ôUÐ5caà«2;”“UMIEƒ%EØ}#{¬‡èsžÎ¡*ñrÇÞÖIU5/Ir‘6Ënþx=WÂªVQ–¬9ò°yìŽ§¶ÆS\0–m*ð0±–æ£¦Ë….¾~ì»OÞ?Ý!šø¹PÚMÚZk–î\ZšILÍ4ÜC4‰x”ˆÅ8bw“6&ÄcŸ¬zµÀŸ´‹X/{±\0(Zøù&ím^,œŠª7~±x½ç5“l*_”s@ÜÏ×ìíSÕß®FT°%BÖqyïuæó0ðØóo†.¦Mà¿¿¿ÿ\\fÆ','2020-12-11 12:20:19'),(16260,8626,'audit/profiling','xœíZkOâJþî¯hø‚ž(t¦v:„“ ‹YO\\Ø#¸û…„Ží¨³ÛÛ•ÝøßÏÌ¥¬515ÊÜÞÛó¼s+%ù•‹TBÆÉ¤Òà@dˆõFJLRÉxÈ*\rŸè5\0\02-ÝpÐÁØ\r°ì˜¦ôŠ¥•%À\"¿81Ä“zCØTº#ñèJûp¨yq1/ãqD´p’þÈuœfÍ„yã$‡iìq\Zý‹†ÑÍ*òr¥øºqÅàÐ •	çÿbpô80‰…<ÙÖzK·m]×SÃ†e˜¶À”ºæ\ZR‚¤„¥—<–¦‰çú\rMê···õë,ê7,òã¤~Á|ö“_Eu!Ð±Ï³zšxõ–|ª®G•Üe˜ÁÔE—ãHi&ëhpÅ²>½XÏ»f!U2IÅhšªvQÓ¡³ÉHé(œzðw¥qÏ	’SG¶m5îsÓ¶ê|ÇZÓù64ó.°Í†ú9ç|C°ª÷±ûU;>?=ÕŽº§çŸ:=íø¬ûIs•þCeÉÄ]D5˜Ó!iäòcÌrv¸ÕïÔ­6\0PºÕÚÄ­x]Í­¶‰ßgª00¶•[ñ¼[-Ý~mŸ¶ú;šøûîk\"_¤YBy”\re>ØŸ«Æaô¬0a—,a‘Çüa&U^^=×}GŽG—qR©ý0U–Îšg2#=ê‘j­ž–x;ÿtO:E½¾³Élô±œ•ds!\\ëv”»ê³À<f4ˆ¯´¦¼¨¼{öÐswI×“žÖ‘ˆlu>,dÚbO\rµ\'y:·dA“iñ’NÒ•]”¿~lŸµ‹Çjj¾Ðì‚¦lWi£ÍCWÐbgjØclEuuŽqÕgc5Ù0×aíwÉIŒCMßNÉÉ’“oÃÉ5\'JlZït¢Ä#EJ\0æY	lÑé¤ÓkŸõµ“N¿ûtÙ¡íºI<Î˜»¯¹ã”%CîËG>’Ÿô½“ß	þL³aÈ²ëXÕ{	£óÝ=íKëô¼ÝÓv«²w=•KpžMê¬<ªî+´îkU`Ã\ZÀ5±+e@|îöúâ±\nu¨\0x\0€ :Nuï÷§iˆÙ•±¢ ›È\0pdcY-kÅ ‡±Ï‚4u[z¯ àÀ².êSzÃžGyÎªCÁ–hÃÎ˜\'þ’XK·ü!CZ´CÈIÔ›·Äx	Ha%l\Z<\nZjÜ&\r†\"cr¿¢1„<Rž?Xº©«¨ÁwÂÈâÝôÿ`$†Y²$äÛÒº‰UÔžœ;™h¶nÕþšnÍ%w\\-_ù¨r)â6«Ô‹6Û `!çÅé	éKœí³ïYÂÇaîlEòcù,)B?(@¿@y-xàràÿ›ë¿î_GeÓ,X2Éß¢Ç¹èz89ŸÆc¿BþLÔ@JäRV¹µ‚SÞžÊÔz,6…ù/šQ‘9Ý¤RlhÕÚÓ€Póô*h_oÅ\0/¦þì%Ø7;‚³ÔnÏƒ:Ë_ê7Lå˜¨w	îm‚êÀvÌ<“ãµÀ½fæ†–i•ë”Ý[F·éèXm“¡>nä ò8¹<N^õ8Y\"oÙ9²ªÛtÆwÛ)“b™·\r˜\'EP&Å2)þ©¤¸æJÑ€Ð(WŠeRÜrRD¦\rÕ&>9¿uVÏ?hõÛÏ®Rzí¾æúãD%·©×€nòíCˆÄXÎ¾ææï‘Czç6„XäW8;ã¾ÛÄ´6¼Žtt]ì£Þæò\\?oùòãõîÎ\\T>g\r\røÏ×¼&ø\ryìÈ#óv&BòÞ}*ú\nv}YXtRœÇÄàEt‘‘‘	~Ð\ZîÑ—_\0XÀÈßH„è\rè²æ]¡£CçÅ#µ’-%[^-–!f¶ûûûÿ\0²H”O','2020-12-11 12:20:19'),(16261,8627,'audit/request','xœåX{oÚJÿ*RVíÝü~!þpÀ¶€©1mz·+4¶pcl×6´Êwß3ã¦j{¯®vµ+¥µ=sÎœ÷ïœ¼l|Í\rÕh­#”oqÞê\"ƒ3¾>åÏ­¼@Å>ï\'nuCCä„.¬KF+ÃŸ÷8/n1\npFyÊs`k›äEÈ83Í€ùaãœÍ?DÎÛQâ£ˆ	ûg,Úà¸(Wà„iò%Œ\"Ô‘ÛóêŽç»Ì$Œ÷Gæ¨)+EzÍ˜i\Zá÷Ø{YTÛ¢Â¼zsëN\'×LÞcf„ýûä5ÓßfÉw4µÍµ%AãÚšÆ,Ð\ZeaÅÕªŒñ“¸\0ùl„ãM±%«¢Ñâ5•¼)Fù>NKíDÙhøXt¶Å.ºF Gè£ÌëÉÊßÏWwQ÷skë×álì ‡p]½°—Ö«i¼¹þ­ó%Õ.ÈÃMŒý-Š7¸ûÐóÄòDª\\kÇâØO‚0Þ”j\Z­Í—0½fQ-ð3ÚŽÚƒ`\Z% …ØX‹kœWªâ¸T¤>ÊGþ³ÄIYBÃ¦­:’ õ8J$œ|X<¦ô\\/<Ávd;vŸET[Tö“ä>,µáás~;_X‹ÅxÐ“yM’]9iÍû(à)àužÏ¯5QºÌÊÏ³uOÇ¬¯ì‰š.éâ	² A@¢(^ *‚(	œêK\nV=,bUÒµ€ã‘¼EUT$t%šü»RoBxpWâMO™,	•OX%»|µ+\nåöU4%N³L––Å{—½ãN”]þˆö‡0/9¯ÔAem’…›0¦>\"ÕR©Ñéü PTRqkœáŒ|IòÏðuHeu¢¤&\0Ó>ÝdP°lçØßg˜­Ê8§Q„œ§OÐñH\"u@ÄˆM“¬¬g£¥•áÖ.	@ÌC©INÖ1/#žãÕ J–#ÈA¦uÍóªÐæ5(KøT¦&Ø‘& Ö¢¨PÈ‘wì<9€ñ{óXIø À1•¬c\Zf˜Z\"€Lw»¿fx™%ðÐx†ÓY08ŽMÝ:³û4³û§ÌV@Zœ°y‘døš7šû×ÌnŸ`ÄŠÂ\0êéšIäXØòï{|+«*Èómvˆ|hôDzN­û ´ÌyXó548ÂÆç>òx1àEAP$Qñ<QR8ÁÃž/Kš¯\"ë2)*¶½N—¹…T°ãè‘ 4O$‚;Wa\0Õ½\0G¸ÀP*¸tPz†ãÙ ˜åu•c8Î <ñL—™Be›¤²OH®%•\0Ú\0tÐ´¬<yb\0ÆiHÖ¼\'!>Ð¤5\'‰k9à<!¤ÞZXëžè{(àTn‘¦jŠ¯‚qšÿ§*Ï\\/YTÜíáRNÆ3)qüwŸ×|}§©Ã7\nj*ï%Sžhh&I‰O$42ÿóe…‚]wÂ8ÀÇ:ñûº\nÒY¯è2\0àYŽ‹ÞÒ²\ZO²>ÙWè¬—°Câv*\\Ú\Z.À÷Eîw	ÃÇ\n—#(š‹Š¹ß¬FÉ;!§½z]ëZ.ÎQ†vg\rªú0Îæ ƒös¾ÃÅ6¡¥Íí…[)ææ\'Ö{eò’…ùÙ‚J†d¦¨Wn„9Õƒ†1®¬\"»øf¬¸I‚Çª4.|Ë¸¿Ú]€ÎA‡µÔ:iwhùöðOn³ièéïîQ¦Y\råõTe÷“}oû6:¼?HÉ2¾[Ü‡Ÿ‡/üáÀ›44W‹Ä?øƒO¿K¸ðYÎw¬ñÛ;K½Ù\\‰øûUåJ¾¡W2T3É—Ë½åù!É‚f;¿ÜÏðï<œM1¡(‘L`jS$Ì)~q”\\ÙGQG#=ú¯0³×«aì¤m+¹Z¥©\n!\"fU X›[§4µ¸>êdkÕ‰ÀÜ§§\'J¹°œw–CDH4%I·p¬ÁØ±úîjášîrQEZà¸ªãÜºî|u[åêÏ¢rÅ³i+sdÍÜÿØ4Ú·g.È_M¬ÙÈ½½œFIP=Í~ßš»ÿ3©À]¨¸²f}{0ž¾;˜>g˜˜³ÑBð3Ó©V±öÍþ­µ\"žsìÉ÷FÔÚ±î‡¹õK Òx½oÛoÆÖÿÅ ÚØl;ãÑxökã*ñ6ev¬¡åâýƒC«XçÆr>rÌµ\ZÏVéXpòÛ¥µpç“k“Iw«¡í¼75 o/$„/Pÿf¼È?·÷bX„—¨Ûµ«ŽJ|R§ú7„5ö½<Z´¨XËœ¬Æó—-%}Û,¡„4Að1q1ñvî…±qöÝ|ž6èKùIÿË’¤è´ýd#0„êÇAB©ê»C©ój1Í\0›Z. R\r³õ¶=tÁÈ¦Í”LÈ¡-µyÀÙöB¿f.Ç|’”ÿÌœZ?î\'.s0ø6ägDßÄì9ÖÔv­—PjlØýå”@ŒcÛnÝ°;(ë\0²P|&[‡®JáÕ°«4æ,šNpçBºXÃñÝ™IêÕ›¿ S8óÃ´¬i‚ ÿŒ81g6!ô_M¬úÎy8†^tæïoN/ávºMŸ¹«v%œ%I²ªÕj4ý{éLj–g¥OÌ™®õÞü\0UïZÎÐì[Õ]¯?\Zwø2·ÏRŠVU¿Äÿª14TgîžZî­=x6Ï¥`Ûù\0…Su«:iùïÒO]¾qWí*’#—žÑhÏ€ªž_& á¨e¹ã©µ\ZNl ²8Uå8Ž×Ûº —Æ•\'rzlKQ¶y8øå‚OéÐ\rI;²Ü‹ýÒ%ÿ«3%%¬ûxe¤~ÖÊ)[ÔÑ+m\Zçð¤UýéöNô)8]^ê‰N?jà`_}±$%»¸¸ÙQóìYãVrZ­ËûYó‹/O3\\ì³x™E\rš¼tå•i”¿	<=ýÀ„½‡','2020-12-11 12:20:20'),(16262,8627,'audit/db','xœíZëOã8ÿÎ_õKá­íÄÎ£êI]¶h9±í-·_*µ¦1#.IÙí®øßoì´¥T¨-\n%µ=ž×o&cÜÁÎÏÄ±œJ ’„_‹¤ÒàfÎOÏ¡ð¤P#qtæTzŸº_µ“‹³3í¸{vñ¹ÓÓNÎ»ŸµŸ¸^:a\ZOG•†ç`øµ| $Ø©L=oà^Ž£ à¡ë8ÿMD<•+õ†Ìi\"„°]³ŒR€Œ-w¨”Îp*Wž/*°…çú=ëß¾}«ß¤_¿¡ÅõKáŠÞuX^äHITOâq½%Ÿjw7w’\Zˆ}/’3ÁzCé}5	Ç©…rÃ‚k‘öù¥/zãpÅÓ©Œ}ž$j…¹¤MŠ)P¦Ó;%#q*GV\ZÒ„žc˜Ù5à+ÛÆ¢Ê8ë[ŒÚïÒ¬ºÅ,eVkÙ¬Ù`×öYû¸¿§ÁÏíxRGa’ÆÜÓaÈq¸4áO‚ðÙ`,®D,Â±p‡©yõôùžrœ^EqÀ¥ôÃDi:_žzÜ>Ê‘h­ž÷þêžvŠ¨nÅt¾ûD†¥\\ÌµnGÉ±¯>Ôó”ûÑµÖ„Í‹Æ»çÊý¤§=­#Ùê|\\±ÉlÅÚê@.,²t¦IN’Ùð\n\"iÊ‰²ï×Oíóvñ^MÍÉ.y\"ö•4jÓÌu+öfŠ=ú¦«KW}¶GÑ’-Ó²uó]Æ¤E-dÉ˜´Ë˜,còmbrÃ%&ø}†¤e’/Ç$6è´ÓkŸ÷µÓN¿û´èÐöGq4IÅèPM=W>zwò“ÿË¿Ë¿±\0k&é0éM¤æÇ±à©pGÚ?­³‹vOÛ¯Jêz\"Æ“ØK§u€ªVVµ*6I\r[5TÃ0†`àK·×‡Ç*Aar„±†‰CƒíêA>éêy‹ïÀ+….6¡h˜×Bú*\'3¶¦“ƒÈ~’ùº-­WàpÌXÞá0Ÿð{ñÜËKZ}€èhÁú{q.ÆQì®ðµ4Ë/R„Ò¼À\'^ˆ·¬‰x3HfÅl1\Z<2Z©yÍ(Ô!â‹”ÉP¼Ceç1 1Æ”²ì%‰É;‰ÈÇ”»^Dšˆ˜F‘eD¾qD2Ä:Jbc9\"\r:/[µ?f\'s<#-+|ÔY‰ŒšUîFÛLÝd¿\r­0¶+nÓØ›™±U”Ÿx¡+â\"ôãôÊ£0gel-TÈ€ÿw&ÿ\Z¸ßÈ†QP3Éï@q¤¦3äâøÏY\r$—AÆe-³5”˜Åí™Ì­\'pŽ(Ì?V^B‹ÔéÆí€{þ–Z-ÐnaF-CùŠîí›Ü¦nÛ/¦þì%Ø·;¡Æ¬Ø2—ÁNìÕ·¯\nõ[¦rÃ°­Ü%¸_ÜöÜÖFàÞ0sSl¿\\µ—è.Ñ½ºmÂà ¬ÔDËè¦6-o“ËÛäuo“%òV]#«¹-ßø”’2)–Iñõ“¢™Þ.“b™URÜ´R´¨YæÄ2\'¾nNÔ	6™RóÉõ-5ÊÅ—­~{~“Õk÷µ°K‡ªí1äé¨9Ç+Aó‹.Ï5É6ÍF‚jˆÔDóz€¬lmìØF0s*“;È¢•Âž— p’3ýŽ:æªN@>ÑÒ8ò}\'õÞ¬u¼+ÒŽÚyí@åËç\Zé90ÍÚû½+¦Û6Q°¢;‡Õ&3+f™¸DÕïŒ*¨ß²Sí“IŒè#¬ž4~ºæ-ß&9ÔFî$VeÓ¨	ˆ°\rÆ-¯Ó‘i˜0ˆ Š§Ã€Bf4‰Í–1h1bnÝàÍn¼ŒÃWiÜZÿ;óÊÛÝýã%yá³W>÷½»lq>A†nÓ,™Yo»³ŸEt½„Ýï;Àd»‡‡ÿ@•K','2020-12-11 12:20:20'),(16263,8627,'audit/log','xœíYÝoâ8ï_añB{j!v¾8‰íRmO]Ø+ôö	Bâ–\\óÑu’vÙUÿ÷;	„v¯¢Ý‡U+AM<ãùúÍØã8Óï	µh#dIâÜ°¤Ñq(&ô»Où ¡X§øq„’Ôá)ó\ZŸbøhð!@B0m,}òÀæ“‚”ÒøŽE‚PíxŠi*Š‚í–­k±%³CúýÑ§:ü²TÕªÎ£X¹\"]5@ú‡ágtvuqN‡W#tv9üˆfNæùé”E)_Îv©äÍ\'§q:‘Gé—Œñe­J6QÕB%\\:@îÑhãÚXVÔaÜ¾wxûáá¡½HÃ }Ï\"/æí9óØ7ÿ&jƒ<r\"•j\'Üm÷Ä¨u·¸ÜÀøÒ	V;Òñ×Yä¦à+1à†¥cg°‘»`¡#eÒ†8I\")ÌŠEQÄV¬À™.ï¤Ž„6Nþlt§Úª­ƒ‰Â©¤êTè†?ºAïß!wµEá2ùÐEœ¤]ÎÜŒ\'ñ4‰]ß	¦Þ¼ãÍ#\'dåDþ|Ëñjš?@ƒM,ÿŽ¾×–ð½Yõ½¡Ø€èþEÿt|€àïÖÍZ€$åŽ¥SáàãÊD…Ñ“‡œ]3Î\"—yÓT¨¼{ºÂ~ SÆ®c:Bûi\"--ÉSâµ	êwþ\Zžê¸nÙ²\\=ÅCƒp4H=åwy®“:A|ƒº°xÝóáåŠópëù\rD-è\rÞïX¤ 8’K	Â:Oç–liR<ÞÁ$\\¹Å\"ýûùCÿ²_¿Vy ÙÜIØ¡ÔF.š‡®†â 0l[˜nVj]óÉ\Zu${•C€¨²*Ñ¿WNZÄ24¹Élîq&0FýË1:Œ‡›{:œñ8KÙìÍ²„ñ©ï‰¡\'¾¯â?gàÏ$†,]ÄrÞåÌÍrv„þé]\\õGè°)¸Û‰(Ÿ~ºlVý¨y,ÁzŒšØ$-lµ”†g\n<ø4aØ$\nQN09ÁÁþLŠíæÑënaöD¥¬6Æ¦­˜EˆÕ]!6Œg†8Œ=$y¤ûÂw5áÆ†±n˜Oœ{ö4Æ£ÞArô€þž]27æÞŽHçÇ‡_bˆ®oÛrøJ½ª%* µ6Â&RØ$4YÚiyÍT	®5&Çð\ZCé:1Æ:¶I~èS«ù¨éå‰þ({\"uf(¯²ò‡({³nÓñBH¢½ê	GOÿ,te‡¯=v›r?s_Ë?ó#ñ:ðã\ZðÈãhËÉØZ™ãþï\\ÿgÀþeTÖ´šò,~Ç°¾[^áØJ__Šš)“\\Ê³0n<Ãˆ\"m/Da=ƒ3Kmù±¶Í!z9CÞ?ØÓªØ-L0‘B\0AìÄÞÝâHÔïnMS´7p¿û•Ám+¶iÈXÙUpë¶þÖî¼µ;Ïmwòvõ9rn¿š¨k6y+‰o%ñUK¢\r­*K\"Ù¸}ÓªB$4vM	|Ã<¨9èšÇ!Zõ€zðÓò2.RZOíõ¥«XŽRÙO>Å;QZ\nÑTl—\r=ÙÙí½°ãµšþüZhùüdÓ˜gÁÞÜÕÕ(å*åq0ž´GE#~ºzVg†nÿ3Ô-¨-ÑÊQ?¦&‘ Ùèˆth¹®>½ïûe+4êÑ§S©ÊÔIgÝuÐËNÉ÷f]²Ç]A]µ~9zjÒCGšÝÁÞÁz)¬9}“×º2ø­@e`%¿ö\"Vô5ª6n¼$¸Ê»®.9F³²Íº€[3Å†ÆÙVLÍ„Ù…1_NCç+€`Ó$¶Q… es_šº¾zS°†¯reeÕÜP¾ò•ÕË]¯êd[ù|;wÿÛK^îl Ž@Û©æ/@ÈFK`ÃÆÕs]–$(‘Çælù	Œ#6C/cbæür<:øøKí[h¼`¨¸m/°*d°Äz-áFJ¸û¥8ù{YÀ(…©{›kS:K3Íí·•`œ¡Œ{|üpoeš','2020-12-11 12:20:20'),(16264,8627,'audit/profiling','xœíZmoÚHþž_añ…ä”ÀîÚ»kqM‰šS\n½@®_ÀàMâ«_RÛ$¥UþûÍ®yK0…—V)`¼/3ÏÌ3ãÙ];¶nÿHlf—Dñ¤TólLL‚,ÕÛ°K©ˆRÍµQcf&&œŒB:˜r`’87\")Õ›öÏÖáŠÉ=8±Kí;záöþ6ŠÂPŒR/\nm-˜$_}û6JÒz,Fã8‰úI4ò¿ïkî0t1kÈî+íàßDðA`r¢Û¥‰çõÜaït1±<ÙW½1Cœ#„°U±¨¥#nAƒ!uÍ4tl*-\0H¯=&6…ëê½Wª·iàWïEèFqu(\\ñÝ»	« ’œ8c×K«I<ª6äUåîö®”™Ì÷B!Å<5Ñõ8TšÉvnDÚu†¾èŒnEà(™viä;I¢zðPÓ©ÓÉÒŒzòg©öøèÙ$Y¢Ô4j´½\Zßb›\Zßbìm\Z›Ô\"5õsÉø:DUçCû³vvuq¡¶/®>¶:ÚÙeû£6Pú÷E˜Æ“Á*«ñ’Aà„®m‹,:Ÿ›•½M‹2‹ iQ¶ET}•Eä··ITÝd¦2«¹lV†,°kó¢yÚ=ÐàïËh\\T‘¤±ã…i_¦‚ã¥„ÏnÆâZÄ\"	·ŸJ•×7/\r?PŽóÂë(©}?QHgÝS™Œz$Z££Å£ƒ¿Úç­¼Q_Äd6ûX>dw®µ[JCõ™oä¤ŽÝhu˜<ï~ûr>òpÍÐóŽÖ’Œl´Þ¯™dÚãHMu$;æY:C²¢ÉôöšAÒ”+C”}?h^6óçªk.h6tq¨´Q“f®Ëéq0¶ð-4——\"®ülŽ¼.[¦9¨Hø›ŒI“šÈ”1i1YÄä¯‰É\r”˜à·’&\'*$1^ŽIÌaÐy«Ó¼ìjç­nûiÑ¡âhœŠÁ±6\'\"î{®¼ôîä§ó¯óM~Ç¬™¤ý@¤·‘jÅÂI…;8Òþi\\\\5;ÚaYŽ®&²ööÒI¨ê…åcÅÕc­Œ9©`³Ë1¸‡àÆ§v§—e‚:Áäc\r› [å£ÿ_1M,¾¬Täº˜CÑ0«…ôuNfì•N\"WøIæë¦´^ŽÃ1c«‡öÄ¹Ï½¼„êDGúß‹K1Šbw¯¥Y~JWq€œx®Þ2ø:Ö“ÂzJX/Ô[Z‹‹ì3\nuˆø<0‹wÆ¶‰1¦”eILÞHDæ/£_ŽHŽ7Šˆ,\"òG$C©¥$~²ãdÐYÙªý1]™ËàhYá£~ÈJdP/;n\0a´Ý²€ëœaüR4P´ÆØ®ø’ÆÞ8ÈŒ­¢üÌ]ç±ç°X…+VÆæBFü¿3ý_ÁûÝ¨l95“ü\r#®`è»ÉÕÔ+ñòg¢zRJ/“ò*’³W€˜Æí…Ì­g°ŽÈÍ?æ*Bóà´ãfàxþ–¨æl71›n¯bº¶oVpsÝ²^LýÙ²oGvBi±Å—ÉN¬õ»¯Šõ[¦rÃ°Ì‚Ü¹÷KnkNns#ro˜¹)¶^®ÚvìÞŠÝa°PV0Ñ2»©E‹Ýäb7ùµ»É’yë¶‘UÛ–O|JI‘‹¤¸ÿ¤È³ÅÁER,’âÏJŠ›VŠ&åEN,râ~s¢N0g\næ“í[ÊíÒÕ§÷ns¶“ÕivµˆKûêØ£ï¤ƒúŒ¯Í6º<wP\'Û6TAÄ Íê²öhcÇ>0r|€™]\ZßA&æ‚ÂÉŠéwtÂÁ×äàŒ–Æ‘ï‹8©v¦ÇQ§ó{yè¨µŠP(_>G¤¯iz,0·ß‹´bº•½	IèÎiµÉ‰™¢39.Xõ;³\nê·lUûdC#º Õ“ƒ_Å®Ù‘okw«²iPFXcÈ’ÛéˆZ³—ßûó\rX™‘‹-sÐd„oÝàÉn¼ÌÃ½Üš9ïÎìùàvw/þP²ª|öÈw|ïû.8ŸÐŽ C·h–ÌÌ_O»³ŸIt½ ÝïD;àd»ÇÇÿ\0Ê\0š(','2020-12-11 12:20:20'),(16265,8628,'audit/request','xœåXms›Fþ+Œf2·B¼„Æ0B/cI¨€§MGsÀI¢–€\0’•düß»w€$Ûª“´Ú™~°áööv÷ž}Hýk®«zc¹Aù\Zç.Òyýëc®¼ÞÈTìr3	q£é\"Ïw.ëÚá¼bâŒžD\"¶ÖI^4€M™iL(ˆ’çlžÚà¼µI´!,DÃ.Ç‹V8.J\nH˜$_¢ÍqJ‹gÞÞ	B—GñîÀ´ö¢-_1Fšnð{ìßF§HjKj3oo‡ÞdÜd6Ñ=f8¸O®s%[Ìij‹oÉ¢Æ·4qÑeQuŠ(lë\r8-µKŠÞ(ð¡àÖÅvÓD \'\nPæsBùùðœºÝt?]ó­N3ÚÂ8´–ÕëöÓššÆ«æOÜO”U{\" V1Y|Ö(^áîþÚ—J‰Ô¥¶ŽÅq„Q¼*ÍÔ«/QÚdB^+ð3Þ\rˆÚbêàì-·‰óÊT—†Ô¢¬1$q‘%Ô-½±Eâ”k¾Â(H’û¨(Àr6œ¹–ëŽz×È¤PD±-Kmß—ä6/úØYTÔá»Ì\"È³åµ‚|)M\ZêˆKÁ—‘jò’—¥¥ò¾„j‹þR\\v|)ðQÈ«ü#MÕÚ\nâµ\0½‘þÞ¨7<ø7ÒMO…D‘ê€\'PÉ®PíJb¹m,ç,*nv®$£©œ8Á»O¿jAg«©ýÛ6*O¾Q{ä‚*‰î%ÎpFV2Àº.ŠTç¸W‚™#QÌm’USŒàÐ.]elç8Øe˜­R&§°ë\r>Ë»L²”…i’•¹£74\n½ =e\05ûÒ0È·¯t°  Ô°rÜô \r¥u~	ªØ4HPøX†	Ü#MÀ¬³ì¥E€ˆ¼cgÉ\\>do>×\"ÀÛ‹mSácÒ(Ãô&\"èôÖ»&#t˜i²‡‡&0¼¦+¢ÎóÌ`âÕQfÒ(3OQÖmqÂæE’á&o4›Ìv—p‰=ÚD!Äv“I¡ °°Ü_ó°(«E›³­¶ˆ,4*‘Ê©!\"\n¡¶°Þç´_ù,Ã»¤]–ãâzîõYDðIvUNµËúÄ¡pÅ\\‡øp,\Z$ÉBUˆï‹,Úm?îU*m\0Û9i	º^Qo¯j+Kâeh{V€i¨‹8#Å²rèÚâbPwªË«ŠrãÖù:_fg•ú¤Ä×ZQîÒàc\\Ýˆì’@ŽUþ&	?Ÿ¬Ñ®å¼³B’iÕ\'AåX½‘c™ÞÂõoîVöAÇ¨sèy³ÅÐv½ïí\rJufÚÆÀšzÿJƒ 8P;Ó´fÞ±MˆüÖÔ´{£éà/{Åócc:˜ÄßÓ0´ê¨i˜CkaÚSÏ±Ç—ºÆ8Ó¶oGÖÿ¢w\\¦wv¬¾åù›Dª=4Ÿ\r£g-FS×2çŽ’™[®çž·‘£?ï}Ûyo8=«GÞ.õ\0â…Ü?™ÏÏlÇ{Ò¹Dñ—c{6¥Ä¤¸Œu…¹ÜçÈZq,c¼Í.ßØf†7¤­îˆ	Ú¹ÅúÙú¸<mÐ—rIÿeIRp­ ÙB?Wíq&”«î¥Íw4˜BthÄƒIu1«·í¾—¤»\\ÝHI»âÄ–Ü šõ°¡øŠyÚsI.Uç§ÆÄúÞz:eôz/£AyÆôÂ‡dÏ±&¶g]Ð®+LÏ6ç¨ÐÇ¶ËIàÞ£Œ{xx U’ºÚuU/\\¨ åeÎÂ0ªbÝy.Vtw†#	½zótŠg8LFÓºŽý\'\nC\01gV8ô÷£¯Lgu±?\Z[çx¿^Ž­t>ƒ«†dÉ²¢jµÇ.9wÆG›/dc`xÖ{ãä¾g9}Ã´ªñËŒ8¡Œð³À¢¹e–µ¸*ÒG®3Ð\'–7´{OÇbì: y;Uã¨#W8;£×mŽÈÕ¨‘py\n’F;\0$ø¸™x¦Öè&Ö¢?¶\r03„$ãU•çy‘oñméˆè‰•üF=1•q…²Õþ4¼”„€0Ò)§ÆàlF+áÙ´S÷/¤Óa§sÖÂ(Œd~ûF\'«B¶š2gàÚÿ¸­{\":Ëd\0•Mßj\\0íÖ/‰s÷ÉÜI¯gOéˆW}X,–åøxü> b†‹]Ï³Í«¡!Ö(¤ªrYÎ¼9Œú!ü˜ŠWÎ?>þ	KùÔ','2020-12-11 12:20:20'),(16266,8628,'audit/db','xœíZ[OÛH~çWŒòT@ææÛ+QH[V¬’°h¥H‰‰ð6vXÛáÒŠÿ¾gÆ$8Ä%ÒFA†¹9ß¹ø;c<—¸ß×vK¡JïB%¥ŠçÛý¸´„nàJâRÇ-5¿ÔOÑ§“£#´_?:9®5Ñ§Fýu‡‰Š»¥Jàø±1|P½‚¸¥» hûgíýAz‘ïºÿ\rU|§g²Šï¥ÄS¼ƒ!‰ý\\KÏdz®¥ÆÝÒyÐW%ØÑ²ÜRùÚ‹Ë777åË4ì—¯Uäâ²¯¾¦q0Ë nëã”Ã¯úIùÚ;W—Wz9ìÔ\"¥Å[–S1ZŸ£^\Z\"=.µ¤È¯G™0·Ôë{I¢Û”Uùè%j–\\«†ê\rbÿaãôîÊ¬¢nÉuK•û{\r_à:S*xþs¡éˆ¹Ð””°eD“‡4í<š–Û7«GÕýÖ\Z‚¯¯½áNo%iìQÚ‰¼PmåúÃ0zÒ«s«¨§üNêõÕìáÜò5c¯ :Ä¡§Õî$½Kz£éiàõ;çHÐ^Å½µ?ë‡µ¢U_ÕÝh÷¡ŽD=„£zÍœcÃ|¨×óR¯?¸@»°yQ½1^¹1céaÕ´#îÕflò0cÓlµ©\'!i2u’‡î‹4”SK¾§_ªjñ^»È‡“ûl˜Ó˜M3ÓÌX{PìÑ¶0¼®={ýÉâ‰±Sš´¹í,cJs¬£ÐYEá*\nVÎù(´‰µ”ÄBJG˜ $$…Œ‚}È\n”™±øÝ]º`bsl/cb³\0R;Ã”Îé\\nJ0&“eÄÔ8#À„O`*f3`oèiRw|·XYA0³ö<¬|¬gÊWß‚‹(ƒÕ«œÄ½òžn ªY÷ª&\\¨´¥3[ÓdÅ§è™S)ŠÔxé$®Û<â\nš9£§0±vNåË‰*\'@c¨AUæQØY‘›¹y)¹ÉÜ,Ž“Ÿ²`²ãLþ@Áñ›†%%Â„¥½\nËUX¾OXÎû¨R,iTBqe–ç£’Øí°Ö¬6Zè°ÖªO´ÑÃTu·2\ZÝúÍàJzÿz·úw¬\0Ï$í„*½˜ñ^¬¼TùÝMô÷ÞÑIµ‰6LyXöü0ˆÊ@[Õíú¢[hHºCì€:0t|®¶ µNÁÛ„n‚…#Ã÷úætÊeÓ¶U·ª\'.´®#%]6Ë¼B¼Ð¼ìÝX¹ªa+05bÚÔ0žx×‹xce\rËOR\nô)=@N<>^^¾5ÖÖÂÚFX;Ô~4S/ú–ñÇ()T&sßWT&_eCÁ²ë\0J~÷P|L³/EBW¡¸\nÅwEF˜°vlâŸß\"í×Oj­›¯öþ”P‹p:*ÉéLß\'?~t¨›$ÒEnÏ\nn‘\0á›Àº1Å1¬L!ÍÌÚ§ã)X;¼|Áé7¦ñ ßW18¼ÖaÜQHšè·Åã)=œœû>Ã–8ã¶[âsøÅ|ä“Z\\:ÎÊ/~e¿°¨E³|1ñ?–˜që\\oTèã?ãqÇK»è ÚÜGG‡Ç‡-Dñ¢ÉDp¾rš_Ûi„Èn©|m§™7ÓØY9Í/í4BB¹ª•cõºjüu°×ª>)šÕêúÃØÜVuwñ£Ò!6†jC2Æ¡U8ˆï:!”\n»DJŠûä_‹Ù‚Ú–ØÌ±9¶žç6oÂëí‚Û”7æõ¯wdø”mÞñyýàÛk2à	?“„sNÍ;?FÞÁÏæ¬9&Üb+7ûÜÌ¦÷ÿkš¡É','2020-12-11 12:20:20'),(16267,8628,'audit/log','xœíYëOã8ÿÎ_aõ°\ZÛq®8©@÷¶\'hWmYtR¥6MLÉ‘›lwÅÿ~ã¤”&Ç¡Âé-¢©‰ÇóøÍxfl,Žù˜¼æ‹8¶¦\"®5,Ž)ÿárFZ>ˆ9f¼Ö7PœXQ\"œZÃå>*|Ìk3×>ˆÉpNÊyx\'IHÇš¢ëŠ¢åH1)!,[lq…ÿxt¹üË ”0b4%ç‚tb‚ôOÝ+ôñòüvÏ//:}ô±×½@ã4Ñ¸Jg2<\r}ß\nÎ¿¦\"š•êÂC3çÊà…éL£òÚµë‰\Z°d€@ýÞŠêõ›Ä÷ê÷\"pÂ¨îˆÛ$rS¿É¡T§î‡Žðâú%Œînîäràä¹ò3æ×i`\'\0“œ×¥¤Àé¹0^³=+Žå˜Ð¥-\'V,š°ä^ô„FÎœq2»ËV^ã¼Öxœ£i*;%š¤ˆ¦t]ð‹LÑÙ	²Ã ™ù³ø«ÇoÂ89Ž„Fq8ŠCÛµ¼‘3i8“ÀòÅb\"¿<-\0¿ä[ÌTé»DÞ$JÇzyfÊmÔ:ovüÜÚéÀ\'‘åÉHÂ{P˜ðR?xò2×\"-œQbM<Q=]X¾“í7¸#ß’fbûFøÖ‚<‘^é£fEöÎÝv§lÕ­˜-¸§2gHrŽºL½ìYbžm%–NÑ10/{ßí-WîU,m÷QG¦€fç¬‚Éœb?cµ/	ËÎ-ÙÐdþºb‘„rcI†ïÕ§V¯UÎë9 ÙÂg/Ó&cš»®„bgnØÊ·0½+#{÷Éâµ¹íÒŸn(ø=¦?¬cSË‹ÉZ-£t±	Ñ‡bA¹Ç®3>&ÛAj\Z*{2Ý j)]ƒT«.ÐVê¸É²L4ÛªNc…2ý¨j¨áˆïî4ÈAÍ”ªÇ‘]oÊQ	¦,ÜÀÁT$¹ûÙö}Š-ÖK\nà&ª‡¿­PÃLªP’ÁªaÕóW½øU/^Z/\n;®ªlI¶Û”*Uñ»Ü”*&¶£Ü”æÚQHníN¿Õ vgÐ]Ïpho…i\"ÆyUA5¡{\'ŸÖ_Ö7ù	À3NF¾HnÂlÞŽ„gªñ>úÒ<¿lõÑ^VÙë–ã»AÒ¸ø¶{€ÈÚÅ:9ÂÆ@/xñ{k\0£]î8Ääc„	\'\nüîîÿc{>w­ø\r}\"J	é]Zå]M{¡wçÅ,srK¢Vâi¬i›ž†ùØºß®žeNÎÏ—ÿ‰!ŒmÚr¢¥zEK(„ÖBØP\nfÂ†¹ áJP¥]ä-·%¸Ô˜<z_Ñ˜bÓ1#D3²®ƒ¬d‰¾läN»—ÁÞ‡ý×ºÀ„)º±háHeèãßÂÝ»â!.nè²¨§%\0üà:á6Ò\ZË\r’µ`xµ$)²<Þõh•*‰BÏÄ»´átù¢4O“Š¨Ã£\r;Ì‚+¾Ï$h(<LÍ4ak§l­¢¿ïöÎZ=tòç2ÝŽ¬dŒÎZýStÞ¾hQ¶Œ\rcü+fþÏ1Ã(%ù•˜QŒØ5m[Ä1JBäˆI:Š¹1ŒW8ÈI…œiF–ãD’`p¦é\ZÜ4¯êòZ­@,–%[[„Y„×ÜŠLàð\"tROp=Œ}›kSfÔÔáëÙ0£›Å,&ÏšA×}è:K¼ —Ÿ$Á\'¡3ÛðYÝù~ö/*·?w(éØÀŒæég­?4Á¬ËÏgÍAëIgØo\rÐØI£ìp4>OÝÄ†Âˆ¦SªBè?Œf#ºÄc¬ëàeªo%ÛµtÔ4((þlŽz“–Î(iÞß¸¥{½“+	)#»b±<÷ûk6?OÂLÅŒew”ü¤K…YÞ‡­þÝÆi*ƒ½úøøø73s«','2020-12-11 12:20:20'),(16268,8628,'audit/profiling','xœíZmOã8þÎ¯°ú8Aë—ÄNRqÝ[Nl{jË­NªÔ†Ä@n›„MRXvÅ¿±CÛ”¦ÇÒÂ¾TE\"¿ÍÌãû;®Ãœ¯©ÃJ(Ã8¹«Ô‡A1a¼ž:†SÉ‚PVê¾ƒ«Ì Â2m,„a2Nƒ–ê˜¦î¥L+u×¡Øù\Z8Þ¸zÁÐBP§Òº–Q]¢ã7È‹£HzYG\nïÒOCç*N³ƒDz£$ûiìî°ïŸ×ýóÈ\rå¸\"/×ÚÁ¯…áAapÊœÊ]ôüóÞÑt`\'yª-½	…1ÆW±mÚÂ‚r$¹‚®c*\0ÀÐ‹`†¦Ži:•Ú›ÔnookWY8¬ÝÈÈ“š/?fI0\nk ‘îR™ÔÂØ—Ã´vïÕë«ëJÙ0ˆ¤ošvÑÅ(Òš©z¡$E~+Ê…9oè¦ieÖ˜7n*¡ËlK/Nü‡³»kÝ uœJýþd€ÛÄ4Œú}nÙ«Boó%¡çœÛö\ZbO°A­ëØSÛ©tÞµ> ·g§§è¨uzö¾ÙAoÛ­÷h ÔÌû2)\0\Z†nä;Î§‘ÌcrNAÌµD“R®=™/…æÔ=Ÿ…¦ „­#šŒØùº`Ñ4m¾Ó8mu·ü|ôFUXÒ,qƒ(ë«àß+TGaô¨0‘2‘‘\'ý~æžåâêB÷-=_At\'¡«Ìî§Þ•ÝqóL-?S=RtØA‰·õgë¤YÖë£¼>RjÂQ«©õØÑÏó<7s‡ñ%:€ÁËÊ[íIÏ]O:¨©ñ°y¼`‡»z¨]Õ°éÜ’9MŠtRPÎuÑø~x×h7ÊÇ:@>hvî³£µÑƒæSWÒbëÁ°éÜBõ¶òìíGgêV\\Ò„eXk¹CXE¡½‰ÂM~¯(\\r+´ˆ¹–ÄB›ë $¤…ŒƒýV$(ŸÆAàèŠ›mC_CLM€ÔÊ1¥Kcº”›Œ	ä¨ëˆ©ÅqN€ÉL.ÇøbìŽü ëÃÒÜ­–VÌL›=\r«±\0ÖséË/Áe”ÃªÕª¥‰W;To%¨*Ö=‡*—2ëª•­£WÅÇèQ’zÎãºÿûW°ÌïÂÄ\\Ø%ýÕXOT\r4Fg¿DQåØÞ›\r¹y.¹)Ü\"ŽSl²âbg0ñ\r	Ç/\Z–”p–Ö&,7aùcÂrÙ­’¾¦Q	É•Þ,).F%á0ÚI³ÓhwÑI³Ûš%hgÄ£Lör\ZÝú¯ÁµzºÿºŸÕßDžiÖevëz/‘n&ýÁ.úûðô¬ÑA;:=¬¹~D5 ­òóö¢{h›Z%V ‡4ºð¶Ma:ö	Ý\'ª®v(ÞÞýÿ+˜‡¹•Ÿ¥\Z—Î®Í	/ºlÑôrþÌé}`ïz–\n¶’©&œÏO5Ô§îÍj^Ï²‚å;	úœ \'™¨W´„o…õ”°žÖËõ¦‚ÚE_3þ%¥Æäîû‚Æ³,aÈY~@É¯ŠåWrO‡\"!6Ç›PÜ„âEF·´u3P19E:j5»;¿í¾Øý)¡&1è8%§}Ÿ|ûùÑM oÓbH—¹=+9E„oèÆÇ0sƒ3ë}˜4)Á²ÜáÅ3´Þ˜%ñp(pxeÃÑ¤ ”4Ñn†\'svØ;¦ã>Á–fX\\älÉXÂ/–#ŸÔ4Ää3…_ü”~aR“æëÅÌ7&_pêÜj7ÚèÍ?“¸ïftÜè¡Ó“÷\']Dñª‹	7ŒÓüÜNÃy~úKÅK;Í²+e“ÓüÔNÃ¤«Ê86“¯Û`ÖÙ_Ç‡ÝÆ£ô Óè¢?JôiÕà\0W6±0d‚1Rü+Ë~©ÂÁø;Ëâµ˜Å©µbŠÍlËÀæÓÜæUx½UršòÊ¼þåŽ‚ÌŸ²ôŸ;¾¼$žñ3AÃ úÎ‘àgKæ&†É6nö¹™L\nîÿ¹.¦6','2020-12-11 12:20:20'),(16269,8629,'audit/request','xœåXo›Jþ+ÈR¤ö®1/cc\"kE0vhã‹q›v»BŒmn0ÀŽÛªÿ}ÏØ‰ïm£jÒJI`fÎ9ó÷!Hdõ[®öÕÖ*Bùç­K¤òê·ï¹*ðj+/P±Ëõ$À­ËP•xñö»j+Ã;œ×8£<¥8Ú$yÑ2d¦!?Lbœ³yâ‡(Ây\'J|rÃ.Ç‹Ö8.Êp›|\r£qr‡gÞÜ	Â%3\rãÝ9(=·×}Ëhi\ZáØ»	N–ú©Ç¼¹¹vn§m&\nï13Áþ}ò–Ñ7Y²ÅœÒïð®¨ðEah…²°âjUÊøI\\Àýl„ãu±¡ØÕÖ@!/=µ…|§%8IV[>Ü¦ØFm0B w ;;<ßÝF—C¾3h‡[P‘CûpU½>b/­wÓxÝþû’*\'òpã€Åƒâ5¾Ü=©”HñÈ5:Ç~„ñº„©¶Ö_Ã´ÍœZàg´ˆÚÁÅTQ ×‹6Î+¨8.Ô¢|äo0Kl”%ÔkµµEâ³!O‰Ä\'_R*WÆK°ì*É¶ì.‹(ZTö“ä>,Ñ°œ_ÏÆbaŽ†È¤@D±×•zž\'u{¼èaÏ—»ŠßGþ’qý<[\reäIÀTÐ@\\	^	Ò]ñ]i%¼\'!„z¢·WOò=ð}~…‘ÒWz~Ä+>º4~/úW!<øé*‡§L¶D‘ÞOØ%§Bu*‰å±¶Z²¨¸:Xã¥œ˜³nbûï>)þ`«ôÇ7=Tr^ôG•¶I®Ã˜Úˆ$KQ¤*Çý Oú$áV8ÃYÉÂÏðq$±8lÃ˜ã\0¨!\nvé:ƒ¬eÃ8Çþ.Ãl•Ë9õ¥Úèˆ¿QžbÓ$+ªÄPJ§+§pÙ¾„GÂ—X‘Àý \n™Üƒ\"6LëÄúbGP 7áÂïe€‚6i°ŽÊJT\"òŽ\'`‚€½úR‹€P\"Ñ1••ŒC\Zf˜j\"ÂÎf×f„3KöðP†WTYTyž™Ü:u|ë4¾õ§øîÁmqÂæE’á6o4ÚÌv— ÄEa\0YÕfR¨t,ù÷CV`ÊjQ¹zž¡õ‘…B%R9Õrš”™ñ‹%–Ñ«ÜsªÜ»GUê’Ò‘å¸.1«PSK\'»ª.ôË\\	p„ËZù\Z„@àû\"wÛÏ„üsU\"pÓg°êÍ†ª–Œ#*ëÍÛ\Zg¹;GÚ–Cýª|t]\nnF€3õH¥\r`lq±IhbskáTðÂ\\û<*„nÌ6údcLšZ½Cb6Ì4ênŒ+ýÈ)‰@¡ékWIð…@êè«lÌ8¯­o@g£Gšp{Y¯Œbgcó£è¡÷°¼û}²7[¡øš²ñU‚Mþà^}îgïÛïeÞ—3\'ˆß]Êa·Zzš;1cá0ú}œ„ëwëi?µOG˜B`Š„9±8õ>…A0ý{Ð‡àÑïÔ-Ã~oØäþn™Í€À6F¦mèŽ»p4g¹¨,%ò|U-®gî^W¾þ™IB®x–p›«MŒ™ó_\'tkæÀýîÔ˜Mœë“q‚„…©éº1wþ‡\n‘?è\Z3Ý\Z™³ÉŸNÏ¦Úl²üÌx¡T¬º¦_.1œmMÿlÆ¨íê|œ¯ÊÁÆêºeÝ˜ÆÿÅ¤ÑèlÙæÄœ½nÞ Ö¦Ì¶16l’»¿Ô¤¤:B–ó‰­×œ-}i ÿ÷¥±pÇ£GOwîØ²?höÈ‘·ssqäêWŽ³üsËvN¦Q<Ge[ŽUµ%b™:à_ÖðülDJFÅbÚÔ5çç5%ÍO+ë‰z¥3®´yî…±z´n–Oô¥\\Ò?Y’\\ÇO¶0Ã€Ãö8JU%fwaNfP mš4\0©®µõ±5v@É&µ”Œ8œØév(¶#ì…(~ËœÎi$4+þ™vkül…âÒF£—Ñ ?#záCrf·–cœÐ«+ÜÈÒ—·¤ÐØ–åÔý”Û£ŒƒúB«4)´µëªvPÁJeŽÂ¡iw„‹16ïŽìHB¯>|Åâ‘nËÌ&uôqÂ  \0#æÌ:‡þ³ñ•n›P—Ç&4¤#{¿^&l\'Ý¤ÏÌU›du»ò€¯Á7M,`„VnW}´ƒa·†ÛÐ-íi\r—;;t­\'šc|Ð>B‘p{¬éF5Ûë“ÊT8Š@š„zÙ4ªnÒPyçÖp®­Ñ³’`û+èÂÿÒ6ëô~‰üïÇ•µkK“;5¬B…éø<1O}¯cÞ\Zîxji\08€Ääû}žçÅ^‡—`Xâ…ÆÂOää5O„¥J([ïOFîFÍïõ¹OùÈ\ZtœN3/Š„´u<¦7&üÏO”t ¬Û8lßè¬ÐtrZˆÈ·Æ\ZzÎ\rlô¨_îîOiß\'ÙÄ¨%¦õoP¯þ<#¹ºxúO\\Ÿ„;¨gÍšï\"ØrÝUùuS¹¶òïC ·²BýMãº.vY¼Ì¢¦²œkÓ]BJ\\ªbÕÊO¶¾zø®ö‹¿ä?¾Â†4Ìlƒ£èPÀ³Ëw01\'äãà_‹Õ9è','2020-12-11 12:20:26'),(16270,8629,'audit/db','xœíZmsÚ8þž_ááÉMz±eÉLn&Mé47)ô¹~a¬$¾ú%µMZÚé¿•LÀ€¹4Ð4S†Ì„(–V«}´ÏjWÆu°ó-u¸S	ešº72­4\\sç›ïXÐbª\Z©C„Sé¼m0Þ\\žŸ§íóËw­Žñæ¢ýÎŒR™*\rßÁðË|%ÊØ÷{ÞUï4C7òçÓH&c5’6<3dÛ!Âj‹*iSiÏuºŽ¥–f:•k?˜Ñ²œJýÞMêŸ?®ßfaP¿—‘\'uO~ÌÖA9RË©‡±\'ƒ´~	íÚÝí‡™?’J½e‰†¶úz\r3?ŽT¿­4E^;Ê•9•aà¦©j:5å•›Ê¹—r\'Þdâl|§¥ˆSqœJãûwŸïŒ˜)Xþek¡	²ë I‘Å6ÂI¶5œ¼§%`úNó¼yÚÝ3àçãpTÆQš%®eýÈ\råa¡#…ÑÂÃD^ËDFCéõ3÷*«»â{zÃüè:NBW™ÝO‡·2t†g¾ôgëH“Ž‘÷þjŸµÊ¤>ÊñÃì#EE5”í–^Ç¾þ,1oèfnßÇ0yÙóöÅTr…èYÇh)O<i½^1ÉdÄžê@\r,C:·di%“Ç+„”K\"\Zßo›Íò¹Ž\rVvî³¯W£\'Í·®dÄÞÄ°ÙÞBwUyvuAx®oÃ˜Fc[ÔlA,ÍB±cáŽ…¿Š…ëž…b;IÈÉä(Ä¸ÈBJHhüQÌ(Œ|¾78&6‹ÛÖBjq*LSCJÖ†tM/eÈÜF/µ¢„kHÍ9HÙêØy~Ö‡ÀŒ7­*{<6W€z%=ùÕ¿‰rPõ¢êi2¬Ÿ¨V	¦ÓeL1¸‘YWEµŽŽˆ‹Øb»`PÉ©è<ªGÎPU1M›hX­M`]ÏY¡Z3­íÖ$‹X»,Cb—Ûìr›§æ6Î­JqŠC6‹vp.{;Y‰á\\ÎO¾cåŽ•/ÃÊuKŽìm=,	å:_&¨HKÌ€–g­Nó¢kœµºíùÜÃØ$ñ(“ƒÃ<îCúMÿN}ºÿº_ÔßD iÖevëþa\"ÝLzƒãŸ“óËfÇØ×ÕaÝõB?‚8™¬\ZäÐ¨b›Ô0¯¡\Z†¼owºÐ¬DÐ&G˜À¢ÂªËA—.o¯ü\"‡°æÒ\r¶l†rwºjƒ{âOx½ÏM\\ÉfcÆ–7úS÷~³^ï³‚åbYËv€ždº¼¢%|õAYO)ëie½\\Qo¦h¥]ä9H	.5&wàŸhL±Ð/¤dRiüû“qkŸHF[XÓÒdGÆ_ŠŒ6¥úrŽÐ¹úÜzü&©jnZpÛfHúñË¤7~ä•Þ#A°/øv¼|‡„ùÔ„ÜÝÿÎ×ÿo·ñ/2Ç,‰ƒ@&àí**N”Øa\nR’5‘üBLÝ¡½\ZŸ-¹>„¬ÊƒæžRÚËqz’§?£M¸äŽOä&½S½h‰í)(ì-(|$7ÄŒXb’š0`Íœ[ ÂwØ1àE@M–¿%%sßý  ä50 Û\\åÿæÆ%‰ üñ›ïgž”8SØªÄp‰bÿ›ÍðeÈÌïÀ‰½&¾ëf™›Ô~ôuÍo/E8÷ß¹×üF^¾}øÎ—f×x£D_n\rŽQ\r1LÁ¹Å™	uC(Ã8÷C¨+ŽÁK‰09/îgDlêü„˜³wiä×–\0¼äòå™K€Ÿwsd•8×ÑÒ\rü¯?3Yžw4›3ÄuåJÑK8ÚÚQÀ6§_²ÛùÙïàgB¾ÿ¤¸X','2020-12-11 12:20:26'),(16271,8629,'audit/log','xœíXßOã8~ç¯°úR8A;‰“¸â¤]-+h9Zn_*µibJŽü`¶‹øßoœ´%mÒeQaÐ\"µ5öØ3óÍŒ¿Il†ÙcÌLVxÛS×Z6Ã„=zLÍ1Ã:«õAÄ‹B\'¶H¸[kyÃGƒ‚YmæyÃ>ÎE‹îx(Õ–Ë0UCQBŠebË´²Ý6SØã“ÇtøÏTUjP³õ$.¨\'¨ÿÜûŠ>]¡ãÞÙÕy·>]öÎÑ8¹o2Æ£ °C—±o)³\nc°‚±IÆà…ïºDFcµkÏç58Rš÷¶h><<4o’ÀoÞóÐDÓå·‰ðÒ 	\nÉ4§D.÷ãæŒw7wr;œä{!—úuÝje _§¡“\0NrÝšB·æÊXÍñí8–c¢.}9²cÞ†-÷ü’;‘pç\'³»la5Æj­§9š–bêª©I4IMäz/œ¢“#äDaÈ3;\nfñ7ŸÝDqr(¸“Š8\ZÅ‘ãÙþÈ´ÜIh|±Ï—€WÀ/ÏÝ”\0=ÑÔˆ¼¥jš\"‘7ŠÈë–¬£ÎYçx°ƒàïÖI\0œÛ“‘„w¿°à§A¸6)ø5<t¸;Jì‰Ï7/¶ïd•â…×‘léö(vnx`/Äàg;bÔî#áì|év«vÝòÙâôT^\ZR”£^7³c7û®pÏ±Û¦è¯šï].wînØzÚG]y´»\'™KìeGíIÁ*¤sOJ–Ì§7l’P–¶dø~ýÜ¹ìTŸuˆ\\°lé³›Y“š‡®BbgîØsla¹.3»¾¶yem»ëO¥Øøˆ×6(Î¯?¼Bfªº(BôW‘DPÆ±çŽÉvêÀoRÝ$:&¤ê\n¤t3AÛ©ë%#¸eÄlKž¶¨F^UÛ\0ê„»ü‡7\rsP3£š±pšm9ªÀ”€‡%L1Ly2%ØÏÊw[lT`Õƒ¿ŸQ…\n´¢ÓVZ„•*Ö¾øÃ¯å‹BÅm¢¢ÈVE‰Íú˜E©aªiù³ˆµò,D¡(O»ýÎå\0v½ÕíŽE”&|¼Ÿ³ÊØ†Þü¶ÿ³¿Ë_ÁÏ8<¹‰²uGpªÆ{èßöÙU§v3foÚnà…@>Ox}‘}TÇi`³¡40L(0qÑë`X\'\nQ09ÀÁ#Q¡õ½Ÿ6èóàòïÐÒ\'¼2¼ºAð‚ÉÔMñ¥ô•ñÓYæŽÄ­\"Ö˜Òr¬a=¶ï·c´,ÌùæoqD×Ë~€±4¯è‰\n©ºP6”Ê†™²a®hø¬h£_ä=P%¸Ò™<ßÐ™bÛYHLš$Yy”Uõ—[¹º¶å\rg\Zšñb	èÊ¯7sŸ -«ìãàÒ)£©•{8l.]È³ýŸÜþW$»Ýd ªDD¾Ï$»¼“Ž—~HJ(_Ó$oHe{4;-e>\\Xµ…æ¡T:ÌqzU¢¿£O¸¢Ç¶r—Îe>¯û£áu\n\n‡k\n_ #L	Ö¬¼\0ô•\0%\'P\0ƒÎ¦ô×¶e\0K¥ÚKÿŽ°“ŠT¢YI‰¥ª°Öªâ§ðŒ®nê${]CÌ\"ºH^]œ´ÝU’ïwhì¦\"ësÇ‡JC¡Xµ í-ÓÔMª£<ˆÄl\0ãˆÄÒL³“kËÐ¢\Zt\Zò{¹Ù¬èÃÞ™›ß®‰Ô+RÊÌ*Ùö½oÉb«if˜@ŸY«+¯·-ÈÚ¶ãð8FI„\\>I§S.Ã8ô¸‹Ü”Ë•Ód»®rðu•Yß@ƒŽæ-¥|§[ƒ#–í\"]dYdÛ¢X¤Â!Üa©ÏƒÚ¹Í­©Ì9ÃÐ0.½¹–TtK¾myzú+Âé','2020-12-11 12:20:26'),(16272,8629,'audit/profiling','xœíZmOÛHþÎ¯°ü%p‚d_ìµ×\'QHUN4é‘p÷%Rbì|mj;´iÅ¿YoBœÄ)”\"¢ Ì¾ÍÌ³óÌÎ¬ã:Ôù‘:ÌÑCÆÉH¯&&å6%õÔ1=B¡×}U‘E)Æ62-b\"n1“Á[ÎLS÷Z¤zÝur~…\'&Œ°ˆ£·nED×ÚÉ;Í‹£HxYGŽŽÒ/ç&N³ÃDxÃ${iìî ç_ÖýËÈ\rÅ¤CµçêÁ¯àC*H¨£‚ ë_v§;1È“c)(Ž²,„aUŒ0±8´  V\nºŽ)\0K¯‚Xš:¦éèµ;7©}ýúµv“…ƒÚˆü8©ùâs–Ã°ÉÁ0I-Œ}1Hkð\\½½¹Õfƒ R¼irÑÕ0Ê5“ý–”ù­H	stoà¦©>kÌ;7G0åNœ/NüñÂÙè6Ÿ:Ž^¿¿ ‡#nZ«ß+Ë^zÎV„ž6Áˆ=F65Œzþo{Â½ý¡õ¯öþâìL;n]|l¶µ÷ç­Z_ªß_ôe\\\04ÝÈwœ/C¡H¹§I7MfðÜ“ÙJhNÝóYhRdáM˜2¬ƒ]„Óä°|»qÖ8îìhðóÙV!:¤YâQÖ“ìß/t†a4×˜ˆ+‘ˆÈ~/s/bywaúN¾aAt\'¡+Íî¥ÞÝÉðLÆŸ©©vÔÖoç¯Öi³lÖg1š¬>”\'ÂµV3×c7ÿ,1Ïs3w_k‡°xY{ëüaæî’©§m­)=ñ¨y²d‘ñˆ½|©=9°ieÉ‚&ãæ%“$”Sr|ÿýÐ8o”¯u¨ù Ù%¸Ïn®M¾¨Úº’;cÃ¦{ÝéÙ•¹É3}kÆ4ÊÛÈ fqbæ,ä[nYø»X¸êYÈ7“„~ª£ã\")Pû£˜Qhjûß?$k6Ó¶Ì\r„Ô´)W©/&+Cº¢—2dl¢—šQbçÎ”r”-O€Ý¡d=ÜÉhÝª‚³Ç³`c	¨—ÂßƒëHš+UK¯v$ŸJ0%˜.bŠaÀµÈ:2ªµóˆ8-¶JêÎETþœ¢*c\Z\'Éa5×u5g•Å¯¹™À\Za®€µŠÀ2Ä·¹Í6·ynnSàÜ²§8d½hç2±6“•ÎeuŠØ[VnYù:¬\\õ°´Ñ.éß$-	¡vž/T¤%f@ËÓf»qÞÑN›Ölî¡íö“x˜‰þ¾J£{>Ãcp+?ÝÿÜoòo\"\0Ð4ë…\"»‰ó~/n&üþžöÏÑÙE£­íæÕaÍõÃ ‚x 2QÙ×È¾VÁ©b»Šª\Z4|jµ;ðX!ˆ L0Ö0‘/w«ìýü%Ìx{Å7áÎ¥lZMrwºlƒ{æø|Ÿ¸’ÍÆŒ-n6ô§îÝz9|¾Ï–ßdˆi.Úr’õŠ–PðÕ‰°®ÖÍ…u• îTÐR»ÈK2\\jŒrà_hL±Ð/¤d\\iüöÉXþZî	d´¸ùPšlÉ¸%ãk‘Ñ¢4¿œ#3_ æã7IcÝ:À¶,öèd¢§_&½\"¿ô	r€ExÁ·ãÅ;$l?˜ Üýo¥ÿ3¼ÝÂOW2Ç,‰‘€·Ë¨tüÐPb‡ÁIIÖDÔ…˜¼C{7:]p}YúDrW\ní*œžåé/h.¹ããÊ¤Ò¡çí1ð¼=Ý9ä†˜“sCc\r¬˜ssDì-¶xUPƒ©·¤dæ»„œ\0:eþo¬]’pj?~óý‚À“gb[™.ð‚Ïñâ§‰Ð_†uN¬ñ]5Ë$Ø Ö£¯kÞ<¾aå¿3¯ù9Œ¼øtrøÎ–íFGëûÃ$¿Üê¢*b˜r,Ü¶M›P7¨oeöB¨+ÁK	7l»¸36#|]ç\'Ä˜¾K#¿·°K._^¸øu7Gf‰SÙy´tÁ÷_™,Ï:še3dç•+E¯áh+GËxø’ÝÖÏÞ‚ŸqN4Üÿc ¼ï','2020-12-11 12:20:26'),(16273,8630,'audit/request','xœåXmoÚHþ+R¥æð;6FùàV\0s¶iÓ»žÐÚ^À°]ÛÚ*ÿýf×6„K[õÃt‘ˆ½»³3³Ï<3³€4^Ö¾æš¢5–”¯qÞè!Ó¾>æ\ZÏi¼@Å.7’7z‘&p\\æ%­‘áO;œ#ŒBœÑ=¼@ôÀÒ:É‹ˆ	 3Í@Qã¼•\'A„68oo’\0mˆ±°ËqÖB+åh˜$_¢Í±r›cÞÞñ|GñîÀÔÎ¢#]1zšnð{ìßF+‹J[ì0ooGÞdÜd6Ñ=f†8¸O®c%[ÌªJ›kK‚ÊµU•qÑeQµ‹ìh\r8-­‹²Ö(ð¡`×ÅvÓD`\'\nPî³2óëáùìvÓûtÍµ»Íhg`Ñ>ZV¯ØOëÙ4^5a¡¢êy´ŠqØÂ‡`âîí¯}±ÔHý‘kïZ8’0ŠW¥›Zcõ%J›Lˆ!j~&»U;0L£\0²€½é6q^¹ŠãÒ‘ZU€‚5nI\\d	\rKWklÑåš«0\n’ä>*ò0œf®éºVÿ\Zù¼ò¢ t$±ãû¢Ôáû,©‚º\\Yy¶¼–‘/†`IE]aÉûâCUZr’¸”CÎBÁ_\nË®/>\n9…[b¤*j\'P@½\Z 7¢.ÀçrÁƒ{#Þäð”É” Pð„Y²ÊW«¢P.ëËy7{0—k*%NðîÓïjÐÝªÊà¶ƒÊo”>9 BØ½ÄÎÈHæÑE‘j,û\n™YÂb…Û(f£8ÄŠDd—®2H‘Vç8Øe¸U%NNÁ×\Z<}¢‡Ö2ÉPÒ$+3Hk¨4\0¼úT\0ŒíK÷ ë\ZœÜÅ¼ŒxŽWÂ*|°ƒ6­(­³ŒW„6¯B\"€ÁÇ’,pš4·Îr˜–¢ò®5K\0‚°uó¹V1‡Œì€š\n%óF¦\'À¦·Þ5¾ËL“=<TžáTM4Žc†¯æšA¹fœ¸ÖkqÒÊ‹$ÃMÞ(›Ìv—pˆ=ÚD!0¼É¤PVZ°Ü_s0(«AÅÐY†V[D*ÕHõÔƒPaZÞç´$±t–ç=’/Ëqq=÷-•DðIvUfuÊ*õ<¾´t,¦<Qˆï‹,Úm?éUBm\0Û:Ùi\'4­ÜhUo¯j/ËÉÊÐö¬ÒPqFJf\"°µÅÅ:¡áT‡¦W9åú_¼ó5®ž˜M(db@\n}=C¨å.%\'8ãêDd•…?Öú›$ü|ò\nT»¦óÎtÈ”Dk?!•cö-Ç4¼…ëéÞÜ­üƒ¾Qsäy³ÅÈv½ïírµgÖúÐœzÿJ› 8P?tÃ0gÞ±YÜæÔ°ûÖtøãù†±>ÎâïijµÕÐ‘¹0ì©çØãK½ãœaÛ·–ù¿è $—é™s`:$E~ªˆuœæ³¡£÷Í…5uMcî˜ ÿ·¹ézîy39Fõn1°÷ºÓ7ûäíR\' ±¸ ýùyqÿÌv¼\'ýK.I9¶g“U©D¦¦ÝÁºÎ\\îvä6ZmqL}¼°f—O\nb3ÝÑç¤3¶Ä<÷£X;‡§úRé¿,I\n¶$[èJ°=ŽÃ„JÕý¢ôyáZÃ)ÔA‡ò\\ªKZ½l<8$]áèzJš+´¥65­ýÅWÌÓÎK2ªÚ?Õ\'æ÷ÒÓ.½ßÉù™Ð‹’5ÇœØžyYA§®3}Û˜O N/Û.%{2öááÖJRîêÐU^¸PGÊÃœÑÚbÞy@s`ÝáH¨W/þ€Má‡‰5­«ÙqÂ 0sfA@ÿ<ÆÊp,¨ŽklžãýB{™°ít>ƒ«†tI’Üåj7Ž½rîŒ>_*\0da¨{æ{ýä¾g:Ý0«K˜1´X¾dø±hneE®JõQêô‰éìþÓKñVÐÂª}ÔÌåO[çŽõºÏü¹\Z5B—§ ©´@‚—Hdj‹ž51ƒ±­ƒ›!$§(Ç	\0*üQ=‰“ï¬\'Á’[([íO×˜r\" ‚ô¾Sãp¶>£ÕðìÞSw2¤ÑkO÷¬™Q(ÉMî=­¢m:eÞÀÑºÁ\"z«;é\0*Ÿ¾ÕÂàÞ[_}	×Ý\'7Pz<{J/{Õï‹Å²¼H/àÉd†‹]Ï³Í«ôˆhÒª’YÞ~s¸ô‡ðµ\"(^Ùÿøø7˜!ÿ\'','2020-12-11 12:20:26'),(16274,8630,'audit/db','xœíZkOã8ýÎ¯°úõ#¶“T¬Ä@g†´«>­T©\r,MÂ&)ñß÷:6¥©Z˜ªH?®ïñ¹×ÇN›Ø?bÛ´K¾Šcç\\Å¥ŠcÓþáÙJBp%¶©e—šßê\'èKûèí×ÚÇµ&úÒ¨£Þ0VQ¯Tñl¿&†ª{»tçy÷´³ú¾¸¶ýßPEwº%«¸6XJŒ1;ÄÄÌº»¡ÍgF›ë¹véÌ¨É¹]*_;Qùææ¦|‘øƒòµ\nÜ0*»ê2‰¼¡_ƒt[Ï§ì‡®\ZÄå6”w®.®twiàJÛçÜª¤nŸ\rƒ~â…®—ÚRàÖƒÌ˜]êœ8ÖeÊF¾|vbµ]®UCõÃÈ}8¹»J{Q»dÛ¥Êý½ÆÏ³-‚æ¢ÿŠ¹à´Ä|pZÌ°–NF%Ká4ópr†oVªû­5?—ýáN?â$r¼ éŽ¯¶rƒ¡<y©3© ¯ÜnâœÔìê\\÷µtÁ¼à,Œ|G»ÝûÊw›\'ž3èŽç£½&ŠúkÖkE½.ÕÝãèC‹º9GõZ:ô³À½¾“8ƒðíÂàEÏëQÏ]›¨¦™¸W;˜1ÈC‹Ít¨MÝ°éÌ“©™<<žÑIC9Õ%Å÷ä[µQ-k¹0³S ÏF:›tÐlé\nZ¬=86^[¨^×Ì^Òy¢nÁ¤F86—2©In\Z¦ŽBk…«(üUQ8ç^»¡\\Ê 4%§:	ÉG!cAˆ>åÊ–±ç¹½]º`bc‚‹e”ÜÄF–ØÓ9iÊ,Ì–Ra²Œ¦Æ¤b¶v†®—t!sGw‹ž+¤!ñóL5fÀzª\\õÝ;2XÓi•ã¨_ÞÓ¥T)aÓ¨hp®’–NlÍ4)>E—ÈœKA F]\'qÝþcŒ+œ+,.I,_Ø9éjâŸÑ6¿#°‚\Z)°2¬ÀÖJÞ¬äÍKåM.æf©œ|“óI-²¬aÉM3Û›ÍUX®Âò}ÂrÞÝöêå”!†Î9énIq>,‰€ÑkÍj£…k­ú¤ø@½(&ª·•)é.(h(zWúÓù×¹Õ#€ÆI×WÉE˜Ö÷#å$Êím¢¿÷ŽÚÕ&ÚHOˆeÇõ½ ÒUÝ®o!º…Ö‰¤\0ûÞ!ð\0Ãƒ¯Õ”Ö)¦x›ÐmB¡0e›ŠõÍéœË¦WÝª>Ì¸hy-&\\^6ky…xáò>(øt•«\Z¶‚¥­2½ÔP;×‹‰øt•5,¿ÈÎ§ý\0;ÑhzyOpëÑXGë¤Æ:™¡ÎØÐL¿è[Æ£¤Ð™Œ¾¯èLþ¤E§p À©wäwÅqž}a(rKÒU$®\"ñ}#ìÒT«R6ñÚOŽî‘öëíZkãÓæ«½C¥Ødt+GgrŸüüÒµ§nâ|DÑž\\$Â7žjcJbðÌ!­Ì:\'£&X^¾`ö “(T„×>ìj&:ƒöàx4å‡•óc<î3bÉ`1²35æàÅ\\âxaQJV¼øÐ¼àÌÈDôÄ×¸˜qï\\oTèó?£}¸ë$=tPmî££ÃãÃ¢x±dB06W¹äcsÆ2²o–PùÚœ™/ÑÌèŠ2˜2–D¤Û›8«[àVû¯ƒ½VõÉÑ Ym¡ž;ŒÒ«ªÞ.ÞÁ’™¦$Ø’\\Ž¾òÃè®ëÃ1a—HN¹…ü[1S°‚Lô\"MO©ÄÆóÄzMo\\¤¼±¦½[ ^@)3}Åç¼ï¯©~\'h&	${åÇÈ;ÐlÎ£#¥–ÁØó:iÅ³Ã3)¨¦ûûÿër¢Î','2020-12-11 12:20:26'),(16275,8630,'audit/log','xœíYëOã8ÿÎ_aõ°‚6vš81â¤ÝÛž ]µeW\'UjÝÄ”y°yÀvWüï7vúHir‚=Ý¢­Ô`ìñ<~3ž§œaö=a«\"IøL$µ#Î°Î¾{Lƒ‘™†\rV\0‰…(Iyœ\n·vä1ß&|	ÌjsÏÝ‹éhAÊXt+BI¨¹›\Z¥š¦³Ž©iØ†­vs¦±ï3à?K‡©=HÖñÄñzŸÑûËóstÚ;¿¼èÐû~ïM²DÄ“*eÜéè4\nºŒ}ÉD</UÆ6°½T/m7$2MV»ò|Q–@Ð¸ãqãþþ¾q~ãN„n7\\q“Æ^4@ 9”ê4‚È~Ò¸„qýöúVnN¾\n)ß\0ËèWYè¤€“\\§RRèöÂ\\«9>O9&úÊ–žˆl¹}áD±»`œÎoÕ.ÂjŒÕŽhÚš…mƒH4IM\nt=pŒÎÐÙ	r¢0J†‚yòÅg×Q’ÇÂÉâ$\Z\'‘ãqìNÜiÈ±\\Èç·€×À¯øVÇmP¿Eèm°P2-BQ‘Ü>oŸw|nœ¬ø\'iÌ½0K|\n~„&cq%b:Â§|ê‹êåÂöuT¼ð*Š.Í\'Îµø’<•^ë‘ Ö\0ÅÎÎ½N·l×˜/¹g2kHrŽz]¥Çžz–˜çð”ûÑó²ù^µs¯bkg€º2´ºgLûŠÕ¾$,C:·dK“ÅtÅ&	åÖ…ïçí~»œ×1rA³)„ÏžÒF1Í]WB±³0lí[XÞ•‘½ûhóÆÚ‹òŸ…›Æ›Ì˜JMUM6ª™®/!zW¬\"(wãÄs\'Çäeê&n¾AD\rjk8GTß@Ô¬.Ð<s½tI&ž¿¬N[´IÌ§‹E³Õ©pÅ7oæ¨*­\ZIì4ZrT*·@Å@0éPÁ:¾ÁÅ´¤nÃzøÛ\ZV¬é¶NóJ\rèp55ûW½øU/ž[/\nG®ªlI^v*-bÐ7y(›˜X–¥¥½q2[§;h÷‡¨Óö6SÚ›ÄQ–ŠÉA^UÆPM`èÝÊ\'ÿ‹•cx&é8éu¤ÖXp¸UMöÑ§Öùe{€öTeop7ðÂäqñu÷\0‘´U\rP¯ku\ZLüÞÂh—hD;Ääc„	#\Z#æîþ?öç×Š¯ÐÑ§¢Ì¹¶nPºL¹z•wMó™Þ]T3åä¶D­ÄÓØ4·=\rë	¿{YASNÎ/˜ÿ‰!†±mÈ‰Wê-Ñ!´–ÂFRØH	å‚FkA•v‘yüt‚KÉ£÷)vDo6ÕI$7YBWÜiï²;Ü{·ÿZoˆfÆ²…#•‘ÿ}wç‰û¤xžË‚^/iä\0ß{Ï…·•ÕŒÜY\nFŸW$%H–‡;}†öP¨Ò8ò}C¸KNW¥išT=oÙaìXó}\"?7u(=zþzÃØ¸d›í}¯Öî£“?WÙvÌÓ	:kNÑyç¢3DD{QÈ`M3V\rê¯˜ù_ÆŒmb]]`ˆUŒØµG$	J#äŠi6›‰y	ŒCO¸ÈÍ„\\é|DÜucI0XiZGÃkE]¾V+‹UÅ6—áE–áµ°B	]DnæÆ …qnrmÊÂŒ˜´%OD™¾]ÊT,ù|ÝIÒ ç,q-¿H‚N\"w¾å²~çû	Ø?«ØþÜ‘Dá´;¤îÐ³.?žµ†íG}á =D7‹ÕÕhr¬Õ5\nŒbÍ¦†Ù¤Ð\"ˆâù8€ñÃ}Ð°µfñ„eêÛ	êY\r!TÃúÓ)ê‡4tVIëþƒº×»w%!e©7,Ü÷¾½fë³f˜jvþ‹ˆN~Ú„e›¦½ºõ¯=`œ­ÛŒ{xøœöt?','2020-12-11 12:20:26'),(16276,8630,'audit/profiling','xœíZkOÛHýÎ¯°ò¨ ™‡gÆãˆ•(¤-+š¬’°ÕJ‘càmlSÛÒŠÿ¾wlHâ,%–FA\"˜yÝ¹gÎ½sfÇ¦ö÷Äæv%PAßTê¾\'ˆqTOlÓ®¤~ *uÏFUddrD±dX\"“H-,Ý3Iœs•TêŽMýÝ·)<qý ÇÄ®´.Uè‡çÆá[ÃÂP¹©…¶Ü$_†öE”¤{±rGqõ“Èõaß;­{§¡¨ûŠ¼<›üZ>N¨]¹ñýžwÚ;˜lG`O·¥0qÌ‘!Â«XHŽ”›0AœOÐ±™F\0<=ó‡àib3fWjWN\\»¾¾®]¤Á°v¥B/ŠkžúœÆþ(¨E²;JT\\\"O\r“Ú	<W//.+9fC?TÚ<c2‡èlf3ÓõB[\n½V˜³+îÐI’Ê´3oDíC—+ÕVn{w§7—Y/€Ô¶+õÛ[°v$’„R^¿Í={Qè%_zQ†ð\nb‘	ÑPÏþ-`O¤]é|h}2Þ­ã“ÍŽñ®Ýúhôô³\\Æ@ƒÀ	=Ûþ2RyP–À	\\^I8)$\r\'_Î	?Ÿ§¤¦\\E8)yf°Šp2	Ãw\ZÇƒî†?ŸÝQÒC’ÆŽ¦}þ;…Šá(ÆêLÅ*t•×OÓ¡š_]è¾‘-˜žEqàh·û‰{¡ç¾yªÐd‰±ß1bwãÏÖQ³¬×gus?úHoAº97ZÍl[Ùg‰{®“:ÃèÜØƒÁËÊ[íqÏ­9]:FS3q¿y8g»ÛÙPÛºaÒ¹\'33¹+žÓIC9Ó%Ã÷Ó‡F»Q>ÖžáÁÌN>[Ùl²Aó¥+i±qçØdm¡zS3{óAç©º%“\ZfÈZÉ¤&˜eZ:\nå:\n×Qø³¢pÁ½vC±’Ah	Ftb\\ŒBJïƒÐxSTF¾Œßì‘%åŒ¯¢¼`2óÄ†ÉÂ˜.HS*]IH¹EsšNæ(Ÿ¯€‘ç§}ÈÜñÍ²ç\na\nô8SÍ9°ž*O}óÏÃÖlZµ$vkûú©U‚é,ª\Zœ«´«[\'KŠÑÅ¢äì9‹ëî\\á\\!™À9°l`¤«…~DÛüŽÀš˜s’€±(Ë‘\\Ë›µ¼yª¼)ÄÜ<•Sl²d¾³ˆÄ«\Z–Ì²ò½ÙZ‡å:,MX.º[Â^½š2ÄÔ9\'Û-	*†%æ0ÚQ³Óhw£f·5->Œ­AR5ØÉ•t4<ú—úÓù×ùªÿÆ\n\0MÒ~ Ò‹(«wcå¤ÊlïŸ4:ÆVvB¬9^à‡5®êëæŽAvŒM,À^EU\nÞ7ºð´IA»˜ìbl`¢ßï¾¹ýÿïaîW}U.Ì¸ly%å˜Ý//·¼œ?qyï|¶Ê\r\r[ÉRƒV™]j¨Oœ«åD|¶Ê\Z–Ÿäc³~€x<½¢\'¸uo¬§õ2c½ÜPobh®_ä%ã\\êLNßgt¦xÒÂ˜8 Ì;ü»‡bù{¹E&YGâ:m$‚]’iU2õå\"Æ÷H­“fwëÍö³½C%Hr<¾•#s¹ü\néÊW×I1¢ËhOK.’\0ákßµ1#1XîVf½Oã&%X–^<aö Ó8\ZU„×>ŒJ5™C{p<žñCü˜ŒûˆX2©Äf~†!æ¼XH|/$!xÍ‹WÍFÍ\\DO}M€ñ9÷Î­öa£m¼ýg¼÷t`6:ÆñÑÇ£®AÐrÉ#d­sÉëæŒ4óo–ñÜœY,Ñ`DÉš2¯˜2&˜gÛ:«Kpëä¯ÃýnãÁÑ Óè\ZogWUƒ=TE‚Z–ÀH\nÆMÇ€ü{–ý\0Ž	{X0Â$2‹oÅ,NK2Ñ“4=!™ëE4½Ur‘òÂšþùnX	¥¬ìŸ3ô¿=§ú¢™À@’ü•Å¿€f	‘&¥ë¤5Ï^Ïç šnoÿ4º§V','2020-12-11 12:20:26'),(16277,8631,'audit/request','xœuTÛr£8ý•-žvlÄ”\'.Â¦Æ6^À³—J%ƒ’PeVÂNfRóï+	°Ìî‹º[Ý§N7†š	ßt òtÀì…0åC\0ß0¨¨°÷g¶5Q\Z˜ˆW(ùçLX¿$¸&ôþ†%|¬kOŒüä¾öÜóDCêcóLqOÔs\',6TpÕ7íI,*ßšæ±â‰Úÿ=mžïq=\\¯&‡‹»î×ßdn}JµÅ%\r¾è? µkCA[»ær”}E™0éÞHS”Ë4/d%GÜ¬Î”µ%k«Êz/.TDÌÆ_£	Qí§Þkºm;OÂ6dºF×LC\"aäD([KB òÖz”±ïv¹-“MRFI&M¼ zfT=´>¨¤¯Ôî¥›J‹à8Y¡k1^›»gÖÜžkî¼Çtþö}Ä”í6ë4BcùŽ¶õø¹õ‹¥lÍùPŠí›¼;_7‡üŽò‡¶m¯Î«öØµŒPõBNu+£FæÛEùý•Ë#ï‘ãVì9\0‘i×pcÏŠbäZNäùˆ<€Bí™±í†®ÅQœX\rCG†êA‚Ð4Œ0ÝÀ‰9ßÛ?¢‰zõ‚©úúúª¾ôGI=g­ø[~p½øGB›\n«Á™œZVú\rS\"%_®¾®d¨h#SËt ™»e¯“ÞÅ3äK_·l©wi™uíiÀ®Óöö•t×6ÍÚÑq¥™\0?`[–©ƒýã\';¦Žm“x¤:©´=PÆq*MÂ$-W»…/¡sq×=J–OäÔ³ÇœÐKS5íêüŒéÔšÀ„þ,2¿vÉ**#´Í\'áW/DŸÕä2iìZ(C‹$ç×dï†þ¿Å2òÜ°žzž„Ë\'*OÒÍ8õƒ\n% óP˜nâd±ËPég‹|ÒòlöÚô/3Ü½1}ä½Éž«|eŒ\Z’\\£UüÙ% äa–l‹ëè}p[W÷ýÀ|³PrŒ›|å(ú)„+*JÃÝ\ZmŠ2KS¹+8Ù‹ú}‡ò¢,’5*ãUêó€\Zj6p\0€aÍ]þëjÞØò}¸XÂ·ÀAo˜>_ä†švÜ\rþï7\\«D„.Îñ·Õ\'^B.¹»]¦é—}Øç‚¤üfq„BòámÛÞšáÐ','2020-12-11 15:20:37'),(16278,8631,'audit/db','xœí][o¹’~ÞüŠ†÷Áà“åý¢ [>“]ÇØÎp\0¹#uíX’W’Ìßb7[¥R2bË²…e€É8v«]$?V}ua1oÑÖ¿&-Ó:“Iþ¥˜¼Í[T“Ö¿ú-_*÷y;iqÕ:¸ùùêÙùÇ‹‹ìôêâã‡Ë›ìüúêCv—?öúÓN1œŽ¿Ý¼í·(ügüÅàƒŒ¶¾õûÿì}úçéh0È‡½Vë‹ñ7÷$ÛkQE´&„pùÆPk%uw¿„ø³ß’î_V\ZÉÌÛòŸ\r„²*F(F„ÆdÒFˆR&½(“\"„j_´Oo_eðç·îã›îh8™ŽóþpÚæƒâxá÷ƒáÒ7ÇÅçb\\»E¯3Í?Ýë¼ðñWå¨ûÃÏ£ñ ŸöGÃÎ¤ûµäõãÓ~~ß™Ë1ÉNn²q÷Õ^½¿Ä>õ[ñ­~û£Ã…{~yvuYÊqTþ¯›OóûÑ—ì¼ûþÕõì“Gk>úþ&»tËyry¶æ%þ‰×å«^»±™®F²\"‰ÿöš¹©\\ùH9¿ÿø¹}ÝÆßõ.ëdŸòIqTJS¾´Z:ä‰W~`óµ….ÀõpéØ#Í¶#–»iIç–9H›ééçt¤’¦TsÑ’ªRIS²iJÁt¼¿¼i_ßfï/o¯B{‘ÝGÓâî8»ð;\'ÓÎ ˜~õÜwºã\"Ÿ½»×ÙŸ\\|lßdG‡ƒþ—1|ï?³ÃÓ‹÷îŒ0ò7ÊþFiFe‹‘—‡¯W7._eñGÑ…_ŽÓbVÆ©¬0¦2F`>_Ò8ç«¹Ù891Z ã”„˜jœ<`b=¨„MÐœpàEzE$M¥e‚”\"‰x‘âPÏ™àbU‘kª$ã¥\"§*Ôä2iò¤É7Õä3¸®Óãó\Zn1&µFñ<Ûc:á9áy÷xŽÕÏ`È0<k°b•³‹x¶¤†sv÷{1ž8–8x¸ÿÖ™öÅÝŠU>k_g?ý\Z>vÖ¾9=ž¿¤üwÃ½É\rCÌŸ`B²rk2²û¡D.‹ Ê¬ºô0¥ei6Û9»€‰ä¨Lš«j~0žØyÒÔ ðœs!J™dRÇIï\r½FrÏ³=–èrÂóþÐIÉjÐàlÁK.áÄñŒnœšoÛÞN<ŒG È ï|Í\'`lF18äãÉè.«¦èhöH¿w÷ŽV3rt·ø¨ûkÖÐo#J«Õ‘cL‰ÝñH¢åHŒEÖÄX:Æ„ÓR\'gIX/R¶ÜR$Í‘,¡¹\\$Eœñ^‹ÎüÎÂViKžxr‚ó~ð\ngAÆ“-QRW#Ã­fœú£5îÿbZ‚ud¢C%—„tzÅ}1-~ñöúç|rVúº2Ò‡ÇÙ\\Òæ´CP¹še€qJfJ€›5ÎhR¢8Eè•[Ï*v#Âì˜`­ƒ“‹Ûöuv{òÓEÛe‡<›:9;ËîîGÝü¾ßË{@™@3L(ªrCžµÏO>^ÜVÿ8½úð¡}y›¶\'Ó\"Ë§ãþ§Çé(ûšw‹¬ÖPý<Ëï³Iž€=pñø%gGðÊb<z(Æù§~ù{^#úyÃÐœ­Î€! ^Í\0Ý“ˆÅ\0@‹Ô±ÀH^mj˜˜ö4ðôº}D{išLÎ€Y,õ€²Äi;—DS«ÚÎÁiåAT\0TÆ:lœþ|rù÷ö<p°¼ØÂ™äH\r–›_\"ôNGô¶‘„#qY˜¡ª¾°»vè`Ç…É$	ÓåI²kŽKƒ8™ ’b²Ô.’%\nœ(ð¾xt\\Z‹n1EX‘’<á9áy_\\:®˜±(ž©­HŽBÔ½½©«ÃI”d²“÷z»ß™Î¢®Élùývý:®8R\rè6¯ªÊH¤zyƒf(Æ(t°ÔT®\\rbMë äÑ>\n>y\0Œ;ôÁ _ýÛ]àÚ\\yjvòñöªóþ>_2´_®ß8¹þ5û¯ö¯Çð‘áhðiÿ=w¿æã#FÈü³¯š/«•!êÔeC*Úc_ØHc×TJ‰dv`¤®ÚÐTîª ë	ÞÊ›F)•Bj@4a+7R±Æ¢Åé8év=&\Z%Ö”:N…YšêÚ“ÍÞØf/£vé^y®áÆSŠ¬Æ*ÜÒ§Ì”LàNà~npÇªn«%n¥ªè\në~Ù_Cìzm¢yÚã°ßí?ôG\rÏa85Q«?·iUI¤ÌÓÍ(,ÃÕ‡¬´:)%°Ki|É»Î_i>Å–s‚¸,@ëteÎ5}\"‘ã\'Ù¥|‘úY¢:ÝÑ ï<’¬WdŸGÐª[@´Wë{At—\r,EO-zì´+ÎRf\r²såèþÞ.b´ŠCÁøŒ“Öñ2ÅiYÅ-CerÑ<*µ‡xÉAZšIb‚;w´<ÇLžž÷%H«„fX&šrëÏ¥˜ ¶ o·Z\"(í0FÁ‚vV8ýVc²`‰\rR{ÕóÃŸ}lÑDS¬œÖÍó×U].e˜‰VÎJ\Z›\\+ö\n÷Üi¯U†àtXK[yIFíó¼ÄÂÅP‰â‡iÑŒ–Þ®	œGn×T¿¬NM3{j¨¥˜¨©Ò&Æ6”+N/\ZN†#`ýŽlà	2©WJRÕå)Këý£õŸ—§“éh’-<>É&àÚŒ>M‹a¿?êðsŠyÊ}Y§2(zý|8-²…z•2YtœõFÃê¬ÎIZx{6„Wö{Ž0|îwóæ+s†(Ï~ïÃòSß7nˆRN´Eg‰Ê[°,ÍúºYÖ\rš+,QK\r×U\'+žG9¸¯P8(Ÿ“²òy´øÔ±0ÆT18ÚŒÊM`Š¿dIBÀ–(È\rú\0@\0jx|¼‡÷8øº×M–`7y“ÿ“Í€€ÑYœê8[¢ÇÅ´Û|Ë±FÑZŸÜ³æÿÛ\\ÆndËˆDÕ§¥¾H’Uzq›Ø2c°¼²U²n“ÔàxZÜþµB`	eF˜¬Œ»;ä˜¼øäÅïITÊJb{ÄHm\']l*á9áyO¢Ràb1$ÕÉˆ©{2‘Ð‹\'z‘Þ¡š*a;£Øn`Ê*ŽÙDØ¯`©«ñé—0¾H\"\"	Ñq(`ýf­·qã>!ò.P¶†‹!	SX0€š´U”†·\"mìÔ‚,\nSõBûóƒ”†Åpß¶îig0ê=Þ¶6¡”JŽÑP&¬®r$4l¥Ø@Æèi·©ð\"†®%_ÏJë6Íˆ²tµ³•IÂö­dRÑ2E)bøÅ®A\"“â¤†ÛRã^ž˜Eb›2‹\Z®ëˆÅìçÍ¶£‹Û0Wçè[ÙÚ„æ„æ]£9R9».;˜Á\0>ãi$û~¹ÚÌJ …SJ“›Ü÷]ˆªßÝB#È¬°S°köAÜ¢È±T$&(?TÚßÆ@Y×?<°…í —³Í®N´â0a¯ÄåŠ„¥á+‘a\ZÔ¬Ÿ¯°´–Ò¤e“–¬¯z—|¿f¼z¦áv3U¶†øCù4l}—PP½KTG*kk8kÆ«N}”‡Á‹a{‡3ÊíA1þRöÏhÎ¸k×‡C|Á\r»nIÞXòÀ™Xn¹`˜¿Ub·×J8¡¸4(s0Jx¯>l†¸ƒœœä’j4üa]l«*µÊM\nv_’r\0h ÂØ.sš~ë§«% ÷%+\'¹2MëXã»–QvC \r›Öi+ž¬ö)€N¾àÜo3+\'¹¦‹MXå«ºèRÏÂç^4±Æâ¶>FE{‘äÇù…Õî×Í”¦p7®ÊÈ™ö0iØ2°™Œqû@(…õ|àœû~ÛT„çâËÀKÒëI¯GE‘Wàû£°òê\ZîIÔb\0Ø\rõhW	í	í/í‘ÚÝP4¬\\ÞWÃSÞq±Ì¾s3ÄÊõÇÙâ-sr Ž3Õ˜Ð#	’îä‚ÐÚPÙÝŽ$–»K$öEñ„©Üõ%RRðä0™fõ\Zr×·\\H×æ“IRê+AeªMÚzo‚(R‰õBæRúƒ‹T¦‹. ÷&ˆ¦ÌbtZ*Sp¤ré¢‹å\nˆ˜ ƒèFàwtÖ³¦­†RÀ¡{¶>^³Üô9ÇËI¤!ØU•åRzû¯–î¸Xm[]s5¯§W—7·×\'0ÙÝçßVZ	¸zâó«ëöû¿_º“æs2¶øÄëìº}›æò&	í•äjºÒŠR<\Zb´©ï§{3‘XPÔ!›K«Û˜`’vLOA&Vo8Õ®s|Š\n©±çöo½eRŽ/Yó}¡§\n<<‰í2A„ïqHUÊñ%@ï=UT1\Zòæ<Ìñ5mdï¸#j$ªf~\\ÌØÀtô´¢`¸;8Û·N7…=J_Æh£YŠ;\'Œ¯­WVz%øc¦vv}õ‹ç™#SM×„QÆVE PµÏ2ë•`¼”±siÇŸ€ŠÉè¥æØKÙ¦Ójˆ²X»ªöÊÂ–¥[“8zŠ53Øõq6§g‹:ð#-ÿ«žÅÝ<n½IK¯Æk á2 Ig ±Ï2 È%ÒLZ¬Ûš¬>jÂ(vƒ=á¡_Í”ÐHœ\\H¡ýfûn]ðØçÀ8QÁñ{Ânýkýrw{–ê	}ì9ÐB×z!3´…¸ŒSIì‰Æ÷g§KŸy ±j3X„[Hk¬hƒ¶ÍQ~»;^aŠJÉ:´Ô/ðéƒÚ&f…žå¶lê½›|­}	hK9Ú&CèYn+l2™\0\0ý‚ƒÚ2n°*\ràTurË.u\\^>ãNÓÑÔ\nÝùÜÿÃÃú©0DM°ó<°gk/*l–ù|CŒ%$VJ‚Ù~=KkÙÀOê»Ý[>Ý¯ùœX‹Æ‹ Á­IÊêÙaÎx#\'Ñîx	&\"¯£6põžòîsB/?—´.mgacÈ§¼ý¤Ñ•†QR1^FÂ¦óHˆgé¾ï¥%Ä–ô/]ø]vÞö\\×Ýû<+ßâºtú¹/áÛ°÷¦Õý=\r¡læãÀDxÀÂ>”{0ÑÆZLëHÆdÕË‚¹c/ÈP¢,FÐ$Ó–ûõipËOÜî¡Œ£\rs%ç¶ªOeÄ$Ö˜Xãž¸Aîz*$ %¹ö7¨2’nˆJpÞ\'È\0Á³XA”õ\\D1\ZDÑ-#q\"¨.¯ŒþÂeà[õ…À·1óÈïÁÂ^”Ï>ÒXrBµQHJrqI§O.‡¢ç]«ªŽ–£ûÑx~“7•ódMãE±ø…NR£½¬rË²ÆN+Šûq†ø>±Œ†¡ï\'ïÂi˜æ©¦>ÔÁÂ†—Oß„Ó0K)–e“¶¾‡™±¥Àwj[˜LämÂéÎ›+¬EZå{ï²¥¶…	Î	Î;€sœvæÄ04ˆc¿|±°^‰µ>þræÂj¶ö¦}[ÛÚw‡ÿ~~®~âú0«¦Èå™ßÑ¦Ì€¯©Ô—VûK,ìcÙTÐXZÀ%~\rÌ¨¯ÊcLm*èÉOgçú,”5žQ‰—³ƒÂªãwa§Ë¦‚FÏ¨ahGvE„^P»ùÒŸš¥¥çgÔàéE”oïÆ–ÚÑ54vF•hSXEêf*Œ³Í=WK‚Š¦3*À!ÀÊK%þJ=Æ#ÔÓzA£gT´¼CQêo\r`\\n*¨89·§4T6žQÉA?a‚\nßÒñÕÓ÷žQãüoDN×•°’Ól*§>;kŸŸrªÆjvŽ^Ñº5ã+§ïÉ;Ÿ’J†5PRÔø‹B\\8dÇ9\nWi‰œµT¬îšÈÄ®›¸¸\ZƒPÌÔ:G¤.‰áïMŠB\nIQkÏ™o˜ÊDêB\0½7I\n)…@.üe0aÓ6>ÙU’P;;¢êìõv³RCC·ª?ÎÂöM»Y4ÿ°šb3X46ÉðzWµÞÖç½þ´Lœ|kÈ@Àå±X©“^äÃÓK½™6+âŠ)”ƒêOæ2¹tÇ«M*;©ìMUö`×)íÅG\Zn5.\r¦Û´¡¬¢!ËÝ½¦¦w…éH=íNtaæC[íãç2§;wÿÍEè=zÛýŽ½!Òn-á\n$ðA1¿uùwïŒU–± €íÕ8È®Üå\n¨ÙaÆGZÃþN;M,ãpå˜¾1Âµ6úóÏ?ÿ×“l','2020-12-11 15:20:37'),(16279,8631,'audit/log','xœí]mOÜHþ|ù-îDbsýþâˆ6ì&r«H+yÌŒßÎŒÙ±gµ(Ê¿jÛóÒã’Á„[$G\"€Ýî©î®~ê©ê*$ø’:ØÇYÝÄÙÎÛ(Ð2ø’~ª~È&ƒ‹÷½_Ññ§ÓStØ;ýôáìŸ÷> ~4&yOòé}çmøâðEá9J‚û$ùmxõÛa:G“aü1‹§÷¶!{;ˆÄJaŒ™x£‰Ò˜âé(ÀÁ—¯I ìoÚfèÛ¯¶ë™\rvzwñ$™Ü £whN&ñ OÒI€Æ÷Ù£à6Íòƒi<˜M³4ÌÒAÂáÕÛáÕ$\ZÇóåõšÜlEîE¿A\n·ArÍ|‚sU\n.W—ØÀlvO»‡—¯üû}0{Ògù4J&yh¥Û_¹1š\'k§ñu<\'ƒxæÑÕ(Þ|{åñWÅr%“ët:ŽìxÂlp£yóÜÎÏRŽu.Ðtðê—ÞÉ™ï©ßãûyï3«:¶9|8êrìÿ{†7ˆòh”Þ èÜw½w¾xroÃ£\'èÌêaçìhC\'U‹×EW¯mCßL—#©IR]ÞðÊÚ#Åüþú¾{Þõ÷u€† ÙU”Å{…4E§åÒyZ¼ª¶\\[¸½»²Ïv×úð5i´)®ïC)æ\Z[u6«êL€ÃÉÙE÷üœ]ö\\D@{ýi:Ëãþ>êOcøÀ,Çq~›í•Á4ŽòxØþÓ9ýÔ½@{»ãäf\n×þ5»ÛÝG»‡§\'ö…Ïþ‰ÐŸADLì¾~pÓV#Œÿ‚mžÇÞ1jfTm”ö,åº@ê@ ß¥Ì°9š #Ò¨úÄ+\"-\'žHD$-l$mÝ#ËÍÔ™\néUg)-w˜^UgƒçÚŒúÆÓÌî\'ÀˆèîntæÉ8î×¶,òQ÷½ûì6;ê^î/;)~o66¾>N)/±‚’çÆ\nN™ðI$8. ‚ò*Z¨x)PÁ5çÄ£ÎŒÏ7˜ZUg­‚#ÐæËnµ«î¦)2ŽÂÛ(¸KÃŠß÷Q9E{‹&É°@ÊÙë¯6µ7h#V¡ÞpŠ¥¬Ck%Uá	0üœ@abÄx Kj”,$b-P´@ñ€¢ÐfíÃ	þ)µY>ì›¬p‡½\r,cÕ!ƒ;ÁÆá0Åyü±’÷Qv	ðq^¢¸)KA£\'\\z¨“´¤…yg®Æi°Ó9½.tÙywÚµ¾V£#Ô¥ƒh”£!`ì—|\0jzÔ=î|:½,9ì}øÐ=»D»Ý,Q”O“«Yž¢Ûh£ù¾M\"P–@ÐŒÓÙM4E{Ðe<Mïâit•Ÿóº¾Ì[Î€b„×&@c@3YL\0w¼3ª* =<ïvÀ*¬ÍB#c”Êº£¢(R\"(w¼2\"ø¦µ8|ß9û¹»¶þÅù»®zJë;PcN(/F?³…ƒ-¡u}³€HJ—\\XÖÄµ&î…˜8&Œ¦mŠ•È\'ÏŽØÎ›š8†CÂ¹ \"Œ†ÃpÂ|A«ú“Ú9&™ôŽsA—…rÍ¹v\\„¯|vknWÆüê}ÇÌõ*í|ºì…\'gð|¦ÏO>tÎ?£w?ïÃ#“t|5…ÇÿŒ¦ƒÛhºG1^>ûªñ@àÊ›°ÖåH¥ãp²6kCn¤nBHîCO‚.ÑSºiO/ZôÜ\Z=×•vˆÖÚ5Sn)4÷)7¡¸Œ¨K÷hŽ®a©^æH±Š¡³I2Hî’´Ù¡„XkñÉËª\0éð~É%¯õcn¢5U6Œ°çe0·+‡¨«ÇÍð \'ÖŽ¡aŒ®Ó1ì÷æs-1&>É)exZ‰gf²’qV?G‰$)½>¥[\"ÛBñ!²’cå!LYì/í¸eófD\'$÷À2¬’§ä­@™”\':A˜”²\0=írt‹Óë‘‰…dÅI9àñ£©ëúP}]ØvßhÒ˜äJeŒ/6@«ò`´Cç™Ù´©OM#EÔDK¬*©«|‡{S¡jÏbÍƒ9k³ú­Y^sâ,O3´Ò<CX¸ô*\'Én\rãÌ]¼ŒêŒŠ¨Î8&Ñ$ÑJt§p×öÑ0”OX•°¶r¥w4.“¡Åçëd!˜.d÷}„þLâIñÔƒ¼k;]Ð¾ù˜—Æ¤ä†ý_tAIáÓ\rÆ·PQãBJÄ6ºàÛ‰ßµ=]­(–\nÖuœÀ*ƒ6Ä°è³ôcuÄv—­­möÅÿE\Z\nŠ°`xû¨Îâý84^aÍ”w·k¥H9•æ™ù“¡šyŽ41@öÊŒL[Õ2¨Â ŒÀÜç¾RÌ*žA°{ö€Õp(E$7¡ëž”Fpx|£‚X¦»aÇßñØåÕC.´+PÛLT©dÌ-”3S%\'‡Îò‡…€Çép6JŸJDB¸a>máJ•UÐÂAd¶‘çÙ\0Y€-¾¬:,\"D¹xÌZ<nñx[<ž+ë&8^Üo¤ÌàWúê4 Ü)3†G¢[l*oŒëC¨3J,G&×8Ä%(Â£’³¹È.\rWß<wh~¢.`Æ°öŠ¥çvºqYBZ\\hqá‘‡e~ÎÃe›fZ­µð¹¼Ì¯()u<\"aü±ðŠ\'ø0¢;Ž§7E¶Gcl`x–W\\mx¹	Ù³V@X™˜`ÆšWyO„µ%-0¼N0[ß·Ç“¸Ògí:p\rçœ&T¨ÊÁ£Jñ„þ›`ÊÆS<£¸Lj Üñ‰þ¶ÃQÏàn´à?+êYÓSùmÜ­”((P‹(-¢<Ê©©ï·|’úÍô]î0Æõ|Oº¥ë€ó@)E­^b­–U,qˆï#Ù\\8Ø|_Ä…1=/Ï\\L¾”ñQ&ÆñÑVS´`òRè‰­ô„ç˜ Ô”Ñ±VN±Ñx;á!¦˜	n†À§$)BPQ/€‚A²*;œˆµZŠzþ¾çÈÏFq{g—ç˜\nÔ¿þ½–r`£ÏÇ½óîÉÏgö¨~	Ÿ«-^£óî1hÓÙ!L‘7Ê6j8’âó«˜}åF¹Òò™}=IÀ©ó¼fÀ‚;•L­¯×‚éSIÅ¾=Æ1åy¸M{zÊÌ}‹¦ƒ¯\'—!\0Ð4^àTžþÐ(	{Ów²Ã1«\nñˆª¹~ßÕ£óÞÇ\nmÅ½†BRB|å‚šs<Ç~å:dk)]4o(°Æ’ûãœs¡Ë˜œrØ»aßk«úKÖ¾M~YÓ)Å|à–ÏõD»g&f‹ý¸ó^E%§¾£w.¨ªVB3—}W¦‡6,Ü+—+,×Ë¥+ÞXsf\0«#}ËS$Î—£”ÏË”Íð…Ñm‚V™¢E´iyAË^/P†0Š}{LQªË¤4ãpo‚×Ï…ÃHˆ1\\…×É_•Vÿ . •ÒS­#«\Z¡Ãä¹|07æ:ÜFKÈ„…Œ›J8çñÁóc%ãP³XNn+¥½˜+¯Ò‘­º8åuî´VP¾6c¾ü®Šò\"Ex2´éÁ£½Ø¬Ñª#û#\\¾=ÊËê¡fË¢±À¾ÓAžÏ^ë£	00ïêPQ½/…bÕZŸÖú¼ë£	UÞšûB“ù«Ë°ËcŸà¬e\0tª¨\'wÐh¥¢ü)&àÓùbó‚IQm\\âv±Î×—ÙYe†f:J§Ëzp\"–þRSQô‹ª¤¡Õš¸¬ûG\'jÚ\"tÏ{«ìkm«ƒ\rJÖ8w›¨Ù¢Þß3QSS£<ovÕÂp\\:”:„[Ð`çÓÇ#KôV@à¢{9ƒÝËwLíVo“ë/‘kŒØ¨¼ONQÑfJÅ¶rvÞ«#GNÚTNÁeýU“ ¦-O(ÅÔÛOç¡^›NÖTL-½ç	@Ðª÷4QF¶—óX®ÉÉÊÉÝúNè%ÖUP’2¾­œ¼sl‰#§h*\'P^Or$”ÓrÙ™ÚVLu^È±#¦l*&Lœ/+[B£ŠàðgN\0gz‹¥-m)ˆ·y­9})N„àÜÇ%5ÂTêìæ	à§8Ù2!‘³È8´0ò¤Nƒ\0Kë9Å’Ì†Ê¹5¬?üï`€P`|%ÊR]šX+bmßÈÔ‚Çß÷ïIX•f‚ùNÓ¤´¢ºÂ¡ºÚ,É„óç$\n>1œU`r@ß`ØÂÌ\0¥²¯DÇãtzŽ£¿úÚHÃ8_¥vo7\r)¨ö½Øœzf­û×¯ÿóxw/','2020-12-11 15:20:37'),(16280,8631,'audit/profiling','xœí][o¹’~ÞüŠ†÷Áà“åý¢ [>“³Ž=pœ=à\0rGê$Ú±$IL0Èßb7[¥R2bË²…ef«Õ.’«¾º°˜·xëÏIKµÅ`4þzðºß2V3BÕëIK´¦ýAqðº×b¯ˆ2TYÃcVQÁásã¾6™äŸ‹ÉÁë¼E5kýÙo1ø«r!ðüèàê¾ö‡Ÿ³³Ÿ²îh8,ºÓþhØÊ_\'ÿ¾k}M¦oÆE÷a<u&£n?¿ëô>¾î}æƒ¢þ ú¹Ž:Ék÷[&-Æ[_ûýõ>þëtþâÖ~Ÿ{–ƒÜT­	!\\¾2ÔH#,| @BÒúó[¿%Ý¿ŒUn¼ßÜ7Yt«\"E·f|Er+•‚ÙøV}0“œÃz¾ÿùêŸÙù‡‹‹ìôêâÃ»Ë÷ÙùõÕ»ì6èõ§b8½]Pº Õ`{­Ö¿Š\nˆL’RL(#™y]þ³Pó©ÚD(F„ÆdÒFˆR&½(“\"„j_´Oo^dðç·îÃ+XçÉtœ÷‡ÓŽ[Çã…îÃ¥Ž‹OÅ¸v‹^gš¼+Ö¼ðõå¨ûÃO£ñ wß™t¿ƒ¼~|ê4—c’¼ÏÆÝÿ¸z{‰}ë·âkýö·ÝãðË³«ËRŽ£ò¿Èðºù4¿}ÎÞÀË±Ÿ_]Ï¾y´æ«oßg—n9O.ÏÖ¼Ä?ñ²|ÕK÷ 6ÓÕHV$ñ?^ó%7•+_)ç÷Ÿ?·¯Ûø»Þd=ìc>)ŽJiÊ—VK‡<ñÂl¾¶ðñá\\—Þ=Òl›1b)YÕZ’0Î-s6	Ò	ÒOéH%M©^µf€hIU©¤)Y„4¥`:Þ^¾o_ßdo/o®B{‘ÝŽGÓâö8»ð;\'ÓÎ ˜~õÜOºã\"Ÿ½Û—Ùÿœ\\|h¿ÏŽýÏcøÙ=Üg‡§oÝÿaäo”ýÒŒÊ#-._~ŸpøQ€¡Ÿè8 feœÊ\nc*cæó9g\'?\'\'Fdœ’S3 V\\¬g•Ð 	\Z’N5Ñ+\"i*-%a¢\"^¤8Ôs&8B?5U’ñR‘	\r4¹Lš<iòM5ù®ëôøü†[ŒI­Q<Ïö˜NxNxÞ=žcõ32Ï\Z¬XeÆì\"ž-©áœÝþ^Œ\'ÎB€%Îïïï¾v\\ÜävÅ€À*Ÿµ¯³Ÿ~\r;k¿?=ž¿¤üwÃ½É\rCÌŸ`B²rk2²û¡D.‹p‘\'l,JËÒl2¶svÉQ™4WÕü6`<±ó¤©Aà+8çB”2É¤Ž“:Þz!Œä(žg{,Ñå„çý¡’’Õ ÀÙ‚—\\Â9ˆãÝ:84ß´½¸@AÞù’OÀØÞ:>Ãp›USt4{¤ß»}C«9º]|Ô}Àš…5ô+ÁˆÒju$ÆXaË4\n³;ITà¢‰±ÈšK@Ç”	!ºSjáDâŒ¢\"	ëEjÀv\"[Š¤\"’%Ô#—‹¤ˆ“\"ÞbQÂÙ€ß€ÀYØ*mÉONpÞ^áà,ˆÁx²%JêÊba¸Õ,Ã‚S´Æý_L+P°ŽLt¨ä’N¯¸+¦Å/Þ^ÿœOnÀJ_WFúð8›KÚœv*W³0NÉª\ZnžÕ8£I‰â¡Wn=«Ø³c‚µN.nÚ×ÙÍÉOm—òlêäì,»½uó»~/ïeÍ0=¢@¨Ê\ryÖ>?ùpqSýãôêÝ»öåMvØžL‹,ŸŽû¦£ìKÞ-²ZCõó,¿Ë&}xöÀÅÃç|œÁ+‹ñè¾çûåïy‰èç\rg@s¶:†p€z5tOf @-RÇS yµ©E`bÚÓÀÓëö	í¥yhf09cH\0d±ÔRDÈ§í\\M­j;C§U”KQPë°qúóÉåßÛKðÀÁòlw\ng’#5Xn:|qˆÐ{8ÑÛFŽÄea:„ªBøÂîÚ¡ƒK&“$L—K$É®=:.\râd‚HŠÉR»H–(p¢ÀûâÑqi-ºÅaUDJò„ç„ç}qé¸bÆ¢x¦¶\"92QP÷ö¦®\'`P’ÉNÞëuì~g:‹ºú*÷íúu\\q¤\ZÐm^U•‘HõüÍPŒQè`©©\\¹äÄšÖAÈ£}|rwèƒA¿øÛÀµ¹òÔìäÃÍUçí%|¿dh¿\\¿}wrýkößí_á+ÃÑàã¾þ{>î~ÉÇGŒùw_4_V+%BÔ©Ë†T´Ç>³‘Æ®©”ÉìÀH]µ¡©\nÜUA×¼•!73ŒÒAAØÊT¬±hq:Nº]‰F‰5¥ŽSaV¦ºöd³7¶ÙË¨]gºWžk¸ñ”\"«±J\0·ô)3%¸¸Ÿ\ZÜ±ªÛj‰[©*z Âº_¶Ä×»^›èEžö0ìwû÷ýQÃsN`MÔjÆÏíFZU)ó8G3\nËpõ¡+m£BFŠG	ìR\ZŸó®óWšO±åœ .Ð:]™sMIäøIv)_Dd ‡~–WÎGˆÜ\rúÎ#ÉzEöi4\0­ºD+qµ¾DwÙÀRtñØ¢ÇN»âÌ eÖ ;Wþˆnàïí\"F«¸8ŒÏ8i/Sœ–UÜ2T&W]Á3p RP+qˆç¤U ™$f!¸sGËsÌ$á9áy_‚´Jh†e¢)·þ\\Š	b+\0òfqK %‚Òc,hg…Óo5&–Ø °W=¿0üÉÇM@4ÅÊ`Ý<ÿ0apÝQÕåR†™håál ¤Ñ±Éå±b¯pÏýà‘æñZeN‡µ´•—dÔ>ÏK,\\•È!~˜Íª¦A&p¹]Sý²:5Íì©¡–b>¢6¦J›ÛP®8½h8}Ž€õW8²\'È¤^)IA`T—§,­÷Ö^žRL¦£I¶ðø$›€k3ú8-†ý|Ô+&àçó:•»²NePôúùpZdõ*e²è8ë†Õ7X“´ðöl¯ì÷aøÔïæÌWæQžýÞ/†å·¾nÜ¥œh‹Î:•·`Yšõu³­4WX¢–\Z®«N&V<rpCá |NÊÊ§ÑàScÄÂSÅ\\làh3*7)f4þ’%	[¢ 7è\0¨àñáÞãàë^7Y‚ÝäUVüo6\0Fgqªãl5ŠRÓnó-oÄ\ZEk}rÏšÿos»‘-#UŸ–ú\"=J\ZTéÅmbËŒÁòÊVÉºMRƒãiqû×\n%”a²2îîcòâ“¿\'Q)+‰Eì#µt±©„ç„ç=‰J‹ÅT\'#¦îÉDB/žè-Dnx‡jª„í Œb»)«8fa¿‚¥®Æ§ŸÃø\"‰ˆ$D3Ä¡€õ›µFÜzÄ[<ú„È»@Ù\Z.†$LaÀ\0jÒV!P\ZvrÜŠ´±S²(LÕíÏR\ZÃ}_Ø.¸§Á¨÷p7ÚÚ„R*9FC™°ºÊ‘Ð°•b£§ÜLD0¤Â‹º–|=+­Û<4#ÊÒÕÎ2T&	Û·’IEË¥ˆá»	ˆLŠ“\ZnK{yb‰YlÊ,j¸®#³Ï›m1F·a®ÎÑ·²µ	Í	Í»Fs¤rv]v0ƒ|ÆÓHöýrµ™•@§Þ•&7;¹ë»U¿»…\"FYa§`Ö6.ìƒ¸E‘c©HLP~¨´¿²0>®xþ`ÚA..f›]hÅaÂ^‰Ë	KÃV\"Ã4¨Y?_ai-¥IË&-Y7^õ.ù~ÍxõLÃíf,ªl\rñ‡òiØú.¡:¡z—¨ŽTÖÖpÖŒWú(ƒ/Âö;f”Ûƒbü¹ìŸÑœ?p×®3.†ø‚\Zv;Ü’¼±ä3#°Ü:sÁ0«Än¯•pBqiPæ`”ð^}Øq99É%ÕhøÃºØV%Tj•›ì¾$å\0Ð@„±]æ*4ýÖOWK$@ïKVNre8šÖ±Æw-£<ì†@\Z6/¬ÓV<YíS\0|Á¹ßfVNrM‘ë)Ý~õU]t©gáÓ/šŠXcq[£\"ˆ½HòãüÂj÷ëfJS¸WeäLû˜4lØLÆ¸} ”Âz>pÎ}¿m*Âsñeà%éõ¤×£¢È+ðýQXyõ\r÷¤Fj1\0ì†z´«„ö„öç‡öHín(\ZV.ï«á©ï¸Xfß¹båú‡ãlñ–ˆ99Ç™jLh„‘IwrAhm¨ìnGË]„%ûÀ¢øNÂTîú’))xr˜L³z\r¹ë[.¤kóÉ$)õ• 2U‚&m½7A)ˆÄz!s)ýÁE*ÓE	Ð{DSf1:-•©N8R¹tÑÅrDLAt#ð;:ëYÓVC)`‡Ð=[¯Yîú”cŒå$ÒìªÊr)½ýWKw\\¬¶­GŽ®¹š×Ó«Ë÷7×\'0Ùí§ßVZ	¸zâó«ëöÛ¿_º“æs2¶øÄËìº}›æò&	í•äjºÒŠR<\Zb´©ï§{3‘XPÔ!›K«Û˜`’vLOA&Vo8Õ®s|Š\n©±çöo½eRŽ/Yó}¡§\n<<‰í2A„ïqHUÊñ%@ï=UT1\Zòæ<Ìñ5mdï¸#j$ªf~\\ÌØÀtô¸¢`¸;8Û·N7…=JŸÇh£YŠ;\'Œ¯­WVz%øc¦vv}õ‹ç™#SM×„QÆVE PµÏ2ë•`¼”±siÇŸ€ŠÉè¥æØKÙ¦Ójˆ²X»ªöÊÂ–¥[“8zŠ53Øõq6§g‹:ð#-ÿ«žÅí<n½IK¯Æk á2 Ig ±O2 È%ÒLZ¬Ûš¬>jÂ(vƒ=â¡_Í”ÐHœ\\H¡ýfûn]ðØçÀ8QÁñ{Ânýkýrw{–ê	}ì9ÐB×z!3´…¸ŒSIì‰Æ÷g§KŸx ±j3X„[Hk¬hƒ¶ÍQ~»;^aŠJÉ:´Ô/ðñƒÚ&f…žå¶lê½›|­}	hK9Ú&CèYn+l2™\0\0ýŒƒÚ2n°*\ràTurË.u\\^>ãNÓÑÔ\nÝùÔÿÃÃú±0DM°ó<°gk/*l–ùtCŒ%$VJ‚Ù~=KkÙÀOê»Ý[>Ý/ùœX‹Æ‹ Á­IÊêÙaÎx#\'Ñîx	&\"¯£6põóîsB/?—´.mgacÈÇ¼ý¤Ñ•†QR1^FÂ¦óHˆgé¾ï¥%Ä–ô/]ø]vÞö\\×Ý»<+ßâºtú¹¿ÂïaïM«û{\ZBÙÌÇ‰ð€…}(÷`\"¢7Œµ˜Ö‘ŒÉª—#rÇ^¡DYŒ I¦-÷ëÓà–Ÿ¸ÝCGæJÎmUŸÊˆI¬1±Æ=qƒÜõTH@KríoPe$Ý•à¼/N‚g±‚(	ê¹*ˆb4,ˆ¢[8FãDP]^ý…ËÀ·ê*€ocæ‘ß;‚…½(Ÿ|¤±ä„j£”äâ’NŸ\\EÏ»VU-Gw£ñü&o*çÉšÆ‹bñ¤6F{Yå–eV÷ãñ}b\rCßÞ…Ó0Í)R M}¨ƒ…\r/¿	§a–R,Ë&m}3cKïÔ¶0™ÈgÚ„Ó7WXŠ´Ê÷ÞeKmœœw\0ç8íÌ‰ahÇ\Zùca½k|øåÌ…ÕlíûöMmkßþçù¹ú‰ëÃ¬š\"—g~C›2¾¦R_Zí,±°eSAci—ø560£¾*1µ© \'?ë³@PÖxF%^Î\n«Žß….›\n\Z=£†¡ÙBzAíæKj––ž7žQƒ§WQ¾½[jG×PÐØT¢Ma©›©0Î6ô\\-	*šÎ¨\0‡\0+/Q”ø+õPOëžQaÐòE©¿5€q¹© âäÜžÒ@PÙxF%ý„	*|K?Æ7VOß4zFó¿9]WÂJN³©œúì¬}~È©\ZO¨QØ9zEë6ÖŒo¬œ¾\'gì|J*Ö@IQã/\nqáç(\\¥%rÖR±ºk\"»nBàâ\"hB1Së‘º$†¿7)\n)$E­=g¾a*©AôÞ$)¤u¸ð–Á|„eLÛ8ød;TIBíìˆþ©³×ÛÍJH	\rÝªþ<:Û7í~dÑüÃjŠÎ`ÑüÙ<&Ãë]Õz[Ÿ?ôúÓ2qòµ!—Çb¥N\nx‘O/õfÚP¬8ˆ+¦Pb¨?™ËäÒ¯6©ì¤²7UÙ€]§´i¸Õ¸4˜nÓ†²Š†,w÷J˜N˜Þ¦#õ´;Ñ…™mµŸË œbìÜý_4U ÷àm÷öŠHC¸µ„+0`ÀÅ`4þÚäÜ¾1VY.Äb€\0¶Wã »r—+ f‡i\rû;íd4±ŒÃ•?búÆ×ÚèÛ·oÿü6´','2020-12-11 15:20:37'),(16281,8632,'audit/request','xœåXm¢Hþ+Äd“=‘wAÌäÂ ¾dT<ÀÝÙ»½˜ZåFtÜÝÌ¿êÔ™ñö%ûá.¹Ièîêêª§žªjEº è_r]ÕË\rÊ×8ot‘Îë_s]àõF^ b—›IˆÝHy¾ó²ÞÈðÇÎ‹!F!ÎèA z`iäEÄDÐ™f „‚(‰qÎæI¡\rÎ[›$@\"BNØå8cÑ\nÇE9\Z&Éçh³AœÒâ™×w‚ÐeÆQ¼;0­½hËWŒ‘¦üû·QÁ)’Ú’ÚÌëÛ¡77™Mt™î“+Æ\\gÉsšÚâ[²¨ñ-Mc\\´DYTí\"¶õ\nœ–§KŠÞ(ð¡àÖÅvÓDpN Ìçdæ—ÃóÙí¦ûñšoušÑ|àÐ>ZV¯ØOëÙ4^5ßpo¨¨öDA­b²ø¬Q¼ÂÝýµ/•\Z©=Jm‹ã 	£xUš©7VŸ£´É„¢Vàg²Pµƒƒi@°·Ü&Î+Sq\\\ZR¹$É}TÊ\n0œ\rg®åº£Þ5ò)$QlËRÛ÷%¹Í‹>öEÖuø.³òly­ _\nh¨#._FB¨ÉK^––JÈûB¨-úKqÙñ¥ÀG!¯òKŒ4Uk*¨×ôJ2Dø¼Ro\"xð¯¤›ž\n™Ez<a–¬\nÕª$–ËÆrÎ¢âæ`÷çJ2šÊ‰¼ýø»t¶šÚ¿m£rç+µGT	q—8Ã)µ(Rã¾ÂSŽ”Cá6Š¹(ñ\"`ïÒUìg£8ÇÁ.Ãl•9†Þè=°Ë${@YN“¬L½¡ñT@{*\0‡íKóá•$ð‚\Z’¹Î0Ú°QZ\' Š-AŽÃ%À›4³ÎÒ“f9QyÇÎ’€ do>Õ* ælmPS¡dÒ(ÃÔÎôÖ»&#t˜i²‡‡&0¼¦+¢ÎóÌ`âÕŒ4Q°Æ¬™ÄE–ÐìnÃiqÂæE’á&o‘h2Û]^€{´‰B o“I¡b°°Ü_ó0(«AÅÐY†V[D\ZÕHõÔ‘¡x°Þ§´$±|–Â]ò*Ëqq=÷ú¬F\"ø$»*iÔ²\0UñÝ¥a•M´,¥D©ßY´Û~ â‚ÒË\r€ûÁ [Íã„®—çT×ë«ÚÎrv†2´-ë¥þ%Òù’*\"5N2ˆ3R«€[\\¬\Z|Àx`y•uQnü…€‹>ÕA\'fg*™è“Š^Ï¢E¹K©\nÖÆ¸r¬ÚÇ¢~“„ŸN]\0T»–óÖrÈ”,R\Z„ŽÕ9–é-\\Ïðæne4ˆŠ¦CÏ›-†¶ë}o+Pª=s8ma¬©÷¯ô‚µÃ0Mkæý»‚È?1qaMM»7šþ±5<ß06¦ƒ9@üýá‡iÛ·#ëÑ%H¶RŸ«o9„ø?Õ+¤\Zýùlà=k1šº–9w,ÐÿÛÜr=÷¼acu·èÛÎ;ÃéY=òv©Ú“X\\þ¬»¸f;Þ“%Š—¤Û³Éª\\\"S“é…`]=.w4r™¬¶8–1^Œf—=±™á\ri\0¿\0éŒ+1Ïý(ÖÏÆÇái¾”Cú/K’‚kÉ:lã0¡RuË.m^¸£Áª›Cy&Õ…ª^¶û8IW%pÝHIcâÄ–Ü Rõ°¡øŠyÚ]IFUû§ÆÄúÞòxÚeôz/Ù <zC²æXÛ³.+h×Õ£g›ó	Tß…cÛ^Ý#¹=Ê¸‡‡ZI«CWQxášC«tæŒDÀ´§žuç]¬þèîGB½zñÎÏp˜Œ¦õê8aPˆ9³Š  ce:#¨yýÑØ:Çû…ö2a[é:}W\r%è’å¶(×Æ;  à¼‡>èT5¼ŽÂk±6÷(7wÆµ¹ÜÅKñz`xÖ;ã=	Ïrú†iU72s0â„2ÎH“Ð´ÇÕÝˆ$ÒQê,:ËÚ½§wbÚ×,NÛçÎ¨Îî—†ÿz¾£»š0ì)®\ZmPÆýËú\\o4±ý±m€Á!ä%¯ª</ÈÀXEéÀßà“8ù–z,]BÙjÿäÆutó±^è>2®¢â4¢°q~K#…ˆØ³RÝ‘NïG³þHA\'×¿o´ÉŠa´•©ÐütÏ$ö”>ŸtGK›¾ÕÁßúÆLÒÇ=ù¬‚{ö”Þ\n«_‹eyã<þ‚ É»,žg›cf_j“2%XGºXUáòÊœÃw…¾Å7Iøøø7i¸ÿ','2020-12-11 12:22:22'),(16282,8632,'audit/db','xœíYmSê8þî¯èðÝQÚ¤Mš–qg¸^ÜëŽÂ®àÞ/Ì@m£v¥­Û½Ü;þ÷=I”QÀ—‘ÁÑóvržsžôIpldÿJlf—ž$Î5OJUÇFÔþåÛJ² U[v©õ­ù]9¾8=UŽš§g–r|Þ<Szƒ„Ç½RÕ·ü1\rXŒ@vièûï²sz¶ýß€ÇCÑS¯z`E3MMC®`dQ“B½!¬g6›ˆ¥véÊïóÌHˆ]RïX}xxPoÒ ¯ÞóÐ‹bÕã·iììá±5ˆ<ÞOÔ(WînîÄp˜©ï‡\\˜\'ÄªJ¯¯¡›úQ(ÚMa)ôšafÌ.¹}\'IDëW¾8	¯Á{~ÎÝ(öF§Ã;9\nÛ%Û.U|¾m!\r3jTá_ºš]M¬a¼‘hê˜M–G“X0}«~Z?jï(ðsë*n&iìøaÚ\r€ïç\Zúƒ œ©Œùyèr¯›:—}¾¸97|GÆË¯¢8p„ÛÝÄ½á3îžúN¿û´ŽD©µ”ØÝù³yÒ(\ZuË‡ãÙ‚‰¢;Wš\r¹Ž]ù,pÏuR§]+‡0yQ}ó|2rwÁÐ“–Ò‰Xk|]0É¨ÇžœjOt,B:ódn%£êƒ”sC$¾ß¿ÕÏëÅs*¬ìÒgW®FNš…® ÇÎÈ±§ØBsYdvyfðTÛz[\ZÖ²6‘„&¡:$´¶$Ü’ð½H¸â›iÌÜL2¢SÁB„ò4Ôõ1•ßò‚BÉâØó½Þ!^scÃÑMÄ”0\r6m‰)^Óó[m$¤”XòeŒ)Hébì<?íÂÖ×<U`jãYT¨^rÿô¯ÃU¹*5‰]µ&J b¤ÏƒŠ Ã5OÛbckÉMq\\dæ<\nC>:\rëÁïO°\"M·@kW²®+f+µ°¹‘¸\Zˆê$ËW3+Õ¬­ºÙª›eÕMŽr‹DN¾Ëš»ù‚óÆç$%¡(Ó:lKÊ-)?†”+¾*MÃ`ÊJF²W%Öò¬DìŸ4Zõó¶rÒh7§…‡²Û‹£AÊ{û™ˆî‚x†¢\'žÎ¿ÎñsÀ3I»Oo\"ÙîÆÜI¹×ÛSþ©^Ô[Ê®<ªŽø¡:¸ƒ˜óò¾‚÷•22q±ŠVAP¡AÅõ6”ÊÄýÂ)ÛXü–÷æw\\}>¸üwaÉEáÕ±ÎôQxõEá¥tÉðŽÄ»Œr]ÀVjDé|¨¡=qî×Óï2Ê•wr„y?ÀN<Y^Þ2ul¬#Œu¤±Nf¨ódh¡_ø-ù§cTèL–¾¯èLþ…ƒŽ™Q}z*>í³KRÑ &B[.n¹ø±\\Ô‘ÁäÉëS\'sòü%R¯yÐ	pà9\níå×HÇ~èÞ Áû]Híhþö±‰Y¶ÿ-‰d7ÑË—¢1£~ŸÇìbO:šTøaX¸@1áì*LÜž}žÌe>Ç–;Âh\'Ãi©D;Ÿ0)ˆ•¹t&òyÖÍú“3Ø™1øŒ.DÔ4ÍìKZl¬A€Õä¶N,ô¬Û`K€·$\0£‘×xêÑ‚ž}­µë3:¬Uo+=oËkÞ¡VÑ(¡ÈÔ˜A4™ˆ®€Q<ì Ê!Ñ™š/OFõ‚ou–P†eêã£*~_ýÄ\nŽ­o¬Ÿ^ïÌM\nÄd²9}ÿçk*©<34ƒîª1ûˆ<[U¨e´M´Ï“h#oôÇÇÿ±ÛJ','2020-12-11 12:22:22'),(16283,8632,'audit/log','xœíY[OÛH~çWŒòXAìß\'b¥@Ó-+Hº$´/‘Ç‚_èØ†¦ˆÿ¾gÆIpbgQVÛªˆ$ƒçÌ¹|ç:Á¥˜Þ§Ô¦ˆ¥©;ci£íRLè}@UX™Å\"¥Ø IŒÒÌåóí€bxéð\"@B0mÌƒ`tÇ¦£)¥É\r‹¡Öö)6UËRU¬“µnÉÃ.UéýC@\røËÖ4\rvÚ‚sI:q@ú‡þgôþâô÷O/Îzôþ¼†&yÊød›.þttœD‘û”~ÉŸ×êb[ª³Ð/-7.:m\\!k\0G\0Pn]®ÜÝÝ)WY*·,ö®øì:ãA) m”(ñY˜*°nÝ\\ÝˆãÀ)b&Ä†Ó–_æ±—Jbß’b¿ÂhÃÝ4k¢­L9rSÖ#·ìœy	÷Œ³ù<EhƒÒFûa¦£ÚØ2m&)ƒi]ÜÄ3ôîyI3©EÑ<ýÒ«$Í9órž&ã4ñ7ûÓ¶?Ýˆ-7ŠçÜµî+¾Û£À¶Lÿ”Ð;¶*¡·ÊÐŽH£îi÷x¸ƒàçÚË[€šq7ˆ³±Àw¿´æQ¼ñ³KÆYì1œ¹Ómß.ß‘™Ä—	\\aö8õ®Xä.É3ááG=RÔ îíüÙ?éÕºfó%÷\\ÔAÂQ¿\'õØ•ï5æynæ†ÉóºçýóÕÉÝ-GO¨\'J@§÷n“Åždµ\'ë.,©h²x¼å€²rDâûùC÷¼[Ïëù ÙÂgWj#™®«¡ØYöè[ØnŠÈnn^Û{Uù#*T‰Ÿ±þa‹EýÃk½LÓ–Iˆ~+7T¸qø“Cò:H‰eáŸRÃ²-Ë”jkšÛ´›ûA6†*Ãç¯ëÓzyº[è[P2Ÿ}fqªÔJI¹§tÄªT&V@Å@0cÙPäà@æï&¸ØªiUX~„«š£ézªfWSu~5Œ_\rã¥\r£”rÛúF™äuYiaãéR÷#&%TÅÎY»™ ÿ¤7èžÑIoØ_/qhwÂ“<c“ý¢­Œ¡À2¸ïîßîWñÉà™fãˆeW‰Ü÷8sáR5ÙCŸ:§ÝÚ•­]qý(ˆ•ü\\Îšûˆì£&ôµ¶[jÃüÑÂªIT¢`r€1‚¿Í½Ð¾e_a¦ÏXw5¢éæ²æjÛÜkš/tï¢I/wl5®Æ¦Yu5ì§îíë:šôrqÃüO1Œª ‡¯Ô+[¢A¤.…„°‘6*mµ‹¼eþiÐ€ëŒ)Â÷;\ZS;06±Uù½\0Y»ËjÆÓ£\\“¼®Ài†©“§2ÀPŸ?Ë½‡©¬vŒƒ’S\";©ŽpØ^YPû_…ú/ˆu?_ehSOÂqˆuQ‘ŽWjìÐRS¤I1Šöh~R	|.%„ÐQÓ‹âüíl\"FoœÂ¤3Î›öèxÓž’ÀÑ†À\'Z6-8²£ÿhÐñ<–¦(KÏ¦ùlÆ8\nRXÇó‘Ÿ3±sò¹¾Ï¼NÒ„\Z^1´èEâë °Xõs™?d™?Î\"ú„À˜Ÿ‡ŒRè¼Þu¡M]éŽ¦\Z‹<\"ÛòH«à€Ý¥JèÎ¡©¦J£Rw¬úûøþ(ñç•ä!ßT~öÿ“´!f²Q,ó`Íˆ…Ä8zv$éª­;¶.#ií¦á\0åÅÇwawcœt‡hâç\\Nô“Cµ¥š†‰-àc¨\Z¶t˜]\"%|>Ž`¶9WÛ:Ôër¶M­zŸ~Ù¢;VñSÑó6sˆ]3r¾ñòýæe£¦Û²l¹aðí{vì8Ó\rC-âÌùQ+–A4ì,ƒîñ¿`œiëŒ{xø«','2020-12-11 12:22:22'),(16284,8632,'audit/profiling','xœíZmSÛ8þÎ¯ðäKà½X²ì7Cizå†&w$\\¿d&1¶\0_c›Ú4íðßo%\'à$ÎIi§™0à½íî³ûH+9®Co©ÃJ(Ã8W\ZƒMN¸EP#uL§’¡¬4|Õe\"f#d3FÂ6£ÐC¨‘iê^É´Òp,œoC¡ÄUAÍa§Ò¾‘Q]oß^EÒË‚8rŒpœ~:×qš&Ò%iÜOc/p‡}ÿ¢á_Dn(§\ry½Vþ‚É	u*ã èù½ãÇ‰ä©¾ÇYèk’\ZÁB@	\ZL¥k®¡ë0˜zÁÔÔaÌ©ÔoÝ¤~wwW¿ÎÂaýVF~œÔ}ù)K‚QX‘ä`”Ê¤Æ¾¦õs(×n®o*9hÃ ’J>cvŽÑå(Òª©vKIŠüv”s*ÞÐMÓÊ¬5oÜTÁ[y&½8ñ\'gã=\n0uœJãþd€Ù›fã>·ìU±·ùŠØÛ›‡=F¦…ICÿ[ÀžØN¥ó¾ýÑxw~zj·OÏ?´:Æ»³öc Ô,3.\0\Z†nä;Îç‘ÌYY§Å7M\"¸Žd¾šáù4	\"d#Ñ¤„åë‚(¢Él˜¾Ó<mwwøùäj°8¤YâQÖWäß/4Ga4W™ÈK™ÈÈ“~?s/†rysaøŽöW]ÆIè*³û©w-CwÚ=SËÏ£©qÔ1oçÏöI«lÔ\'9žÎ>R;êÂvKë±«Ÿ%æynæã+ã&/«oŸ=ŒÜ]2ô¤c´T µÞ.™dÒcOOµ§:–![² É¤zÉ åÂïÇ÷Í³fù\\‡†š]@øìjmô¤¹ëJzìL{ô-4WUdWçÏ´­·¤$ðFnãToö–„[þ(®¸b$¬Íd¡`”+b\\¤!¥S\Z¿\n#÷ã ð‡dÍ…Ì7S&,Ú\ZS²2¦+Æ)±Å&žä˜àÌÖ›ž9ÊQ¾<vG~õaéNÆkž*7™ù$ªæT/¤/¿WQŽªÖªž&^ýH•J@%˜.‚Š¡Ã•ÌºjaëèEq\\l•<a=øýVŒ¨\r‰0Ò¸²up]1Z¹M¬ÄÕÄœ²<^­\"®ÙÛìf›Ý¼4»)PnY’Sì²æjg=ã¼ñk’’qœç:bKÊ-))WÜ*-ÓÊJÁò­’ \"+1ù\'­Nó¬kœ´ºíÙÄÃØ$ñ(“ƒý<‰îCòÅàF=ÝÝ/ê3‘€gšõC™]ÇºÝK¤›I°güstzÞì»útXwý0ˆê£ð¹¬îdß¨b‹Ô°¨¡\Z†\n4»PªHî09ÀØÀÄ!ê·º÷ÿ¯`&Î•_¤*—¹—*èÄ½t™{9¡{\'É»örSÁVâjÌù¢«¡=uo×Ëßµ—*?ÈÆí\09ÉƒzEK(DêTXO	ëia½\\PïQÐR»Èkò\\jL¾ßÑ˜â!c+§\"þå©XþFîT4¹…ñ–‹[.þ\\.Rl\n}2\'3_ ìéK¤*Yó@pà)\n0ôük¤wAä—Þ Áþ¿ˆ.„v¼x{„Åƒy´ÿ«ÿ‚`·ðóU†¤1KâáP&ìjM:~¨(±Ã´IIÆDò«0u{öf|²ùœJî)¡½§úëÙDX‰oìÜ¤*žçí1ñ¼=½9Oä…˜[–•¿¤%æ\ZX-Ý¦ÌÆOæc[l	ðšÜdúº‚ÌÜ!ÚÐóü¯·GÝæ\\Öiv?JôµÀàÕg[H˜Ql™tåßgë‡”B r¾\"q§%ou^–@™¶E§GUòcó\'Qrl}åüéû¹Y	„6w|ýž™ÆLœ™È“»j\"~Fœ­š¨3e¼\r´_\'ÐÁvôûûÿ\0¿pà','2020-12-11 12:22:22'),(16285,8633,'audit/request','xœåXûsÚHþWTTy+Ùâ¡!Êµ\'ƒxœa!ç.WªA\Z@6HÊH<—ÿ÷ëi~ì:¹Üíý°Uq$ÍôLwÝýMH—Tý!Ñ›zi¹AÉ\Z\'¥6ÒEýá1Ñ%Q/%)JwI\'òq©è²(¶a¼®—þ²ÃI:ÀÈÇ„­Éö©u”¤%“aÏ˜€ò‚(ÄI%‰¼\0mpRÝDÚPªa—`RA+¦Ùì0Ž¾›\rª©UQxw+Ima„»£pÔ\Zn£þ^0âxƒ?âÅuÖT¥YU\ZÂ»ë3•…Mp…>öî£÷BgM¢-®iÍªX­ËšXÕ4a†–ˆùªRîŒ…)è¯lp¸J×tTÑKRK¡o\r½„<ÇÌº:ýå‡Rð©v—DaYHñ1­Ý¡=J<ÄiYøµök[ør)VE‰©Pùz‘„+6JVß‚¸,ø°Oñ3Ù\r\nW;\0†a	²€ 9+ã¤Mwn•qÈ^4¶J>9‘~Ù’ºöÔÖcåp8T–ÙVvdÃÁ~[ðÖˆ$8½œ;½Š–;ìEÑ}é•às:˜ÎÌÙlØ½DIñ%E–u¥±X(õ†(/ðÂSëš×D-±-¸^B–—*Z(¾‡<\rµä¥´¨#É×êK±®,U_\\(¡†¼XÊËÖBñÈ›â#­©5¼&l¯yèB1dø»h^ð/”«ž*’e¦ž0Jg¥|V‘³ic9¯ ôêhõæj4œÔ#Ûûðåš×ÚjÍÞue+/šÝÜÛˆ« dQ§Ù›¦±^«½‘¸MZKL0¡_jó{ÖÕh¦×¿\rÂÚ.ö!à¿þ¥Ìãw¬P·*it™1\ZÄ¸­ùâÃukØ_º‡èwïŽ×«ƒ?š}jìÇ›Hº½|S7Aòm·½écm˜¦ý÷csá-4üIlYž¹ßj7û¤·tëòz§‘›ËK¦³AuB>L¨ÄÉÊV/i\"Ðž\n€õûÌ_j®¨¶°¤\"I”š>kQa‚Ñ¦Ä¼´¥¦\\•4¨>é¤0\'ØïdµF+ðv<\Z\0€v6Yj?f•\0`ÆQ˜à3ša,C\r¸­L£DÀ¯\\}å\n!S4\Z 4’yŒB9\rüõ®,H-aíá¡I‚¨éª¬‹¢Ð;¼&;È[ãJÊ‰D,Ø\rÐF•$.ðæQ‰²°Ý%)ø³G›€F³,ÄÀ|˜òî/Eø\"˜ä™6%hµE,¸lG¶´“×¯“×¯\"½äšå\n8Q˜¢]ÎÍŒOŸdYÁbtž®>¾OI°Û~¦âŸ½ÌÙ\r`üÙ K;Å€®gçl¯wï¹¹Ùè´Íè_tv:è%™Z€Õ1¡“Ç\rÌØât±Œ°O­™“›$Æ:–Ú]âÓ|@Ìb$=zBñšžA2ÃÞŽ`07Ä¹t–¦TRW‘ÿ•š ðÔÉ¡œŸ¤JH\"-xÏ¸ïS³Jþý2‡h]¨Wx‹‚Í…\n„LƒuQ½ˆU½hËEh\\C´Å…ŸˆQ’\"âÓ‰UœÄ+©õ¤/\"O¡.fi$œÌÐSs/ÿ‚‚ü &Ÿëf~s.a^ýíäy^WÜq–é¹T>Å]ÏÉ!÷ž%+(C,ÝR(Y\ZÎLûƒiS#àðÈhÉ6»CÛì8îÌ1œù,OhŽr\"8ÎÔä¹ý=mš¯™ƒ6×è›çÿÖu¬‰úÝ‘9é;ƒ§½­)f§Ñé˜Sç?ïˆdñÉF®9éXÝá¤ÿ»mÑó#cÒŸPßÙq§œOSóg\n¾\0 cY×Có/Ñ!>[ö°?œüXŸDÁg‹m³gÚ´ŽþÝR3ßôÖíÌìžëX×æäÏ`¤\"oÝže4ì®Ù¥o¯÷;²ôŠô°Â«ë§–í<éÒdù5)Ûr¬œC)Ô¼L^rv{½§£|/±Mcä§ozj›7ssæÀÖ‡}¼ÖÞe‡¿‘	h\0D›Ô²¸\'‹ ÔÏ¾‹ÏÓ{É>Ù$ŠÒ\Z= ƒ¤ÙãÐ˜?*27ÝÙ°?Â¶Yá‚œ{ù´Õs\06«\0ZFLû³š\\­W% ß.^(|/<m2iyäë\'ÆØü^Æ?­2ºÝ—	¤>zv:g›cË1_ß Á©´kuæcÊ}¶e9¼zj{Dj@yµuºÝÔxÁ•‡ÏufæÌYÇÃ­fö†·g8Òà“? S>Ãaœ±mìþFò}\01Vô_E¬:ö€Þ¨3¼_ì^B«ñ:~‡öª×²Æ/u@ÀþG»Hàõù=­›Û#nîK²â^÷\rÇüh|r‡€ŒÝ3:fÞ{túÃšT•že «ÛŽ5ÊûZS…ÔYtÆ¦3°ºÏzhjÛ™.ÖÏí!g„?¢Y©@›#MSì)°\Z;ü€GF½×(<\\¯3›nod`°…)6›¢(©ZUkiº\'Qú‹ÓI(s‘ÕþÉu£pñ‘Ï{lýÿú¦“‹³â	2^ãW”¾¿`{Ëº[ÞÇ ~`½kÑÊ0¤½7:šÜ7Iøéö†Ú“ø´wÀ®†Ô¦·\Zpß)QÌN¿i6i­{Ö„µôùOŸ®»Ì®–ÅOŸ$8Ý‘pN6‡UËò<®K+Ðe;vM*û‹é›Õöøøo™Iˆ	','2020-12-11 12:22:38'),(16286,8633,'audit/db','xœíZ[oâ8~ï¯ˆx¡]µ`;¶ãuµL‡jXµ0[èÌ¤‰Ûf››„¶Ì¨ÿ}íh€ ¶Ð‹Š2Ò@\Z_ŽÏ9ßç|ÇÁ4 ñ;2˜Qòx™W<*ÕLã·cqEå¨EÒRç[û§r|~r¢µOÎO[åø¬}ªF¥šc@ñŸñäh”ÆŽÓ³/zGç™¾mÿx8–=Õšm@\n4\r\0HXEÇP,‡ca¦FMƒÈµa£té¸¼$¦$Ä(UoÍ°zwwW½Ž=·zË};«6¿‰CgäU…At ×Sõ›»Qõ\\\\W†×C9\\Ìä:>—ö	Ñk‰Û—#ßŠÀ—íš´äÛm?5f”,×Œ\"yÔ™/_Ìˆ×Å[~Æ­ ´\'Çãa2\n%Ã(ÕdüC‡€Q„kâOºV8uºV8„HßÆpªLI8Y6œDÓw\Z\'£îŽ\"þÝX£ŠøQšŽ÷}Óãû™wäù7C~ÉCî[ÜîÇæ…ËW7g†ï$	süË ôLév?²®¹gN»ÇŽéö×)õŽZ;·›­¼Q7|<}$¹(»ãJ»•¬c7ùÌqÏ2cÓ\r®”C1yÞýöÙläîŠ¡ÍŽÒ’H¬·¾®˜dÒc/™jOvÌ‹têÉÒJ&·W’¡\\\Z’Ä÷ç·ÆY#®CÅ+»ðÙMV“Lš¦.§ÇÎÄ±ÇÜŠæ²Dvyað\\Û†›\Z¢˜n#	ÄJê	¾	×}ê˜l%	±Š€$!„Yªê”„ÊYA¡¤i8öàm¸¯aJÑ6Š5Â(HÅ\ZDkÇtM˜b†À6*6¢#XS<SºZ›#Û‰ûbëÇ›Ö!ýi¨âa½à6ÿå\\ùiX“eU£ÐªÖåUNTT—£\nE‡+wåÎÖIvÅÅèB-ã’ïóÙÐù¸üùW0€*NÁJ6	ìšxeTÃOãõS!Dyµl`)Ð}Sè›—ê›çVÉœl—M÷»ç¨ÏÉJH&z‡¬,Xù1¬\\óa©#øq÷9i‰qú°D KKH-›­Nã¬«4[Ýö¼öPva0Šù`?UÒ}¡ Å¥3”Ÿæ¿æ½ü¹h÷=_I»r3æö`OùQ?9ot”Ý¤B¬š¶çøÕÑP$—÷´¯”¡†*U@ŠPÜøÞîtÅe :€PÈ@ÈPYyoyÓU—ÓËï¹%Öœ—`‚N§2S]•`J_˜à‰„OòÜËI6¤t9Ù¢=2o7SñIžeXÞÉB–ývÂÙò²ž¨«Sc=i¬—ë¥†z†Vú…Þ’ª(óœIüŠÎdK-‰(hR øùÉø¸×¾Œ”è³Ý¶ cAÆ\"£Ž5”x§ÎÕçäéÃ¤2Ú° \ZÅø)\nðüÓ¤cÇ·s’„XŽ®€v°|ˆÙÌƒíÿ¤ËØ5øü%á‡ëòP€]nJG³9~–#šPz\"&Ñ¾Œ›KÈG\"‚SË=i´—ÆéE@;ŸÉÉžºt*ñ¼è†‹þdö>!\r!eL£IÅ†ðXOrMÓYA€‚\0I\0]›>æ~ü¡RäW$æó¨0i•_²*¼HÔUY9iž6»Ê†ïq(ÄÚ”#hGÞ.9æ\0NüykºŽódò0ñíÎ±E!M(t„ÞŠGñ{3¶ìÌÈ‡òÄ§.´ôÔ¹Iã[AaªIY®½-ôÖÛž)’ú¨ÀÞVbOƒB~&Ø›û}ˆÆ^ˆ=î™Ž;Þ_¢òyP±ïµ¶?D €·ƒb=Á \nÞƒëîƒ\Z(Á[\nA\nÒ>¨s?&ÑEÏóï_ëÝÆÂ1\\§!@iÂdiƒCP@ B¦*¾É¾2ð¸„ã¾gÞ!¢\ZaŒeË&FUuÓ³lŠtªÐY6ËyqñÆÇg¯÷Ö…äsIÔ\Zp¿^ó éCj)’÷VI$ALŸWÊÜÈp½úpè:–ùŒ—I’2¥”Q?‚2ëž8S\nà“‡\rc\nÆ¼>ct7þÂu«1','2020-12-11 12:22:38'),(16287,8633,'audit/log','xœíYmoâ8þÞ_añ…öÔBìÄNbÔÓ±]ªåÔÂ^¡»_ $n›k^Ø¼´Ë®úßoœ\Z Ü¶¢½•z[	0ñØ3óÌŒç1µ8æßcnðš/âØºq­eq¬òï.W`ÄòAÌ1åµˆ¸a€âÄŠáÔZ.ÇðÒàE@„`^›»îè^LG…(çáLRPm93E×S£aªºÉÌl±ÅþýÁå¾ªjèLi=ÈKÚ‰	Ú?ô?£ÓË³3tÒ?»<ï\rÐéEÿMÒXD“m¶8ÓÑIèûVàpþ%Ñ¼ÊM/¸0/\\§×®\\OÔ`K\n4ï¬¨yß¼I|¯y\'\'ŒšŽ¸M\"7õ› Isš~è/n^Â¸1»™Éå°“çBê§Ôle˜_¥\0Lr^—š§äÊxÍö¬8–c¢.}ygÅ¢\rKîÄ…°ÃÈ)6Næ³lá5Îk­‡MS1tJ24IMäú7¸Fïß!;‘ÙÁ‘?¿xü&Œ“ãHØi‡ã8´]Ë;Ó–3\r,_,&òçÀ«%à—ûnM€ž\Zoz“RfHèõ2ôÔ”uÔ9ëœ÷üÝÚið“Èrƒd,ñ=,Mx©¬=ŒÄ•ˆD`gœXSOlŸ.-ßËJÅ\r®ÂÈ·¤ÛãØ¾¾µOd„íˆQ{€\"{ïÏ~·WµêVÌ»§òÐâ õ{™ûÙ{…{¶•X^xŽaóªçý‹åÊý-K»Ô“g@»÷~Ë&…ÄA¶Õ¬B:÷dÃ’âñ–EÊ%¾Ÿ?t.:Õ{#,›BúìgÖd›æ¡«Ø+{Œ-L×ef××¯Ìívþjšo±±n¨$+B¼ÒÌTuQ„è·rAy\'®39&»Aª1l¼AD©¡Q“dˆª+ˆ²í\rÚJ7Ã!ÍwìÓ6žÐ,´-¨N…#¾¹×AŽjfU3Žìf[Ž*@%àâ¨®E2”%8ÈÊw\\¬WtÀMX~„+ªiª8Ç••qeŠù«_üêÏí¥’ÛÖ6Ê\";V¥‰±ù&«RÃFÁŸÁÁòeˆAUv{ƒÎÅu{Ãþê‡ö\'Q˜&br˜·•1´º3ùným}•Ÿ‘\0@ãdì‹ä&ÌæíHXp«š Oí³ËÎ\0íg­½i9¾4ÓÄ\\Ô9Du¬“6\ZJÃ>öCÖ‰B”#LŽ0F˜pB¸jÔþ•¢Ñ_Ô\'¢*¾TS¨¾ˆ¯º-¾Œ=3¾ECËÂÜ‘¸UÄ\Z3¶k˜­»ÝzZæüŽùŸ8Bé¦ \'ZšWöD…T](Ie£LÙ(W4zT´Õ/òš¨\\éLž¿/èL™x`LUEÏ™Y¹ÌªôÇ\\®Nv;â¨Î°þ£\n ÊÓÙÜ)ð²J\"gÎ&¸Ùá&‰ÃÆÒƒ<ÙÿÊÍF®ëøé&C£J¢ÐóD¹.¤“åƒ\n?4“TœÒ$g¤’Ä¾›w7Ÿ\0‚Í#©t”ãô¬<=Ÿ­ˆ™»t.ÓyÝ\r¯ûSR8ZSøƒ^„™¡“e^Ó•s”eþç‰ß)_U	Å¬ü$\0Ê\"k-utÖ=ïÑn†5°¯¨²­F^/8W$|½³<×©8— 7æ?Vº‡¸(¡S`®[¢ÿº‚56’!™‰Hì6‰O¹sÅäk¥Ñ˜ª«yê+©g<3õ€—¹Þ\"ïþ€Þ‰°ÿB)H4CÁ¿RðM¦ nà<Õ•˜ yùñ}{ØYãàƒ$¥“F™i“c¥¡P®ÙØÐ)ƒO\n„Û~ÍÇ>òcL˜N\rÃ(³ƒ©êŽÜ™SÃ?‰;÷¤WæÎ/wÉ£Õ¥­òíÛK²ÌŸB%hÕ%‚\0ÛW‘\"yÝµg3Ïµ­\'Ü]á,$ŠšñeU[©`,mÛqŒ’9bš^_‹¹1ŒW8ÈI…œé~D–ãDRÞÀÝÌÎ\ZÞT\\^åÿJb°ÅòbÊ…C…c)&Ž€.¥žà®êömnMeù0ªþÔýµ¢ô?>É)c\nÓàÁÃ?¬ÑÓ','2020-12-11 12:22:38'),(16288,8633,'audit/profiling','xœí[[Oã8~çWD})¬ µØ±S±ÚS4¬€ÎR˜y©Ô†Ä@vš¤“¤\\fÄßã¤…”¦´\\D$Ú_Îíûœsì`[ºõ;¶˜Uñ¥F7•†ga˜Ä0x#¶«’x¾¬4\\Õ‚0¤ëˆ „Õ1ôàjdÛç2®4l‹ë·gépÅÔ‚&±*í¡¼à\\ûüIsÂ Nâ…¥ù7ñÏuÆÉv$Q‡½8t<{ÐsOîi`ûrÒÝOÕƒ_ŽàƒÀäD·*7ž×uO»;÷[!ÈS}uP3dš 0å5a &°€4Ä™†¶E•ÀÔ3o\0¦Æ¥V¥~iGõ«««úEâê—2pÃ¨îÊIäü:ˆ$[£XFu?tå ®ŸÀumx1¬dNxTò)™ÎFAªšj7•¤Àm™0«âì8®L[óÉŽe†\\Ê#é„‘;ž8¹¦£À§–UiÜÞ‚#02\Z·™e¯ê{Áô=¦+ézŒ‘a’FúgÎõDX•Î—öwm÷d_ÛiïŸv´Ý£öÖWê÷g±Œsþô};p-ëçHf¤,ð&3ð*ºqFR$³…ÜyÏg¹“`LV:×³…çÝILßií·vŽ×4øùáŒj°:ÄId{AÒSìßÌ5F~ðàf$Ïd$Gº½Ä>ÈùÍ¹ákiÀ¼à,Œ|[™Ý‹éÛ“î‰ZîõˆµfG‹œµ¿Û{‡E£~È›Éì#õRÝA¸Ö>LõXO?ÌsìÄ„çÚ6L^t¿}t7r}ÎÐ½Žv¨Ø<ü<g’qtª\rÕ±ÈÓ™%3šŒoÏ¤\\93$õï÷/­£Vñ\\Ûšš|ÖSmÒI³ÐôXv[h®*dWžj[rQ#Ì`«HBŽ\rÌ	EIÂ’„oEÂE…Â +IBC\'H‘ã<u}BBí|B¡eaì{n›,¹®Œ‘ULÖ(g(KÖ0YØ§ÂÔà­bÆF1O}:UËél~l\\/éÁÒÝ,[WpBÄãP5æ¸õTºò—wdnMÕªÇ‘Soª«¯¬ÏzC‡s™«•­“®Š½‹Í‚ÒsÖ¯[Þûª4„u#+]Æ±â•3Óx¯Ò±„š¦7ØÌ;–!Qæ7e~óÜü&Ç¹yiN¾Ë²ëÝS²ÉJLÇù/YY²ò}X¹àÃRü„äîcÒÒ0²‡%AyZb´Ü;ì´ŽŽµ½Ããötî¡­÷£p”Èþf–I÷ ƒ†Ko¨>ííkõIphœô|™\\„i»I;‘nCûÖÜ?iu´õ´B¬Û®ïõÑ‚.«›\ZÙÔªØ$5Ìk¨†á†_Ûc¸¬DÐ&[k˜¨W7þÿ f^y-Ð¹(ÀÔ@‚MÒL}^€{f€Ç)|\Zç–r\\A°1c³Á†öØ¾\\.‹Oã¬ÜòF†P:kÈ‰îÔË[¢V\'ÂºJX7ÖÍuïÍµ‹¼&u‚É\0ü‚ÆäK-Œ),-	þød,>™{w«mIÆ’ŒïEF1>H%S/èôñÍ¤*Y² &3ŒÇ(@ÑÓw“v½À-ÜH‚`Ö»\0ípv	ó;2´ÿ“©ÿ°›øé*Câ˜Dá` #\0»Z”vînØ9ZAÒD²1µ‰öéfoù<8‘ÜUB»™Ÿžô×³‰Ð‚ØˆÌ¤…ç‡öø¡=9ÝI\r1ãÜdiÅFŒ%°XÊMMSð’\0%Þ“\0Âœ<¦^þ0Ñ2ä×æ‹¨0nU_ª*^¤ÙUUÛß;Ø;Ö–<ÇaØ0\'!ó8òzÁ¡¸\0pðç¥=ðÜ‚\'3¤‡©mWž…l<¦ÐnùsÅoÍ Bù¬A*\"C©Ÿ&äÒß2ãÆ¯=b0Ëróu¡·ØòÌˆÊJì­$öLégŠ½©÷CLþLìIßöàý•G$Ãšú/µüŠ.1¸’äØ)uô6\\t4Qù^Q2”½ø O½L\" çÉ×ÏÍãÖƒm¸N@éŽ¢Tµþ¶ú„‘Ž¹I|ÓM­ŸýWCÏ·¯ûÛ˜0“rÎóegº¾ì^6#‚‰wÚËæ¯¼}ör§.´˜KPk\0à~½äFÓ»ÔR´èT	‚\0ÓU…*6ê\0®Ûžc?á0IQ“Œ2ú{PfÑgÆ~t³¡dLÉ˜—gŒÀ˜pãö?©¯Ý','2020-12-11 12:22:38'),(16289,8634,'audit/request','xœåXo£ÊÿW¥Twï›cc¢¨%6þhlã`|—´W¡5¬m.8À—Sþ÷Î.¶“¼w‰úªV­t9`wvvæ73¿5ÒDEû‘j-­²PºÆiåi‚öã)ÕDA«¤Ê¶i\'òpåÒ×dAº„ñ†VIð·-N³FNèš\\L­£4«€˜:ã„ëG!Nù4r}à´D.\nˆÙa›â„G+fùhG~ ºR¸w¢xÉüp{àjÓi6>rzø3^ÜøY]‘[5¹É}¸ØãQ•üÌõ±û}ä:ë$ÚàºÚª	µ†¤\n5Uåfh‰Ÿ­ª0gÜ(Ì`>Àá*[“QY«ˆªBÞšZ¹.ŽsëdE«døÕ×Ù&¨\"°ÃwQîÕdä×ÃóÑMpùíJ¨µ«þ|¬£¿d¯{¼ˆ‹Ñ8\\U©ÿBEÕ3©¿\n±Çãƒ»Fá\n_î®r®‘Ú£Öñ8t#ÏW¹™ZeõèÇUÎÃÕ?“\r@Õ6¦QYˆ1«â”™ŠÃÜB•‹Ü5æ	HIDÃÖÖ*t A»¨tÄ0ûS½2,<C‚ßï÷ü2J6ü6	¨µØc\0»QôàçÖˆð9LgÆl6ì^¡…({¢,IÍ†Ü\\,äFSxá*\rÕm¡¶pÉ9nš,¯´=0SEmi).\ZHôÔÆRhÈKÅ2B¨)-–Ò²½Ýò„–°ÄHm©M·êU]Èº­kÂ…|ÂS!C’D÷€\'Œ’Y‘ÍÊR>­/ç<Ê®fo®DÃI#²ÜOßþ¦ºíÚêÝ4Q¾ò¢ÕeÞF‰¿òCŠ©–,‹µzý\'…Ò\"·Ä	NÈ—ÒzËº:©¬:ò6~XßÆ¤ÁŸ}ïJ¢0C.lãUÅËûaŠÝm‚yVÒ)(ä?}‚½µ=J ^|%ymk5½z.\0[îr#IRJ‹\n±å±Ä9À>(àý¸¨±%ÕDJ6|ÊÓ|Š#0ë„]š„\\ˆÊ;~\Zí¿þ^¨€„®h‚\Z†•qˆýSO$ØÓ^o«œØæ&ÑªÈ	ª¦Hš pý±]dy‡fyç˜åMØ-Œø4‹\\åàÖA•ÛlÓœØ¡À\' V¹‡)÷áJ€/€’}°€O´Ú ò¡RTûEy}ü!a%øtXÚ¬¥Æ	c]r@#IŠ³«¹ÝãU\n8Á;Ú2Žhå||¦¾dÁS;=ü%þvó…ˆaÜ@°¾èdi§Ð´|áœêúð±°3¢mòãCûákBžz5vS\'¤FO0cƒ³uD“	›š3›™ç§úWt¨\\.¨:0=h‘9áŠ’¹~:£¹æ†˜ùGfIŠå!wyß‰	r‘ƒcÎ~/×œ…öyÝ\0î9y%N{¾øtÓöW£î~ xÝ¯‡›ÕÞÍî›»q‰w_ÊáÖO·›Ûž>Vß0¬¿~\Zw¡â{¡mºÆn£ÞîÒÞÒiHë­šÜ^È]ø÷§9„çB¹Æä\n0*‰ÎECp£$ÁQÍ6…	dˆ6¸”*&b”¦û(ñÈÄ*Nã•Ø.r¥‹©k\\qÇHJ¦Â;šæ€ô¿ÇÉ«+–ÄÔ2D°7õ· 0êÍ_Ž³Ò+¦)Í¤ØTá2£“Òë§§\'š[3ÃúdXdÃFNL°Þ2ºCËèØÎÌÖíùŒ…[F|Ûž:–°oé¶f»9zß˜Øÿ±©cNlØß“¾=8oH¡P;õNÇ˜Úÿm’$œ™è“ŽÙNú¿Ù+=_0Ò\'ý9„à-\r“Ê–vôÎÀpr–9ú­®©\0Ö¾Ÿ\Zïb’õŽiÞÿ‹Þ©ôÙ´†ýáä}A›.¶Œža‘âý\\¹È“ù´oé]ÃNfFgn°ËíÜ˜Ù³ÓfªÌª;§gZŸu«ktÉÛk	ç+ÒïàW×OMË>ëß$é5)Ë´MÆ¬Ÿ\"í_<øz·G˜ƒ-±}ä§¯{Jr=§ü¼“zŽ|ºðCíä»ü<NÐ—ü“þ—DQV\',]„m‡C/¢RÅiÛìÌ†ý	ð´EKL*(·˜6{68Y¥“¦­.Õ\Z58·‹>\n?rç\'IP¶~¢·ýq•Þí¾Ìå™Ð‹’9Ë›¶ñº‚fÁs]³3º±LÓ.Îðú%u`ÊÕ„n‹Ð±vfÀc¹3\'éPž\nw6¤‹ÑÞàHR¯˜|ÇžÒ	ã¼¾	›þ=Œ8äy\0bÊ­|è?ÊXu¬!°soçÒ	Þ/´×ýÐÃ‡Z¼ŽŸÁU@	º\Z¦¤Æ—g9 `ÝÃ‰n±Ó¼>m¶K¹¹5*Ì}I…×}Ý6>ë÷@¶aõôŽÁÚ‹NXóR8É@Z„üè`gJ)u±aÌî³~˜Øö{¦‹ÇõskX”÷ïÝ,Äíi’bçÀªôøRõ^ ðûÚÃ±áôF¦{P˜B«%¢¢ÖÚíF‰îQ”üútÊÝAÉjwvu(]|*æ]ºŽ|ƒ}Ãfâ´x|¯rzÝ(áûï`i[t\rÌ×öIã@\\Ð~Ò?°MKŒDrþËÍ±\'æQ7‰`nÓÏÚð¯¸ÓR˜Ël‘º÷ÌIy™„!ÇYæWB–0”n]˜†ìÊ‹ÅEÐqœm“pž%…MrGÇ!yåkR:z­Lù{~wÌ7Û© ³E~%H¡=Í\\¨É ÎÝÂ\rqÐîr©ïCºÙþ#ò¢”„ùŸÆªªj','2020-12-11 12:22:39'),(16290,8634,'audit/db','xœíZmsÚ8þž_áa:Cr“€^,Yr&7—¦¤¥“@Èõî†p°’øŠmb›¤´Óÿ~’ÞÍÐ@^®”Ì\0ŽeiµÏî#í®ìØÐþÛÌÎù\"Ž+çö!û›gyEÕØmÄí\\í]õ“q|~rbUOÎO+5ãø¬zj´z±ˆZ¹}Ï†òÃ€üBª´s}Ïk¸£Ð÷Àµí›žˆúêI¼ïÚË\0^\0˜\nUwS\n…©PÇ&jn¦»ô:\"\'‡$ÄÎo¨xwwW¼NüNñVn]ñ9‰¼ž_”ÑžšOÑ]Ñ‰‹çòºÐ½îªîr¤Ž%Ÿ¾¯Õ¾ìíÄÕn)I[\rRav®ÝqâX]#<Ôåµ‹CÙåVœ‰v¹÷\'ý®î…ìœmçö¿Wøy6‡€!Æöå¿t)89]\nN\n±¹Žhb‹S&G“p9|­tR:ªoòïs»Wh‡AœDŽ$ÍÀñÅîXC§çS7#q)\"´…ÛLœ‹Ž˜ß<Ö}KÛË.ÃÈw”ÚÍ¸}-|gðxâ9æh±qX3¢öÖûj¹’Õë³èFï)*ªÇ¥p£ZÑóØÖßêµÄé„WÆ<ë~õlØs{N×rÍ¨(G<¬¼™3Èý;z¨õ`Ò©&33¹¿=§“‚r¦‹Æ÷Ó»ÒY){¬Ã•3»î³­g£MM—ñÄÖ½b#ÛÊæ¼òìüTç‰¶×4jqÎ×‘…j*ò\r7,|..¹Z€™kY0Ì™f¡œÆhˆñ€…Æoã…‘Ú±å¹­´âÊÆ¸¹ŽáaÄB@CŠ–†tI7•‘¢¹Ž›áHj¦15\'0¥ó#`§çzIS.ÝQÅ¼ÂDá…¨šsP½®øê])ªzVÅ8jÕU¨âYP¡|àJ$uµ°Õô¢8\r.´Æ4\n1ì:	ëÞï#X%¤`°	C²\n®Ë¹«‰!\\S\\äÕ¸Zã¸RÀ7ÑÍ&ºyht3F¹yAÎø#+®v³u%%2Ó™mH¹!åËrÙ­’´8ù9iiÂt¯D`œ–JZ–+µÒYÝ(WêÕÉÈÃØnEa/­Ý4ŒnÊðY^z]õíüë|Q¿‘€ÆIÓÉu¨ÛÛ‘pá¶vŒ?OÎK5c[§‡EÇõ½ ØëJ£‹ü®v<´P²(@yÈªµº¼Ì#€ÀD{\Z©27æùÙ5ÏšW|m9çL3B†µk<ÏÀ”>ÐÀ÷ñ»¶sI—alHé¬±e{ìÜ®Âk;+XžIBfõr¢áôÆ5ÁÒWÂ\ZJXCk¤‚\Z#AsõBOÉ@,Ùž¥LêÀ¨Ìxž!Ár—LÉ~2ŽÖÚ‡‘‘ÈUi˜GoÈ¸!ãK‘‘#¤³s„\'²s²¸’”G+¦!`-ä\0?^K:ö7³Œ¤J;3ðJßgKH\rUHÝýc:ÿx»|Ê2rL¢°Ó‘ôvµ*\rodèar”5¡´¦Jh¯ûå×GÁä†ÚHqz§?NˆdØ†§**‡žÖÇ„ÓúŒ	lL	\\BÊIj‘¹–‹¹	’›À†¼(¸…˜.Z ‰w?,0d@êúåôY\\¸oU?*/•ÄÐñUÞ8)Ÿ–ëÆŠ§8„p¼ø›\'´ÍØš-^\Z˜a™€§…rd=­–\\«(àláÉÏ\Z˜òôl\rM¼5`±šAøŽ×Øà):a¡úÅ\nj\"ò°‚˜ëlƒç1Ç²ì øÌa¹+sLœ<C,{xsX nÔJÒ4])òNŽÛ¼vâk‰þ+ÔÁ«Óà˜Ÿ¼?\núN¡ýUþøºbþý¶wVvË½·Iµ¿½¹ù§Þ½èó³à¸k]_˜7%?¯R±»M\'iŒà_ðÊÀƒ2s\'Y‹b×À„¦‰ÆÿsC.YbÀ‚‹ëÙk`H†pÊÈ‰óuGvœ(¤isº½Hí´€òx€3¢6“¶ñ…Fý¦ï|‘¶A„rÌÌqË0ŠÍ•YfŒÑzÞúË8yxâú×ã›Œô‡éTÁéx_³R4ågR/S)?£/àgK/r°ñ³ŸÉÏ¨\\·åïÿã:ïÍ','2020-12-11 12:22:39'),(16291,8634,'audit/log','xœíYûOÛHþ¿bU\nœ ñ®½~,Êé€†6$-	×»S¤Ä±âÃà4­øßov‡8¥(PéÚ¢<–}ÍÌ÷ÍìÌ:6ÃìKÂLV	x’Ø—<©ìÛkì‹Çhéy#a˜²J¦xQˆ’ÔŽSîVö=†á­Á›À‚Yeêyý[>êÏ¦2Mx(&ªû.ÃºbŠ‚©UST¬Á[®¶™Â¾ÜyŒÂ¦ªÂKß¿[ÄÄ¿í|DÇç\'\'è¨sr~Úî¢ã³Î)\Zf	‡ë”qGý£(ìÐeì:ãñ´TM£d¦ž›N0\Z«\\x>¯ÀŽ¨ßØqýöö¶>N¿~ÃC7Šë.¿Jc/ê ì	mêAär?©ŸC»6OÄrØÉ÷B.ÄSjíKÌ/²ÐI&1nI¡Û	sa¬âøv’ˆ6Q¦Ú	?€%7üŒ;QìÎ6N§¹Š°\nc•ý»˜–b\ZØ`’\"˜Ìë\0/^x‰^\"\'\nC.õ`(˜&×>GIÚˆ¹“ÅI4H\"Ç³ý;ÚwG¡ðù@Þ¿‚»ZÀ}±ïz7Ð¨Jð½E‰JôFzj‰8jž4z[þ®œ¬ø\'il{a:øîü,tÆü‚Ç<t¸;Hí‘Ï×–oÉHñÂ‹(laö qÆ<°çÓSÁð½	:è¢ØÙz×iµËV]ñé|÷L\Zb:G¶Ôc[~–˜çØ©íG—¨›—õwÎ+·×,muQ[í×k6™ÍØ‘[íˆ‰eHç–¬h2ë^³H@¹²Dâûñmó¬Y¾W¹ ÙÜg[j#7Í©+™±53ìž[®\nÏ®>X¼4¶Ùñ§šþÆ 6ËÔd.YÊeª:Aô[1‡ œÅ¡çd3DMÓ2­RjjÄ4%¤ê¤úúülg®—à‰§›¥iP?ž,´5¨Ž¸Ë?{—aŽªÔªžÄNý@´J@%`â\n¨P\ZU.yÚ!Ø•áû\\l”dÀUX÷~¿‡+ªe)zîªzW]±~å‹_ùâ©ù¢rëÒFqÊfQ©ªšþøY÷ŒJ\r›DSdTZK—!¢²Õî6Ïz¨Õîu–Ï8´=Œ£,åÃÝ<¯ Ÿ@Ó›ˆOû_û“øŽ9\0š¤ƒ€§ãHŽ;1·áV5ÜAœœ7»h[¦öºí^XÏ&À9¯î\"²‹ªØ 5lÖ”\Z†:Þwº=hV‰B”=Lö0F˜0B˜jUw¾Z¢ÏØåŸ ¨Oy)¿&ÅdÎ¯ºŽ_]\"¿³„&in\nÜJ¸Æº¾Ê5Œ\'öÍf9MÒœ_1¿‹!”®Úrâ…zEKTpÕ¹°¾Ö—Âú¹ þ½ µv‘—@q_+3&÷ßg4¦Xx`LU…j2C’¥Ë¬J/æªd³#Ž¬?\0TùöbîÊ²Ò:ŽœUlÁ±£Õ\Z›r_ÿkÿW7ð·«y*#ßç1¸º8‘Ž%vh)9¤I^Š\ZöpÚZñ{Î%÷…Ð~ŽÓ“Üüål\"´„+7éTxóC{4üÐž‚Àþ¤\"¬›šbÊTDèÒ³eáþ¹ß×„Ç—ÂlT|‰\Z\0¢Bf–*:i¶zh³¥¦¥<Zš¿ 9zÉ¡ôl™bÎQ5Ló%1—X0ŸÈT(ž?§àójÁà™ØÐUÓú	Ø döŒM]zXŒUXuþþõAo8ê6™	ˆ¼…}c;ø¯ÈôV^†ÇÖÉ»£pj×Úñ_­‡míï7ÙYËmeoÒN7ys}ýOo2šZgáñÄ8\Z´ëfPÅ¬ÉÜ÷ðý)Â“j/Hºiü<ªVžÚU­È£…ïi\\*°%›nËKæ°¡ ‘©Ô\"&Pð Š§ƒ\0Ší&T·TS+cêª¶)7UæÜï[›%W .‹ŸïþFKJS¦QÛ÷>?gùÀË€¸üÑ•ºôHÞ‚~à8<IP\Z!—²ËK#/vèq¹#­÷ÈvÝXÌƒ,©}\rõÆÍnsâ•Â4ØbqSÓçÞFæÞfÍˆûP@d>gî®ÎU®M©ÏYTQW~4Û,b\0®wwwÿS¤ÝÑ','2020-12-11 12:22:39'),(16292,8634,'audit/profiling','xœí[mSâHþî¯HQ[…^)ÌK&ÉÄòêÔÅ]¶voï®¨‚@FÉ-I0	ºì–ÿýz áXÁ—[«„˜yéé§û™éž-“šßCS3s®pý`˜ÛwLL1bT3öCS5s‘ãŠÜ¾m¢Æ„gØÐ©®s\nå†l†Ö•sû–ITó»cRxÒä‚\Z:1sÕ¾ðïJy{¤t|ÏÈñ=Sq‡áuÏìúatˆÎ ýfèw«×´ÛûvÛ³\\1.HÞÇƒƒ_ÁÎ	5sCÇiØíÆñ¤cÓy².…ac\ré:B˜ñ¢*Ó1‡Fˆ“Z&“\0€¢—N\rMÆÌ\\ñÆ\nŠ···ÅnäöŠ7Â³ý h‹/QàÜ\"ˆ${ƒPE×·E/,^Às¡ßíçÈzŽ\'¤|Æx‚ÑåÀ‹‡&Ëu)É³«^\"ÌÌuzVæ¦µ9²BqMnÄ¹èø=ê8\ZöãV€©iæöïî@Èáˆëìu—hö¬ØsmIì™ªs¼†ØcŒ0Õöã?SØnæjï«Ÿ•“‹ÓSå¸zzqV©)\'çÕ3¥%‡ßšufœÔu-Ï6ÍëH89\'ÓðZÂ‰˜d$œÚRpNüóQpj˜ªëˆ&Õy21i4‡îk¥ÓÒq}KŸ/Af‡0\n,Ç‹š’ý»©‚ÞÀõ¼Ä¥„×v3²Ú=1¿8Õ|+¶—ã]úkIµ›a§+\\k\\=’óÏd¡rXS‚ÎÖ‡j¹’Õê‹Ž{È%HVáJµc;þÌP¯cEVÏ¿R ó¬÷Õóû–Ûsš–kJE:âaåíœNF5vâ®vdÅ,¤MfF2z=§‘„r¦IŒïç÷¥óRv_Š\r#kƒûlÇ£‰;ML—Qck¤ØÄ¶Pœ—žÐxªlÅ9MÓ9_Çåiªd!ß°pÃÂ—bá’K¡Žu-#ƒr#f!N)\ZR:f¡òK:¢P;¶»u@VœÙ®®cxÁ¦CJ–†tI7…HQ]ÇÅ‚qšÅ˜N%sT›[Û‰š0uÃó\n•h„.DUƒj[Øâ›så%¨Æ£*†A§x(Ÿ2@%˜Î‚Š¡Â•ˆêrb«Å“âCp±ž‘zÎÂº÷ëV€aÌVÁu9wU)ÆkŠ+Á\\ó_¬§qÕßD7›èæ±ÑMŠró‚œt•g;Ju%%Q“…ÙØrCÊ×!å²K¥ÆÈâäç¤¥Š“µ’ 4-±´,Wj¥óºR®Ô«Ó‘‡²Ý\nüA$Z»IÝ„ð¾ü´þ¶¾Êï@\0 aÔtEÔõãòN ¬HØ­å÷ÃÓ‹RMÙŽÓÃ¢e»ŽWôÁè\"¿«]%uRÀF0¼@ðâcµV‡Ç<Aía²‡±‚‰IˆIy~çßaFæ_EÆœi`ƒ±û½k:ÏÀšöHâ÷ØÎ%	\\†±±¦Í\ZÊCëfµ>¶³„å…alVÜ/­	_kHaXX#Ô˜š«yNR`{–2‰?¡2é<cFa•LÈˆ~2fŸË-&#ƒYé>ÞqCÆ×\"#\'$ÎÎÉÔõÊï$åÉŠi\0#é9ÀÐï%8ž¹$·vfàßög·°q¯BâîŸ’ñ?ÂÛuüãC†È1\nü^OàírV:¾‘¡‡ÊIFÔD’ý0¹…v4,Ï¸>Ç’Rh#ÁéQžþ|:–až¨t&ú¡>*~¨OJ`ãÀ±!Öct‡ƒ¨+0`¹˜›X6Ø0àUÀubÄ›dêî‡Žî¸~A:}F¥òKæ¥@Œ8¾Ê+§å³r]Yñ‡1Nß¹yFëhKó“ÅKc3\n	x²QNôç5Ã’s•†¸±ðäg\rÌ ñälLÝ\ZÐGšA¸–ÓÛà7¿ÐñÝ§b…¦ö?`SirÍ¢—1Ç²ì`:ú?˜Cg°\0KsL<c\n­.>¾=¬Wj%0MDÞB¿Í®vý7dø£7gÞ	?ýpì\r­B%ø£üé¨¢þùnp^¶ËƒwQµ¾»¾þ«Þoù¹wÒ×»mõºäæeêgìvÓŠZø\\xTfq’¾ø(v\rÉ´$ñ£ô?nÈ%·X0Òñâýì50¤AhÂÈ©óuŽ\'vœÚH‹Íi‚øh§u€¤Ç#ÂIj`›ä_š®õlC˜Æ©¡¦-chT]™e:£tM—Ýÿ22NžyÿëéŽMXFúcÄ©‚Õs¾=åNÑ?Ó‰¼L%ýL{?[zà˜£ŸýL~¦Á¼\r/îþáôX','2020-12-11 12:22:39'),(16293,8635,'audit/request','xœåXûÚFþW,¤H¹ðcctª|Æ<t€©1É¥Me­íÜÛ±ÍItÿ{g×^w4µR+õ‡vwvß|3³ÒEEÿ’ëª^[nP¾Æy­‹tAÿò”ë¢ ×ò»ÜLB\\ëFº$]ØoéµÜá¼bâŒÞ%¢ŽÖI^Ô@LiB(ˆ’ç<	\"´Áys“hCDˆ…]Ž³Zá¸(w@Ã$ùm6ˆWš÷úN»Ü8Šw{n¯µ½vëŠ3Òtƒßaÿ6*xEV›r›{};t\'ã:·‰î17ÀÁ}rÅ™ë,Ùb^S›B³%iBSÓ¸9Z¢,ªnƒm½†‚\0§¥uYÑkÞüºØnêìD*À}~Ov~Ú?ßÝnº¯…f§m!=DËêë#öS¶›Æ«úþ\rÕÎäÑ*Æaïƒ5ŠW¸ûpíË¥FêÂ¼kà8HÂ(^•nêµÕç(­s!†¬ø™ìTíÀ0ÍÈöÖ¼ŽóÊU—Ž0U\nÖ¸$q‘%4-½¶E{’”k¡Â(H’û¨T(Âr6œÍ­ù|Ô»F¾(‡¢,Ií–Üö}¹Õ$ûÒÒu„.çy¶¼V/‡`ICi)ú-$†Zk)´ä¥\n¾ŒjKþRZv|9ðQ(¨Â#MÕÚ\nêµ\0½’\r	þ½Ro\"ø^É79|*dK’¨\rø„]r*V§²TËE7{»¿P’Ñ´•8ÁÛ¿jAg«©ýÛ6*o¾R{$@•°{‰3œ‘•ËuQ¤:Ï…Ì<a1Âmó»4„”ü…×Åò²KWJ#Šsì2Ü¨Ê\'§)Ðk\"ý\\÷e’=¢,N¤IVÖ‘^Óh\ZDí\\\0L>”NBíÕ¥ƒE‰‚¨†U÷`m\ZQÊjMT¥¦¨A9€Á§’2Sš€[\'•LQy×˜%\0DØ¸ùÄT@æ¡.Û ¦ÂÊÚ§Q†i$Øt×»:\'v¸iò\0šÈ	š®Hº pƒ‰ËgRÆ™GÆµÁZœ4ò\"Épƒo”“un»Ëâm\"jK¡¹4à(¸¿`PV‹Š§³­¶ˆ,4ª‘êaƒÐg\Zî§´¤rë¤Ú»”`–ãâzáö\Zˆà“ìªúRË^u–åC!ÅÌèâû\"‹vÛDüCUW\0÷ƒA®š‡\r]//.¨®×WÌÏrw†2´-[«þ%Ò…’*u¬@ÇÄi£UÂÀ-.Ö	M>`<°ÜÊ»(7þ@ûZ×§:èÆìdC%}ÒüÙ!Z”Ï)UÁÛWá‘SBñÐÿo’ðÓq`€ê¹å¼µ²Õ’)\0BÇêËt½¹k¸‹yåÌ’Š¦C×yC{î~ïÔPª;°ækêþ+£ƒà@ý0LÓš¹ÿÅ\"	g.zÖÔ´{£éà/§Èócc:X\0Äß3J´êªi˜CË3í©ëØãKóä\0œiÛ·#ë1UH]Ó˜«o9¤DþÙ\"³l-fÇèYÞh:·Ì…c•_ÖÜŸ˜Cnï¼¾í¼3œžÕ#ß.M’‘Ò?P¥ïÏlÇ=›i’tIÊ±]›œ¶J|ù^²nsy’wjuÅ±Œ±7š]ŽÄf†;¤Câ¼3¾D>÷£X?Y–Çú¥\\Òÿ²$)øflaRAÚp&TŠøÒgo>\ZL¡:”ýàklìØî»$=•!t#%ƒŒ—š­¦­‡ýÅWÜù4&uUÝŸ\Zë{Ûéñ–Ñë½dƒòLèEÉ™cMl×º¬ ÍºMÏ6èÖžcÛ.›©üÊøÇÇGÚ1IÓc©«(ìÍ¡›”ÁœÐcÝ¹@«?º;Á‘Pþ€Mé‡ÉhÊzÚoqÂ¡0snAB?äÊtFÐ#û£±uŠ÷í|‡xßL×é3¸” «ÕjK\Zsþ01ç=ÌM§êÙ5«}âîAnáŒ™»/Û‹z`¸Ö;ã=4	×rú†iU/8s0âÅ²NH‹Ð,xÕÙR\'Ù™XîÐî¿9ˆk_ó\\<^_8#VÝ_és”}%ØhÂ°s\\5:@ \'Œû—:Ì®;šX^làpu)¨ª ˆJ§)JÚÜ£(ùñ{*ÃAÙêáìuvñ‰ôY3p¨8­(¬¾èH¢Íõä1ÅÆ#ÒéoëÎÉ„¤€“§â7eÅ.:ÉÊ2XþöÔ$þ”1u“@KŸ¾5!^öº&¥3?Æ¬öAxö”¾ «?LxÞ²|þ0!’Í»,^d›CUŸˆ&¾âç¬#]ª:pù¼ÎáwE¿\\‚â›|zú(Ÿ','2020-12-11 12:22:39'),(16294,8635,'audit/db','xœíY[SâH~÷W¤xA·ú’î¤C¹UŽƒ;n)ì\nî¼P‘´š•$nt˜)ÿûžî€å^j(¬\"´};}¾s¾Î×ë`çGâØN)Iâ^É¤TsÌ¾Ã ¤¨–8D8¥Ö—æWãèüäÄ8lžœŸ6ZÆÑYóÔè\r÷J5ßÁð±<ˆ\ZÒÈ÷;ÞEç0\n7ôç¿¡ŒGª\'­y`YB˜‰\n|lfC½©¬g6]‡©¥™NéÒÈÌÈ˜SªÞ¹qõþþ¾zƒê½(®zò&ýaP{dO-§\ZDž$Õs(Wn¯oÕp˜ià‡R™gLÔ´×—Ã°ŸúQ¨Ú-e)ôšafÌ)õn’¨2¡®|ry\0Cîä™ìG±7ž8ÝêQÄ)9N©öð àóµL³ÿò¥Ð|49¢&ë\'Ç4œvN&`úVý¤~ØÞ2àï¦?¬ô£0Ic×Ónèr7×0áLe,/e,Ã¾ôº©{1‹›sÃ·tÀüð2ŠW¹ÝMú×2p\'ÝSßtŸÖ‘-#îoýÙ<nº‘£ÉìCEEÕŒÍ†^Ç¶~¸×wSw]û0yQ}óìqäö‚¡Ç-£¡2ñ ñyÁ$ã;zªÕ±éÌ“¹•Œ«RPÎ\rÑø~ýR?«Ïµox°²HŸm½\Z=iº‚[cÇžbÍe•Ùå™ÁSm«íi	d®%-Î0Q,nXø^,\\ò]ˆ1x-Y(LÌ1ÎÓÒ	ßò’ÂÈâØó½Þ>Yqg#BÐ5„”Ù¤!%KCºdšRBÖòeÁl‹!-Ù°9…)_,Ý¡ç§]ØºãÑŠç\nÎ¹°Ÿ‡Õ\\\0ë…ôäwÿ*Ì`ÕËª&q¿z J¨LçQÅÐáJ¦mµ³µô®8‹.¶r.…¡|:ëÞïO¸ÂÁBpSdüg«\0»d¾ZYk‰«‰-Ù\ZW++È¹¼ÙÈ›—Ê›å©œ|—·;ËQ°¦´ä°çhZÚZnhù1´\\öe	Z}MY)xö²$(ÏJÌÁþq£U?kÇvsZzÛ½8\Z¦²·›	é.h(ú·êéþë~Sß±<“´Èô:ÒíýXº©ôz;Æ?\'çõ–±­ˆU×ü°:¼…˜Ëò®Av2¶HÛTÁP âzJe‚ÚÃdc‡‡ŠòÎüžKçƒ+¿É>,¹(¼±¨=Ùué¢ørþÂøŽ¼s]áVkØçc\rí‰{·š†×aV°¼“#ŒÍûvâÇåå=¡ªce¬£u2C\'Cý\"oI@Jp¡3Yþ¾¢3ùƒÆŒØéÓ+Á¿<Ÿ6Úr‘ao¸¸áâs‘R4~/Ò©Ã9{þ&©LV<XK<Ç†~þ.éÈ½Âk$P\0óðBnGóWHØ~t!K÷¿³õ¿ Û-üóKÙ˜ÆÑ` cÈvµ)>Vøa\nR ™Hv¦®Ð>ŽçRŸ\0‚Ëe´“áô¢L;Ÿ+ˆÈ\\:U	=ë‰gýÉìÌ|F‚æ”d0W`Àr‚ÛâÔ¢lð‘°mdfrlêQ@Ïó¿>´ë3B¬Uo=oë‹Þ>ª Æ‡I8¶mÊLP]¢xÔ\r@•íc“Rbš(O›S¶êiF ŠèDA‘÷UPvÁÉõÔë»YƒlmîÀÿþšZc*ÑL$Í~a!öG$Ú²R]n¢M¢ýJ‰&0åPñð?A[Ý','2020-12-11 12:22:39'),(16295,8635,'audit/log','xœíY[SÛ8~çWhòØØ’ïÊ°3¦[vhÒ%¡}ÉL¢Ø\"xñ…Z64íðß÷Èv‚“8LÊÎ¶S†!éœó«F1ý&¨M!‚Í¸h´Å„~ó©\n#³Š\rÚ\0‰GH¤,I¹×hûÃG‡‚icîû£{>•¤”Æ·<’„ZÛ£ØT-KU±á´°a3ßË¨J¿=øÔ€ÿlMÓU[m?Èƒ+Ì‰Ìßõ?¡·—ççè´~ù¾7@o/úïÑ$<™lÅ›ŽNã0d‘GéçŒ\'óZQl~KaðBsCâ¢ÓÆ•ði\0\0ÊK”ûû{å:\råŽG^œ(¿I?`HŽ¤8J{<Ê%Œ[·×·r;œø—ü\rÃiç_e‘›JrÝ’œ\"¯ÌhÃ\r˜rL´¥.\'Lðl¹ãÜ¯<8ßæ»mPÚh?”h:ªML=G“TÑ´€®fñ£zs‚Ü8Šx.Eá\\|èu,Òã„»Y\"â±ˆ]ŸcoÚö¦ùb¡˜ß\0^«\0¿<w»8*¶FäÕ´m‰¼UEÞpduÏ»§Ã=?7nÖøEš0?JÇÞÃÊB…ÑÚdÂ¯xÂ#—{ã”M¾}¹²}/?ºŠ“IµÇÂ½æ![§ÒÀrÔ ÄÝû³Ö«ÛuÃç‹Ó3™2$90Gý^.Ç~þ¬QÏe)â:†ÃëæûËû[¶ž\rPO¦€NïÍ–CJŠƒü¨IX‡t¡É†$åô–MÊ-9¾ŸÞu/ºõg#$›‚ûìçÒä‡¦«¡Ø+{´-,7¥g7×6¯¬í”þLÕ6ÌŸ0±¥é ˜¬%+•LÓ1ˆ~«ÖTXqâ{“c²¢ÄÑüBjXN™Ö°¶©¹½>³ÌóÓ1$™d¾[™6Mó~ªouÊ=þÕŸE¨¹PŠH\\¥#G5˜ÐpS3žeòè]Ç[5õoÕ£ßQÅªæèz	«Y…ÕT_åâW¹xi¹¨DÜ¶ªQ%Ù-(-Ý°ŸNu?bTêX3-’G¥³r2ÿYoÐ½¢³Þ°¿šâÐþ$‰³”O‹²2†rCÿV>Ùßì‹ü›p\0T¤ã§×q¾î&œÁ•jr€>vÎ/»´ŸWv…y¡)Ù-Øœ79DMl‘¶[jÃ„\nt‡0j•¨G˜aŒàþFÕœæÁ¿öç¥qùèèS^g^‹˜Îâf¤m³®i¾Ðºe5ËÜ•¨ÕX\ZÒý¦¥a]°»Ý\nZnäâ~ùŸ(b›z\0Ÿd)^U\ruÁl$™rf£‚Ñè‘ÑV½Èk†ŸFp­2…÷~Geª]ÆÑ5’×G²r‘ÕŒ§;¹&Ù-ÁY&~Êÿ\rõùÜ[hÉj{8È7›Ð‚_Ç›ý¶—ò®þW!ü<ÝÂÏŠTšÄAÀðt™ŽN—5zè©ÉÐ¤hFeÿz2?Ûp{.8$ÓQÓ‹¼üõt\"FmœB¥÷Ò™×õÑñº>†£5†OÔ!YbmSÏµ6ªÞï€×åB 4FŸf³O/`ùÜC^ÆåÊÙÄ</‘tð\0™rZhxÍQYˆä› \n±,2æ\"zÈ\"zœÒû$Ã¨ŸœR(»îM!M]ÙŽm.Þómq¤m¦_Ÿß%`s¨¨B	¡Qª±ŽUùÛŸÄÞ|#xÈãKÊpüÿ$l În)‹8XQ¢´ìGÏö$hhˆfž´rÏp€òòÃ›Î°»ÖËºC4ñ²$ïç\'ÇjK…«¦i«º‰m[3th\\BÆÉ|BcsŒuM#º®Vó¯mjÆŽMˆ£KÊy^§	±kÚÍWnB¾_¯lÔdb;ÏZ,ð¿~Ïr½êfª#ëuîfÎš°bÛËÎ÷ñ\nˆ!lØòŠ‡‡\0Aœ¯','2020-12-11 12:22:39'),(16296,8635,'audit/profiling','xœíZ]oÚH}Ï¯°x!Y%0ßöe¥4¥Û¬RØ\rdû‚Ž=I¼Åvj›¤´Êß;6$Ì¦¦Q‘\0g¾î½gî™93àØÔþ–ØÂ®*ˆâq¥áÛ˜	ËÄŒ5›Ù•ÔT¥áÙ¨†ãY¦Ød†¡…¥{&‰s¥’JÃ±±eóm\nOB? ha»Ò¾Q¡^oßn†ÊMý(´`œ|Ú×Q’ÆÊÅIÔO\"×w†}ï¢á]„N ¦yyæ¼,o\'Ô®Œ}¿ç]ôŽ¶#°§ÛRpdša.kðBœC9Ó®æ:6×@¤—þ\"MlÎíJýÖ‰ëwwwõë4ÖoUèEqÝSŸÒØu°HF‰ŠëAä©aR?‡çÚÍõM%Çlè‡J›ç\\æ]ŽÂÌ3]ojK¡×scvÅ:IR™\ræ“¨#èr«Î”ÅÞdàt|“õHm»Ò¸¿`G\"Iaû<²…^ŠU¡·Çˆ=†”’¤‘ý[ÀžH»Òyßþh¼;?=5ŽÛ§çZãÝYûƒ1Ðîs\0\r\'ôlûóHå¤,“[‰&5Y–Éb%4Óó9h\nD‘›\'…À28­\"œ\\Âðæió¸»cÀß\'wTƒÕ!IcÇÓ¾fÿ~¡b8\nÂ¹ÂX]ªX…®òú©s1TË«Ýw²	óÃË(v?q¯UàL›§zýyô#1Ž:FìîüÙ>i•õú¤ÆÓÑGzÒÍÁ¸Ñne~ìfï%á¹Nê£+ã/+oŸ=ôÜ]Òõ¤c´t&µÞ.dÒb/jO7,C:dÁ“Iñ’N\ZÊ….¾ß7Ïšåc\Zxvé³›y“\ršO]I‹I`sÕUÙÕ¹Î3uë­iIÄ6’…¦à8Û\"ä–…[þ,®¸b,äF\n5S2,41.ÒÒ)ßŠ’ÂÈçqà{ƒC²æÊF¤¤)·0&(ƒ”¬éŠiJ	ÙÈÍ‚[&G™dÃ3‡9*–K`gäùi–îx¼æ¹B!­§aeK`½Pžúê_…9¬™[õ$vëGú©U‚é\"ª\Z\\©´«W¶N¶*Î£‹Í’³ç\"®¿?â\n)˜ÌùÏ×vÅ|5	27W†M†¬W³ˆ+È¹­¼ÙÊ›çÊ›å–©œb“5—;“(ØPZ\nXs2ZZ[Zniù:´\\u³­¾¡¬”\"ß,	*²°Òê4ÏºÆI«Ûž•Æî ŽF©\ZìçBº\Zýýîüë|ÑŸ±<“´¨ô:ÊêÝX9©ò{Æ?G§çÍŽ±›ëŽøa}ts®ªûÙ7ªØ$5lÕP\rC‚‚?š]xªDÐ&˜Ø„ØTV÷þÿk˜Éäª/Ê—Ë¦×$&µ¦«.]6¿B<s~\'>›æ¦Æ­d®aQ\\œk¨OœÛõ4|6Í\Z–Ÿç‹q€øÁ½b$Ruj¬§õ2c½ÜPïÑÐÒ¸ÈK\\\ZLž¿?0˜âAcN,„²Ó+Á¿<Ë¿—û.rÌð–‹[.¾2)E“}qæ×”?}“T%kžL‰)Ÿâ\0Gß—ôÎ½Òk$P\0‹ðBnG‹WHØz!O÷¿sÿŸ‘í&þ~—A6¦q4ª²]/JÇ%q0IJ4ÉïÃôÚ›ñÉBê@pj¹§örœž•é/á%s#ó>è„ž‡áùx\n{sŸP† y%%9Ø\ZXMp›‚štK€-^“\0–…X.Çfî%´<ÿëíQ·9\'Ä:Í®1ðFqv108D5ýKƒlY”3P]ù¯Úú¨²CÌ(%Œ¡\"q,Aùº§‰(¢SE~®‚²JN®/¬ ~Ü±›—0ÈÊ²Íú_¤Ö˜I4†$§ù7,ÄzD[UªK\"Ú&Ú¯”hS÷ÿ¥8âN','2020-12-11 12:22:39'),(16297,8636,'audit/request','xœÅWms¢Hþ~¿‚òÓf+øŠXûET1/u¹²F•,2,`4ÙÊ¿žñ%qowë®ê¾XÐÓÝÓýôÓÝˆ4¥®}Oµ¦VZ„(]á´ÔFš¬}M5EÖJi†²Mj—ÚV‘å6ÈkZ)Áß68Íúù8a6 ?p´\"iVµ\nøŒPB^@\"œŠ)ñâ´…T…Þ°Iq\"¢%Ž²\\†ä%C$ÕË²ðáNQÚÂ ˆ6;a§6fÚ… Çqˆoñü:È¤zµY®6„×}w8¸Âà+zØûJ.c•5–ÔfY.×*ª\\VUa‚(	\n«R‘ŒG¢îC-³‹]+Õ«ô¡¡•çá˜WÕJ¥ÌªÎå\"Ž<âÑ’‰AcùÄ—‚Î¿Ñ\rQ´Ü@®ì\nÐPÌÉ%NÛß>ÉåÖ%ŽØƒÊ]¡M¶\"Ið‚2\0	+ígŒœøùJÆwz`W×7Ê—``\\­æ=¾[ÓKW­2()^õfå­Ã\'ë‘÷·N†nkTYA·_û±Û*\'®•]ú´²»ßÝ*_£³‹¸Q\\W:½ÆXÿÖìöŒ´V½©§<2y+,RÜÂ*©j¥ˆˆLœz@5{ŽsÅ*x,é1Í“1$¹ØK]CV7ïÀ<MM’«ùãr,Â zœûË%^y¾ïÍ#øõÉšÄ<®¸·F‘˜‘¯˜ù«‚wµ6W·hŠuÜ\\ˆs¯ZÕ†Rk²_‘½êB^Èp\'.H²E‰}1&IVA•™‚zª\0Ì}Â	ÏW®·°RGŠ¬4}*kQå£PbNv¥Y)+*ðQ)µ_sj@‡Ä$JñQ+±N¢.ïÄ1Ùâ®úüÌ]ŒûchŒ¸áM¦¹ÒT4òjˆz’­hÿVZï¼›;À‹ûhS%Q”Ü-J^UÞ—¼-x+”¤8û4u»¢Êp 0MÑ.MjH›tJ¤y°VäÐ™ç‡5ñ70RÀâ¡ cq=Lskc/Ò´Üx@Ý}¸àçÂ1JÐúhòA0pB§ÒØ€„Û×Ú‘•ºplOÜ\"ª ÕÑ®Ôžk2ŒM*èÒáÊ%”GA:ÁÞ&Áa„‹´è)e…²Ÿ¯Ÿ‰ÿLC¨rFîOš\nzÁA[V~xüþ‡ °A¡5.…¿L/©4Fiº%‰?[Ñ\0!ï8—J«ôÇ+/FÃ€Ã¾á€S…¤j§mVÅÜ1oÆ×9Ü}ûõ•A51Óa¤Ïs\'ŽÙ±ÓpgWw§“\"Ø=EWõ]w<ëøÿÊ–©6S¸m¦÷Ì‘û¿­\ZÃ¹pÿl`ŽznÿdÕÐ²³0uÃ0ÇîéÂ©È\'‡3sdØkÔûáÖyk0ÐG½)äþ+«G-L\rÝè›3\Z²c~0åyBîýØü\'Bî³³«gþí¬ç!Ò6ê£™k_›£ßø{Œîf]Û¹ÕŽÙ¡Oç¦5h+g´ƒ†gíÇ¶ãžì˜Jåœ–c»v1xVYó\"¾Säít~#Q&Ž©fÖø|¦t¼é9;UÈFq\"±4¤t@‰ïû×Ã{È_ÙOBH&•=²¦{#‘žpä¦ÅÙ’Ç<›X½´»cï”úáØîº$;­BêzLY(UÊµ²­ÛÁó\0EÂév¤¤+ìGúÐüÕyq°Ò;÷l¨¿QzWCzæ˜CÛ5Ï;hð®íØÆtH»Ç±m—Ï[é	%Òv»•VÙ:”¶xÎKç˜_¦æÆ\"težÌöÃåÎº˜]ëîGJ=~øwVŽpæ=KïÏˆÈ÷ÄTXPÐ¿öµ2fM×‚ñv„÷;ïRùxWŽWñ¸8”à«VkÔdÆ~%LC:û•@³éé®y«ßÏ,ÈØéê†Y,£gIJNñ#f±æ2öŽ6È^ëõ¡éöíÎ›íOcƒcçv•SŒcÎ]å`;u¬ŸD­ìÁãÀQÆœâ¤²?èñA÷¼õÏ¯t­¡9ëlâô¡ÏäfS–)k­ÚÔƒ*ýwwPÊ“DÉòéðM”<ªÈ¾R€¾=Ó=9ÏQá‚åœ}m™€N¹19ùÒš˜“‰e¸ìõoÔnf','2020-12-11 12:22:52'),(16298,8636,'audit/db','xœíY[Oã8~çWD})¬ ñ%qœT]©Ãt4¬˜v–¶;/•\ZÓÈ’“Ðñß×vÚÒ¡©F´´(H¤ŽíãsûÎÉ±ÍèüLêÔBž¦ì’§µ&s áüôC´ˆl€fê`âÔúŸ{ß´OÃÓSí¸w:üÒíkŸÎz_4—åžŸy”%S·Öô(þ)$tjSßyç£ã8Yä9Î÷œ\'S97=`Y\0@5LDeÛÍ‚7,x3Ç”\"\ZNíÂxM,iŠ¶~ËýîîN¿ÊÂ@¿å‘\'ú9÷øÿ2ÒCt¤ÄÒÓd¢·e«qsu#©qàG\\²G7•òy4Éü8’ãBùÚ%Ïì<àýÉ™âéÔ&KS5ÃZR)Šø‚TPfÓ%#rjGÖš¾c\nN62	 ´©^·0«M63«Eèû4«eÑÂ¬Ö²Y	°…];§ãÁž&þ®\'ycGi–0?ÊÆùáÒ@‡Ñ“Î„_ð„Gî3)òúá%ò=å8?ºˆ“IéÇ©Òt>=óY0~”#ÕÚ}-™ìýÕ;é–Q]óé|õ\\Æ¦œ.˜k½®’c_=KÔ›°Œñ¥Ö‹—õ÷Î”ûkHOúZW\"²Ýý¸f‘ÙŒµÔœXféB“IfÝkˆ¤)WH”}¿}îœuÊ×jižìœ¥|_I£-\\W2co¦Ø£oÅp})âêOÖ(›²e®³¶á{JŒÛF2(i”UP¾MPnø¥´LÞå—‹Ê\nª „`9*…ÚNí¤Ûïœ\r´“î ÷kÝ¡í»IœgÜ=ÔÜ<åÉØ÷dÓ¿‘Oö/»—¿	öL³qÈ³«XOÎ2î¹Ú?íÓa§¯í×Ù¯çiÎ?ÖTý¨~¨°z¨Õ¥å!m€}@t|íõ¢YG\0#ˆŽ Ô rrLT?XÍºxÕÁüžO„Øe.ÆBtžwñ:òL‡±Çƒ´ðtGÚ®ÄÝUw‹ñ”Ýò§>^ÒêƒˆŽ¶˜ËÏø$N¼5ž–fy%ELsUÁ\'Yˆ·¬	h3If#ÅlT0\Z=2Z«ÚebK•)0ü‚Ê8Îc8B\0&ÈP^ƒï\"î3ã‘`jWñXÅã[Ç#%¸ø>âåx4ÌyÑªý1Û˜ËÀsµ¢ìQ/²q[uæ…\"Œ¶Û`\n´\r&Xcl_g‰Ÿ‡…±¥lú\'?òxR†~X‚~ò8Z±2¤\nàÿ]ÈÿÜ¿ŒÈ†QR/ÉwA1¤¦Ã™?VâWðŸ³\ZI.£‚Ëó@n?UBà,xªËt*êß,‰ƒ€\'©>,Rëñ¢«DRRü!³L™^Ò	™l©ÓëÈ¶E”§ŒÁúfÅ6¦\nêÔw\nu› <E–¡Žìõ¯\nóÛ¦qbTi¼ÂöN±\r“Î¶ÖFØÞ0mÛ€VÐ® ½Sh[Ä6‹jÜ^†¶i›Õru†üÜ3d‰¼u‡ÇjlË¯½-ã·GUJ¬RâV)ÑBE%‹@•«”øZ)qÓ\"‘@£ª«”¸Ó”H1j„ÐrJ´ÅÌá×íAçÉíI¿3Ð\\/OTêq[ (…&´1´ç¡æ†<Œ“é8d÷nBŠ ±ÉüüË÷Ü%˜l{I)µç_èuo<h‰¯v|ãñr·å&Z¾\Zø?^ònàWœŠQ±ÑFø-p¶éÕš\r&°Úÿh0‰èxøÌÏ¦','2020-12-11 12:22:52'),(16299,8636,'audit/log','xœíXÝoâ8ï_añB{jIì/#Nb»¬¶§.ì¸}A“¸Ô×|tí¤»ìªÿû i	wªÚîÃ©HcÏx¾~3Î˜QL*êÑFÌ•bK®\ZF}úSPN9PÔrhcôqø}˜œŸ£ÓáùäÓ`„>\\?¡9ËC‘Íx’ÉÕ¼ÑÃ·\r_|ÓÆJˆi¸˜ž¦qÌ’Ò¯9—+MhuBŠÓuM»¤eÛ´Ü’›i½Jl­`›6.EÄ°¥\rcã–IãÛ·oÆUGÆ-OÂT\Zòb™ œZJFOZ7W7š˜#‘p-ž`«S˜~™\'A&ÒD¯c XòlÌW<f…LÚ\"¦TAáVLJ¾eÎluSèHhãä÷FçîNP$ùØ¶1ñ:wÚ9¯º@7¼á‰H–èý;l·£(^©¯½JUÖ•<È¥Jg*\r‹fá¢.óÍB9¿ãy«FMJS·Ç÷îÿÔ÷ŽE\\¢}ïT}ï˜>@ºÞ? ø\\y 2ÉD’Í´ƒ+Q\'&%¿ä’\'g™Vyÿr…ý È‘\\¦2fZû™*,Ýg:Ä÷z(Ô!ü1<Ôq]óÕf÷\\§¯&áh8(ô8,ž5æ,cQºD]Ø¼n~x±å<ÜÃz6B]zƒ÷{6YS[iÂ:O—–ìh²žÞÃ¤]¹ÃRø÷ËÇþE¿~¯.\nA³Sü°Ð¦Ø´]\rÅÁÚ°ûØÂr³Rìšö¨#y^=t‰iÿSÒ\"Äl›:%ýjJb]Ï£þÅ\rÆÃ‡G:œË4ÏøüÍsÅåL„z(nô“ýÍ¾ë_ÉÁ›*›Å<»J‹õ@r–ñp~„þêOú#tØd7ÂÈUÎ¤H\rÀ©HšÇPQSû{-³…aÎ„‰ÏÃÑ†Mbó“Œ&”j“æÑ¿ÖÜutùw¨Ò¯‹¯ÕÆžï¯lí°ã<1Àq\ZòH•qîk×Õ;În°a]±[þ8Â«ÞAfô€þ–_ð •áž8—ÇÜ/1Ä¶wí\09r«^Õ°º6ÕÂ¦…°i)hz/h¯]ä53Ð\"¸Ö˜Â/h¥÷ÉˆM>vq@bRMÇ¶½9 ÑoëW=wsT–Øâ®yón“…1dÑ³Šå™.Áÿ•¶¹Ç×!¿Î¤ÈãÒ×Z5ãƒHB.ëÀkÀ O“\'cokB‰û?KýŸ\0û—Q¹Ý®)Îú?pL€õÝj²ÇNú‚ü¨©–2-¥<\rãþc#\0fyÄ•¡‹)µ™L£ˆKeLÊÂzºª±Æ©9iˆ]gÌPöc&¢gÚ´:&Žc›í\"RvêÄßßÞ˜&´í9þ†ì7d¿²á]Âr\"R^Ù¶o¿µ9omÎSÛ¼}ýM±ö¼‚è[í·‚øV_µ ºØ-ßjÉƒ;7(\'Ÿß÷ÆýGíå¨?Fó0—Eá™wÍ–éyØÆ¾…]‡8¾\r½dÌãT®f1ôš]Œ=‚ßÙ¼\rC7ÚõËyfOèyÞö\ZŽüÚ–Ð«	Õ+·„/wya“]åËœa‘øñ’ÍÓC˜9ži­aÖ~\03È¢^p¥P–¢/òå’K$ŒÁCæ\\¯œ}F,¥¦ƒ ¼Ð¾…ÆW­/3ôíp…¶ØÞRlÑF6hó×Ñ§ŸŠÄ¥ª~p]jS‡9ÛÄÝÜC˜ôçÖ8Ìóá¥âîî.Ç','2020-12-11 12:22:52'),(16300,8636,'audit/profiling','xœíZ[O9~çWŒòXAâËŒÇv”•(MUV4é’dû)1³4­øïk{d²]hµh€‰oçœï|çÌ±Á1ÿžrÂk¡ãdVkù\"è@Q+å6¯e~(k-ƒ`ØEƒÌEØÀµõªg¦©¸i­%8$ü»Ï‘z2@p¯õ®däGÖÛ7Ö4Ž\"9Íü8âV8K¿ü2N³v\"§y’Æã4žú\"{g-ï,¡\\tíF=õKAKKI9Â¼6óý‘w6:º_˜ÇJž‹•â\0×\0º¨á ¥7`ªÃÖº\Z\nîh”©ç~ LM¹£ž›×\"iÞÜÜ4/³0h^ËÈ‹“æ™ôä7ÿ\"j*‘è@äžŸ5ÓdÚ<ÔO«Ë«ZYàGR‹Gç‘ÑL÷C5àBfqÈþôR†ÂÈäµi ÒÔŒpKŒš/Í®ŒŽ\nÔƒßk­Û[Ÿ;JƒÄ!”¶nµÍ/>#‚O_%øÈqµ5øö2øX…Uÿ}ï“õnxrbõN†º}ëÝiïƒ51úe”%³É*«á’a(\"ó/¹,Â³V—½RX	(8ílë=_Ÿ«Kèë„Õui«»+LáÚ9é\rv,õóyš7T¾H³DøQ6Öù`©#ÈÃèQc\"Ïe\"£©ôÆ™Vy}÷Òôã8?:“PhíÇ©±t1<Óé^Ô:ì[ÉtçÞq·lÖg9[¬žë·’®„[½®Ñc×ü-1o*2ÄV[-^ÖÞ;½›¹»fêqßêjFvß®Yd>bÏ,µ§–!]X²¢É¼yÍ$\råÊƒï§÷ÓNùZmËSš‰Tî\ZmÌ¢…ëJFìÌ\r»÷­ê®/E\\ýÑ\ZeC¶Ìuªô`ð5%F6cH%­‚²\nÊ_”¾)]½Î¢\Z«Ê\nš „`9*¡.«»ýÎéÀ:îzëkw’Äy&\'ûÖ$Oe2ö=ýè_é¿âoñUÿO¤Â3ÍÆ¡Ì.cÓ?M¤È¤7Ù³þ:<vúÖn]\\ùÍ<ÍEâÇMEU?ªï®î[u<¤\rÐ€ª\r¨†½þ@=Ö@à\0¢-ˆ8BÜAõ½ß7Í,¿ªj?“e.Æ6Bt‘wñ:òD‡±\'ƒ´ðtGcWânHÈª»U*®åc/YõFEÇ¡\Z-Oå4N¼5žÖ°ü$CgÕ%\'¹SoÙ¬Øº6ÒÂFFØ¨4º´Ö.ô’1ˆ,5¦àð3\ZÃù}8BµwÇji¼_E<–o¥ÿC<LYU<þêx¤ïÇ§N¶³(Z­ßæsx«({Ì]‡LÚuá…*Œ¶Û`\nd?Š¬Û“Ÿ³ÄÏÃl­[óy2)c?,a¿by­ é	ñÿ,ôïŸGeÛ.©—ôg5c¨¦¾™\rçþX‰_%!j¤¥Œ\n)O#9{l„âYÈ´©Ó©ª³$™¤Ía‘ZîšJ¬!%ÅrÊŒé%PøÁ–6Ýq¹€¹ÄxÊ~®oVlcŠ©¨^QýE©Î(\0ÆSd™êˆ­?x5œß6»Jã·_”ÛØvè|ánÄí\rÓ6´¢vEí¥¶K˜STãl™Úsª3äêù©gÈšyëMß–o{†]û‡GUJ¬RâV)ÑEE%‹@•«”ø³Râ¦E\"vU%V)ñES\"Å˜\rzð5M¦F?¾=tÝžô;kâå‰I=“6h\0J¡†.AªâÜ·&ÅwGÇ¡ø:iCH$Œ,Î¿|oÒ¦“m¯ )¥lqð…~î-ñÕßx<ßm¹ƒV•/‚Fþ·ç¼xÈ3B1*6Úÿ\nžmzµÆ ÂVDûÍQ\r·ÿ\0Ñ_†','2020-12-11 12:22:52');
/*!40000 ALTER TABLE `audit_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_entry`
--

DROP TABLE IF EXISTS `audit_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `user_id` int(11) DEFAULT 0,
  `duration` float DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `request_method` varchar(16) DEFAULT NULL,
  `ajax` int(1) NOT NULL DEFAULT 0,
  `route` varchar(255) DEFAULT NULL,
  `memory_max` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_route` (`route`)
) ENGINE=InnoDB AUTO_INCREMENT=8637 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_entry`
--

LOCK TABLES `audit_entry` WRITE;
/*!40000 ALTER TABLE `audit_entry` DISABLE KEYS */;
INSERT INTO `audit_entry` VALUES (8623,'2020-12-11 12:20:07',NULL,0.623548,'172.18.0.1','GET',0,'user/security/login',13755784),(8624,'2020-12-11 12:20:16',NULL,0.0484631,'172.18.0.1','GET',0,'user/admin/index',11659328),(8625,'2020-12-11 12:20:16',NULL,0.0598221,'172.18.0.1','GET',0,'user/security/login',13749480),(8626,'2020-12-11 12:20:19',NULL,0.106394,'172.18.0.1','POST',1,'user/security/login',12285952),(8627,'2020-12-11 12:20:19',2,0.094661,'172.18.0.1','POST',0,'user/security/login',12177296),(8628,'2020-12-11 12:20:20',2,0.327918,'172.18.0.1','GET',0,'user/admin/index',17720136),(8629,'2020-12-11 12:20:26',2,0.0613949,'172.18.0.1','POST',0,'user/admin/delete',11929488),(8630,'2020-12-11 12:20:26',2,0.0738871,'172.18.0.1','GET',0,'user/admin/index',17525904),(8631,'2020-12-11 15:20:35',0,2.05804,NULL,'CLI',0,'migrate/up',8969344),(8632,'2020-12-11 12:22:22',2,0.0656171,'172.18.0.1','GET',0,'user/admin/update',14284152),(8633,'2020-12-11 12:22:38',2,0.0501032,'172.18.0.1','POST',1,'user/admin/update',12675888),(8634,'2020-12-11 12:22:39',2,0.104026,'172.18.0.1','POST',0,'user/admin/update',12569384),(8635,'2020-12-11 12:22:39',2,0.055968,'172.18.0.1','GET',0,'user/admin/update',14332440),(8636,'2020-12-11 12:22:52',NULL,0.0881519,'172.18.0.1','POST',0,'api/usuario/login',11821696);
/*!40000 ALTER TABLE `audit_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_error`
--

DROP TABLE IF EXISTS `audit_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_error` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `message` text NOT NULL,
  `code` int(11) DEFAULT 0,
  `file` varchar(512) DEFAULT NULL,
  `line` int(11) DEFAULT NULL,
  `trace` blob DEFAULT NULL,
  `hash` varchar(32) DEFAULT NULL,
  `emailed` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_audit_error_entry_id` (`entry_id`),
  KEY `idx_file` (`file`(180)),
  KEY `idx_emailed` (`emailed`),
  CONSTRAINT `fk_audit_error_entry_id` FOREIGN KEY (`entry_id`) REFERENCES `audit_entry` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_error`
--

LOCK TABLES `audit_error` WRITE;
/*!40000 ALTER TABLE `audit_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_javascript`
--

DROP TABLE IF EXISTS `audit_javascript`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_javascript` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `message` text NOT NULL,
  `origin` varchar(512) DEFAULT NULL,
  `data` blob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_audit_javascript_entry_id` (`entry_id`),
  CONSTRAINT `fk_audit_javascript_entry_id` FOREIGN KEY (`entry_id`) REFERENCES `audit_entry` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_javascript`
--

LOCK TABLES `audit_javascript` WRITE;
/*!40000 ALTER TABLE `audit_javascript` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_javascript` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_mail`
--

DROP TABLE IF EXISTS `audit_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `successful` int(11) NOT NULL,
  `from` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `reply` varchar(255) DEFAULT NULL,
  `cc` varchar(255) DEFAULT NULL,
  `bcc` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `text` blob DEFAULT NULL,
  `html` blob DEFAULT NULL,
  `data` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_audit_mail_entry_id` (`entry_id`),
  CONSTRAINT `fk_audit_mail_entry_id` FOREIGN KEY (`entry_id`) REFERENCES `audit_entry` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_mail`
--

LOCK TABLES `audit_mail` WRITE;
/*!40000 ALTER TABLE `audit_mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_trail`
--

DROP TABLE IF EXISTS `audit_trail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_trail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `model_id` varchar(255) NOT NULL,
  `field` varchar(255) DEFAULT NULL,
  `old_value` text DEFAULT NULL,
  `new_value` text DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_audit_trail_entry_id` (`entry_id`),
  KEY `idx_audit_user_id` (`user_id`),
  KEY `idx_audit_trail_field` (`model`,`model_id`,`field`),
  KEY `idx_audit_trail_action` (`action`),
  CONSTRAINT `fk_audit_trail_entry_id` FOREIGN KEY (`entry_id`) REFERENCES `audit_entry` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_trail`
--

LOCK TABLES `audit_trail` WRITE;
/*!40000 ALTER TABLE `audit_trail` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_trail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aula`
--

DROP TABLE IF EXISTS `aula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aula` (
  `recursoid` int(11) NOT NULL,
  `alumnoid` int(11) NOT NULL,
  PRIMARY KEY (`recursoid`,`alumnoid`),
  CONSTRAINT `fk_aula_recursoid` FOREIGN KEY (`recursoid`) REFERENCES `recurso` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aula`
--

LOCK TABLES `aula` WRITE;
/*!40000 ALTER TABLE `aula` DISABLE KEYS */;
/*!40000 ALTER TABLE `aula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `auth_assignment_user_id_idx` (`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_assignment`
--

LOCK TABLES `auth_assignment` WRITE;
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
INSERT INTO `auth_assignment` VALUES ('acreditar_prestacion','2',1557760212),('acreditar_prestacion','4',1557759493),('baja_prestacion','2',1557760212),('baja_prestacion','4',1557759401),('exportar_prestacion','2',1562862048),('usuario_carga','2',1557760212),('usuario_carga','4',1557755303),('usuario_soporte','2',1557760212);
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item`
--

LOCK TABLES `auth_item` WRITE;
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
INSERT INTO `auth_item` VALUES ('acreditar_prestacion',2,'Permite visualizar una prestaciÃ³n y acreditarla',NULL,NULL,1557243158,1557243158),('baja_prestacion',2,'Permite visualizar una prestaciÃ³n y darla de baja',NULL,NULL,1557243211,1557243211),('consultar_persona',2,'Permite buscar y visualizar un lista de persona',NULL,NULL,1557242128,1557242675),('consultar_prestacion',2,'Solo permite visualizar una prestaciÃ³n con la persona',NULL,NULL,1557242362,1557242362),('crear_modificar_persona',2,'Permite crear, modificar y visualizar una persona',NULL,NULL,1557242240,1557243629),('crear_modificar_prestacion',2,'Esto permite crear y editar un beneficiario con su prestaciÃ³n',NULL,NULL,1557242998,1557757844),('exportar_prestacion',2,'Esto permite exportar todas las prestaciones a una hoja de calculo (Excel o xls)',NULL,NULL,1562859993,1562859993),('usuario_carga',1,'Este tipo de usuario puede cargar, editar y visualizar un beneficiario con su prestaciÃ³n',NULL,NULL,1557238559,1557244060),('usuario_consulta',1,'Este tipo de usuario solo puede visualizar reportes de prestaciones junto con el beneficiario',NULL,NULL,1557238482,1557243805),('usuario_soporte',1,'Se encarga de administrar el sistema',NULL,NULL,1557160315,1557244270);
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_child`
--

LOCK TABLES `auth_item_child` WRITE;
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
INSERT INTO `auth_item_child` VALUES ('acreditar_prestacion','consultar_prestacion'),('baja_prestacion','consultar_prestacion'),('consultar_prestacion','consultar_persona'),('crear_modificar_persona','consultar_persona'),('crear_modificar_prestacion','consultar_prestacion'),('crear_modificar_prestacion','crear_modificar_persona'),('usuario_carga','crear_modificar_prestacion'),('usuario_consulta','consultar_persona'),('usuario_consulta','consultar_prestacion');
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1552672687),('m190724_153500_deleteProgramaHasTipoRecurso',1607700037),('m190730_144525_add_localidadid_to_recurso_social',1607700037),('m200411_221328_tipo_responsable',1607700037),('m200413_171649_responsable_entrega',1607700037),('m200413_181257_modulo_alimenticio',1607700037),('m200414_020356_programa_has_tipo_recurso',1607700037),('m200420_185346_fk_reponsable_to_tipo_responsable',1607700037),('m200421_071947_fix_table_responsable',1607700037),('m200421_230417_add_fecha_entrega_to_recurso',1607700037),('m200429_165019_programaColor',1607700037);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programa`
--

DROP TABLE IF EXISTS `programa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `activo` tinyint(4) DEFAULT NULL,
  `color` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programa`
--

LOCK TABLES `programa` WRITE;
/*!40000 ALTER TABLE `programa` DISABLE KEYS */;
INSERT INTO `programa` VALUES (1,'Subsidio',NULL,'#FF6B37'),(2,'RÃ­o Negro Presente',NULL,'#ABDF7D'),(3,'Emprender',NULL,'#FFC837'),(4,'Micro Emprendimiento',NULL,'#FFF637'),(5,'HÃ¡bitat',NULL,'#4AF9C1'),(6,'Modulo Alimenticio',NULL,'#7DDEFF');
/*!40000 ALTER TABLE `programa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programa_has_tipo_recurso`
--

DROP TABLE IF EXISTS `programa_has_tipo_recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programa_has_tipo_recurso` (
  `tipo_recursoid` int(11) NOT NULL,
  `programaid` int(11) NOT NULL,
  PRIMARY KEY (`tipo_recursoid`,`programaid`),
  KEY `fk_tipo_recurso_has_programa_programa1_idx` (`programaid`),
  KEY `fk_tipo_recurso_has_programa_tipo_recurso1_idx` (`tipo_recursoid`),
  CONSTRAINT `fk_tipo_recurso_has_programa_programa1` FOREIGN KEY (`programaid`) REFERENCES `programa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipo_recurso_has_programa_tipo_recurso1` FOREIGN KEY (`tipo_recursoid`) REFERENCES `tipo_recurso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programa_has_tipo_recurso`
--

LOCK TABLES `programa_has_tipo_recurso` WRITE;
/*!40000 ALTER TABLE `programa_has_tipo_recurso` DISABLE KEYS */;
INSERT INTO `programa_has_tipo_recurso` VALUES (1,1),(1,2),(2,2),(2,3),(2,4),(3,1),(3,2),(3,5),(4,6);
/*!40000 ALTER TABLE `programa_has_tipo_recurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recurso`
--

DROP TABLE IF EXISTS `recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recurso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicial` date NOT NULL,
  `fecha_alta` date NOT NULL,
  `monto` double NOT NULL,
  `observacion` text DEFAULT NULL COMMENT '\n',
  `proposito` text DEFAULT NULL,
  `programaid` int(11) NOT NULL,
  `tipo_recursoid` int(11) NOT NULL,
  `personaid` int(11) NOT NULL COMMENT 'Este atributo hace referencia a una persona del sistema Registral',
  `fecha_baja` date DEFAULT NULL,
  `fecha_acreditacion` date DEFAULT NULL,
  `descripcion_baja` text DEFAULT NULL,
  `localidadid` int(11) DEFAULT NULL COMMENT 'Este atributo hace referencia al sistema Lugar (interoperabilidad)',
  `responsable_entregaid` int(11) DEFAULT NULL,
  `cant_modulo` int(11) DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL COMMENT 'Este atributo nos indica la fecha de entrega de la prestacion',
  PRIMARY KEY (`id`),
  KEY `fk_recurso_programa1_idx` (`programaid`),
  KEY `fk_recurso_tipo_recurso1_idx` (`tipo_recursoid`),
  CONSTRAINT `fk_recurso_programa1` FOREIGN KEY (`programaid`) REFERENCES `programa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_recurso_tipo_recurso1` FOREIGN KEY (`tipo_recursoid`) REFERENCES `tipo_recurso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recurso`
--

LOCK TABLES `recurso` WRITE;
/*!40000 ALTER TABLE `recurso` DISABLE KEYS */;
/*!40000 ALTER TABLE `recurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsable_entrega`
--

DROP TABLE IF EXISTS `responsable_entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `responsable_entrega` (
  `tipo_responsableid` int(11) NOT NULL COMMENT 'esto nos permite tener multiples tipos de responsables. ej municipio, delegacion, comision de fomente,etc',
  `recursoid` int(11) NOT NULL AUTO_INCREMENT,
  `responsable_entregaid` int(11) DEFAULT NULL,
  PRIMARY KEY (`recursoid`),
  KEY `fk_tipo_responsableid` (`tipo_responsableid`),
  CONSTRAINT `fk_recurso` FOREIGN KEY (`recursoid`) REFERENCES `recurso` (`id`),
  CONSTRAINT `fk_tipo_responsableid` FOREIGN KEY (`tipo_responsableid`) REFERENCES `tipo_responsable` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsable_entrega`
--

LOCK TABLES `responsable_entrega` WRITE;
/*!40000 ALTER TABLE `responsable_entrega` DISABLE KEYS */;
/*!40000 ALTER TABLE `responsable_entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_account`
--

DROP TABLE IF EXISTS `social_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_unique` (`provider`,`client_id`),
  UNIQUE KEY `account_unique_code` (`code`),
  KEY `fk_user_account` (`user_id`),
  CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_account`
--

LOCK TABLES `social_account` WRITE;
/*!40000 ALTER TABLE `social_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_recurso`
--

DROP TABLE IF EXISTS `tipo_recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_recurso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_recurso`
--

LOCK TABLES `tipo_recurso` WRITE;
/*!40000 ALTER TABLE `tipo_recurso` DISABLE KEYS */;
INSERT INTO `tipo_recurso` VALUES (1,'AlimentaciÃ³n'),(2,'Empleo/FormaciÃ³n Laboral'),(3,'Mejora Habitacional'),(4,'Emergencia');
/*!40000 ALTER TABLE `tipo_recurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_responsable`
--

DROP TABLE IF EXISTS `tipo_responsable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_responsable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_responsable`
--

LOCK TABLES `tipo_responsable` WRITE;
/*!40000 ALTER TABLE `tipo_responsable` DISABLE KEYS */;
INSERT INTO `tipo_responsable` VALUES (1,'municipio'),(2,'delegacion'),(3,'comision de fomento');
/*!40000 ALTER TABLE `tipo_responsable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  UNIQUE KEY `token_unique` (`user_id`,`code`,`type`),
  CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT 0,
  `last_login_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_unique_username` (`username`),
  UNIQUE KEY `user_unique_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'admin','admin@correo.com','$2y$10$MnF9LJCnya.NrXIQBN4YGuRIdIuGtOSsGqqZTpby9RnFp7Chb4qEm','maXx0ibz2Br9UEfP06TVcltr0uOiWl4B',1556894840,NULL,NULL,'172.18.0.2',1556894840,1607700159,0,1607700020);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-11 15:23:53
