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
) ENGINE=InnoDB AUTO_INCREMENT=32111 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_data`
--

LOCK TABLES `audit_data` WRITE;
/*!40000 ALTER TABLE `audit_data` DISABLE KEYS */;
INSERT INTO `audit_data` VALUES (32107,12120,'audit/request','xúçU€é€6˝ïBOm[u◊\"∫P∂€r%9IãZ¢◊l”ëdÔ¶ã¸{IÍbÔ&˙≤KŒgÊùcG—ú◊∆1iw¿Õû4“vÄÛ˙Ωq‡HMã€K„”íHï\Z/’‰ÎÖ4Ìú‡í‘˜/tÓkŒÙ‘êú‹G/-K‘%ŸU/Ì•&ÚÂt†∏‰V√ëp—VÙƒ/:kÈ[U=,=˛ø≠È·¿r>Ü›S49N˜p#r˝˛á®átk\\„£ËDu^o(ﬁ7P9\n˜8“ü¸ŸYeL&\'|dòpA>‡Û˘±e¿õ«˛-K a+#%-ø› 3@)J>°Ñõ†›x˘<N3—£…_ó∫°yCã\nÚrÀñ#ÒòïªDñÍ∂ÆÔ\nÎ&∑uô∆uÃ‘%‚F2C…R–ÈH/-©è\"ñıªûØÛhÂAî+(_öZ>–d“ÚyJÛ‡0Z†±´Õ‹}jLk⁄‚z˙ÚoﬂS≤Y-„\0ıÂœ5-˚„⁄ÕÊö˘¶T≥≠NŒ›}ºﬁ‚–]≈üö“VûÙx¶\r©Â+9ïTDıÃÕ÷≥¸#˙;WÜxÅiyzhõ:\0Å¶KµB[BdÈf`ª6lÄ|Â7i°·z*T¬¿f}UÖHu}ËÖ¿Û5UıCﬂÚTûòÒΩ˛‘ÀW\\ÀœœœÚæ=\nÍkŸ?‚¿4‰I]Xˆ.‰Dõ‹≠ÑrƒGIÁãO©”ù“35è;öô[`n–}ÜtÓB›”¬\"u≠,mÖ™ˆ∂0¥M+MàExÄ°Î\Z€-∆;\rõ\ZƒÜFlRH\neÜY‰*ç¸(Œõô+è\\ÓÇÂ91Õß§æVEEó\'\\–xOËKñ∏π∑âA†u:h≥°Ÿ8)…u–ÿX(A≥(eœv˛≤XBû™¶≠;=¬eïFÒ™ﬂù\nEC⁄}C~º\n£Ÿ&AπõÃ“AÀì…s’Ó\'¯¸“¿û˜º\'{*≥Ö”kHpç·{o!ıìhùç£˜∆≠èÓ˚Åy¬g!g=Æ“Öõ°‡á¶® ˆ7K¥ Ú$é≈Æ`d,&ËØ\rJ≥<ãñ(±ÀJG1hYÜ≠S@®Ív˘>\\¨π1∞”ÆüÆ|Ci√vºı“ÔƒünKx∑-’ˇø-ªÇ•Ò;√:CŸmiÚo(÷„›ı„¯cÑﬁ¸ñpz”õ≈‰⁄J;Ut∂ÔˇÀ	','2021-02-09 16:09:08'),(32108,12120,'audit/db','xúÌô]o‚8ÜÔ˚+,nh•N◊ÒWP/XönŸ°∞∫£ïFÇî§3—–$AjUıøÔqB∑§òŸ%—¥{A•¶êÿŒ„„◊>Ø]ﬂ%ÓcÍ*∑áiÍ	”FÀwu#◊ÅO¬|¿≠‘e¬måÆü–ÂMØá:ÉﬁÕuÑ.áÉk4ıWAîM¬Eñ<L≠»%´0\\(T§ƒm<D—Á‡ˆsg«˛\"p›Ô´0y0%Y+pâ T)°q∆©‘ÿiØ∆Ó„S‰rÛMs%	mÂ_k0iQâIqNàJ*¡r(π	%∞*ØÁu∆G~æÕVg≥Â\"Õ?ZdìÖáßÊ´xÒÍfﬁÖI∏òÖ¡$ÛoÁ·Ó«’èÚnGãªe˚Y¥\\L“Ÿ◊0ˆüãgë?üºp§®=B…ÏË˜A∑o´ı-|xn}edaä√À—†üsÁWK˜f~Êœó_–94nª?˛SÛxG’ÓıÕx∂˚;\ZYó8…õ:1më.z≤E≤æΩ£í	ÂVï<æüÆº°goÎ@vÎß·qNì7Zù•ƒ—∫c/cèõzmæj√V§Ê4”ÑΩ%ié)„<ó¥:H˙ È˜ët≈U\ZÆ‹*iŒ®2í&xS”Ñb∑—Ìèº·u˚„A9c†„i≤\\e·ÙMì^öfì8Ãæ.sgñÑ~”Ùgªw„ç–qÛ.∫œVI¯Àj1_˙AÛ5;ΩÆ˘C1%0˝Ä5\"¬ÖâÑEÛd{ˆ≤ÌÆÜ˜·lùeBgª≥BJÆ |¶≥‰◊Ÿóq›Ø≥\nÜ∑Û/tVVtñmvñ\ZW‡ç—Â`ËuÎO>zM:W^Á„ákÖ^ûiJâﬁéºtV§Äqˆá©öÜkÀ:4ÛÇFî›mòxKí.Î8Cƒ1\"A¶NN$´UXë¥Ê:)∏x^t9ŸëC≤;$ª}ì›Z¨ª›Û„ö≥K1a’≤√e·€(>h˘†Â∑’r≈uYsõá-Îı∂ö“R&Ö∆/@ cÔ_÷ûI6ÚˆI%¥i@ÿ^ ï≤π:√RK-∂çÄ(]Z>˛Pn£›{C4nˇ⁄Û^@P˚f<òt˚ù°wÌı«Á§VàÄLa,\'\0óìâzdcf^o900ÿ‰vÉ™ü/\"√¡ç·≤ppÅ\rÈ∑–p(b9¨2nG™< åºãÜàòS+ô¶Eà}\r1òxî[¿väÕ+[z˝£S«π_«A\ZXêl;©1-4„ïp*,”ÄC∆ FeäQ+˘yÆ˘¡q«˛GEs˜<´7ß†ÿmC^£N°buPÒA≈o•‚äK1ïJZ2®¬.Ã)q™W&cGv⁄/[Üô≤R`-ÛtÈêˇNQ5gkJ≥Œh∫û—˚˘±\0ﬂ`€9Ä%U≈Òõ„ºA(∂8OÖ.‹ãS≤Ê?<ê¨kÚÄÖajÉÅπwq‰˛0’#±má©&∏†)ôrç›∆ÕmûÚ˘∏Aú´$_]ßÁ‰L) ”öiB‰)ö∆aºL&±?=WX…*÷öi@\n^©vh%ÂñpH¨S(û„∑ÔM≈±q8&≥≠\"ÇK≥q{z˙y<	–','2021-02-09 16:09:08'),(32109,12120,'audit/log','xúÌWmo‚8˛ﬁ_aÒ*u9€I€à,MØ‹“‰ƒÀ≠NZ)	â€FKí›ºHEUˇ˚M∫ÖˆÆB´˚R$ ÿ3ìg&3è|I‰c.πÏƒ*œ˝;ïwæ$¶|å$Ü+÷\\‰Rc≤3øv>£´Âtä∆Œtycœ—’ÃπAû_ÜQ·™§»6^gIoﬁ¸(ëùM}	W_∆i˚I(Â˜Reõ PÑí0B9gBg}É2›–jg_b˘¯I£˙≈1L6x™\"Ô@2©Ï8ﬂT%wËÚ#\n“$QA•âDÒ&ˇæñ˜i^3îYû∫y\ZD˛⁄\rWÉpï¯±zﬁh÷`k;∞ƒï)‹Ópfà6‰∆∏BŒvë3,†ö÷‘\Z/Œºæe‡ÁEÊGI·V.v6÷eúºZÃ‘≠ T®–-¸’Zﬂﬁq?´Wî‹¶YÏW	πypØbˇŸº®\nÙÇ#G£9 Ç≥?úâ›ÊıUmû£óUÎTÊps‰ÿ5é^˝Ÿí^‡˛:ΩCCﬁ∂ÓÃ~xˆé∏NÊ»Æ˙pd_	≤µ8ØCùWÜmïn29@≤]>‚TïÚ¿•ÆÔÁkkfµ«\Z¢ê≠¸\\ıj4u–Ê—µXúm{y∂∞››ô≥Ó´m&ßç¢ ò4¥Å)fz›–b∑°	≈≤3±Á÷lÅ&ˆ¬ŸÁ‘Û≤¥,îwÅºL¡-Û¬çUqüÜ’Jê)øP°wé˛\ZMó÷ı∫∑—CQfÍ∑2Yß~ÿΩ@›ÒtR}QL…L?`Åì0Eòuœ:ª€<’L{°⁄2’√á§√LSß¢!∫õ*≠à–Z†+gfM~∑›O÷ﬂÓ¯⁄\ZöC˝Ò)XÃæ†î0J¿\0.h]vbÏ±2=Œ [~;Åë+@∫‡áºfHËÉ\Zﬂ\'6ÚNlÔƒˆVb€∂Í1R{ﬁ>≠ìπF«‹d0Z\r°—=qQ≈æÑF^Xˇ6Noúpa\Zm(ﬁË™ÔÕ7≥—taÕ–bÙqjΩ†@£Â¬q\'ˆxf›XˆbHNÅ≈˚ÓÆµÕπ.L≠&Aj˛ÚÍ>ap¿h-¸«Õl¯O√ˇG}úî¥3¡¶¶ÌH¸L.Ø˝Xô˜5,®Å[–òúSﬁîiOo\Z¬xßÂwZ~ªﬁ\\˚«Ö&Ïù‘ƒ§éhkb†É÷MºØ1˘+Œiü£7Õ5	õ≠ n&Ißø®,ﬁ∆æ√iQ≥Øn¸g	z\"”iB£&i√´ôNﬂì|îˇÚœÀTd_ÙWΩ∞ÃÍˆÜ§‰§iöö ƒ·´8Õ6nÏ?xCéÅì5ÌE!8P¯Wqj2êJõ~ÂL‡Ò>=˝¥ﬁA','2021-02-09 16:09:08'),(32110,12120,'audit/profiling','xúÌö]o\Z9ÜÔÛ+,níHi÷ﬂ_(îL6l)¨ÄlµR%ò0n2*ÌÃ 5™Úﬂ◊ûÅ\rì.ÉíÓ\\ò±=èè_˚º6	5—ﬂ3Õumj¶≥Ù°VèµDå¬Îô¶∫ñ«SS´G\Zù+\n°P\nj_L⁄€“’ ≤Œdµz®	’ﬂcçÌ\'Ó>@[B`]Î~1Iú‹ÅÀ∑`<K3Œ„Y¢¡Ù!˚:—˜≥,øHÕxûf≥a6«·d›÷£€$úöÂçÚ∫CC÷›S2çâÆ=ƒÒ«ËˆcÛ©a=≥œseâ£ÊK…ÂÁs ïΩN- ‘ﬂcÕ‹7©8Ü∞˛Ë*º0π‚…ÖTÃÉÆóú:t∫äNÏhˆØª¿’Mª\rö›ˆÕ˚N\\ı∫Ô¡(úGq>4Iû>å6äV∞¶”0â¥˛:7•*6°§>&)Æ_˜`z\n’NLí1Ñ<PBrR@âU(ï•\n⁄AspÏÎÛx~n:À”0NÚ°»≥ïì˘4˘·bj>ô‘$c\rÛvb∂ﬂ^©~Tt;N>Õ“iËF~òçÔÕ4\\œùîû82–ËÉt|ÙG∑’Ò’˙lñ≠œ›\\t≈Ì√A∑SpúÔûÓç√<úÃÓ¿Öm‹wΩ€˚∑Ê…ñ™≠>Ë∏Òlt.∑4≤(qZ4uÍ\n˙\"]ˆdÉdqyK% ç*E|?\\Ω¿ﬂ÷à,ŸmòôìÇ¶h¥:Oâ£E«û∆÷ﬁ>^—ÎÒm¯äÏ9Õ\"hsÓ3à	cÖ§ÂA“Iˇ\ZIW\\•Ìª\'ùYI3Ç•ì4Ç´öFÍZ´”z–Í∫Îúå“Ÿ<7£30Jç}hñß&øüEÓ 85an¢—)¯´—æ	˙‡‰¯S¸-üßÊ∑y2ôÖ—Ò8n∂[ÓÜΩÅ¯\rT\0qm\'‰«ßœªéEWÕ7õÓs„Î,·—ÕŒr!òuEg—ˇÆ≥~£ÚÛŒJà‹Ãø∂≥ë≤≥k&;W¿U∑¥~Ôﬂõ◊AÛ]ﬂ*ÓzqÆ0Fj3ÚÇ(Q	Cwá©öÜ)œ:ni0d%\r_3LxªaZòÀ}ú#bêx±‡ò@\\∏J$™UXëÊ:¡_.j=Ÿ°C≤;$ª]ì›B¨€›Úˆû≥KÓ’2e¢Ùm¥|–ÚÎjπ‚∫¨òœ√X-´≈∂\ZØù˙∏∆/≠î¡O÷éI‘n‰˝ìJpYú·`≤H•l.œ°PBÒM£cA§*ç^?˛ê∫÷hÇ4ﬁ∂É\'–∏tá≠N≥º:É¥Wà,ôÑPPCÆ „˚ëUåô{ºÁ¿»ÇŸ˝@a7∞|y9ÊóáÉÒÚ´◊–êÂê»sXÂ‹éêE@˙%\ZBúCÜΩdjyTäâÜàùxòy¿8§Âfä¨[zı‹©„$‹«A;\Zª ˘vBA\\:h¬*·TX¶-BJç-Sé⁄öügä«¡qÏ~T4	∑üŸ{˚Õ)Ñ∏UÏ¶äm^√¥T±<®¯†‚◊Rq≈•)<TBKF◊è8Â&cKv⁄-[\"âÙR@%ätI—ß®ö≥∆úxg4^ÃhJ^>÷7¯v÷í Ú¯ç“WÅÁ)!á•{°k÷¸Ÿ…}Mûe!˚`‰Ú7e±;Lı¿Ë€aJ,i÷LπÇ∫vÛÁe√œ˙˘∏CEÛ¥X]GË\\JLQä(ÑƒïˇÊ0úÜﬂF*$ÂZ3ä#[[Ø¥whfû8Ñ\r,-œ‡Î˜¶‚ÿP%æUÑ3·6nèèˇ\0B„ê	','2021-02-09 16:09:08');
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
) ENGINE=InnoDB AUTO_INCREMENT=12121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_entry`
--

LOCK TABLES `audit_entry` WRITE;
/*!40000 ALTER TABLE `audit_entry` DISABLE KEYS */;
INSERT INTO `audit_entry` VALUES (12120,'2021-02-09 16:09:06',0,1.88233,NULL,'CLI',0,'fixture/unload',8091736);
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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
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
INSERT INTO `auth_assignment` VALUES ('admin','2',NULL),('prestacion_acreditar','2',1611922871),('prestacion_baja','2',1611922871),('prestacion_crear','2',1611922871),('prestacion_ver','2',1611922871);
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
INSERT INTO `auth_item` VALUES ('admin',1,'',NULL,NULL,1609168922,1610453779),('persona_crear',2,'Permite registrar una persona',NULL,NULL,1609162941,1610454384),('prestacion_acreditar',2,'Permite acreditar prestaciones de su programa','prestacion_rule',NULL,1609162941,1610454397),('prestacion_baja',2,'Permite dar de baja prestaciones de su programa','prestacion_rule',NULL,1609162941,1610454413),('prestacion_crear',2,'Permite crear una prestaciones de su programa','prestacion_rule',NULL,1609162941,1610454431),('prestacion_ver',2,'Permite ver prestaciones de su programa','prestacion_rule',NULL,1609162941,1609343873),('soporte',1,'',NULL,NULL,1609244989,1609244989),('usuario',1,'',NULL,NULL,1609168970,1609168970);
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
INSERT INTO `auth_item_child` VALUES ('admin','soporte'),('admin','usuario'),('prestacion_acreditar','prestacion_ver'),('prestacion_baja','prestacion_ver'),('prestacion_crear','persona_crear'),('prestacion_crear','prestacion_ver');
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
INSERT INTO `auth_rule` VALUES ('prestacion_rule','O:23:\"app\\rbac\\PrestacionRule\":3:{s:4:\"name\";s:15:\"prestacion_rule\";s:9:\"createdAt\";i:1609338654;s:9:\"updatedAt\";i:1609338654;}',1609338654,1609338654);
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
INSERT INTO `migration` VALUES ('m000000_000000_base',1552672687),('m190724_153500_deleteProgramaHasTipoRecurso',1607700037),('m190730_144525_add_localidadid_to_recurso_social',1607700037),('m200411_221328_tipo_responsable',1607700037),('m200413_171649_responsable_entrega',1607700037),('m200413_181257_modulo_alimenticio',1607700037),('m200414_020356_programa_has_tipo_recurso',1607700037),('m200420_185346_fk_reponsable_to_tipo_responsable',1607700037),('m200421_071947_fix_table_responsable',1607700037),('m200421_230417_add_fecha_entrega_to_recurso',1607700037),('m200429_165019_programaColor',1607700037),('m201223_123304_permisos',1609162941),('m201228_135012_programaHasUsuario',1609244609),('m210108_123238_user_persona',1610459239),('m210108_152639_user_baja',1610628371),('m210128_145420_usuario_last_login_ip',1611845767),('m210128_153224_usuario_descripcion_baja',1611848390);
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
INSERT INTO `programa` VALUES (1,'Subsidio',NULL,'#FF6B37'),(2,'R√≠o Negro Presente',NULL,'#ABDF7D'),(3,'Emprender',NULL,'#FFC837'),(4,'Micro Emprendimiento',NULL,'#FFF637'),(5,'H√°bitat',NULL,'#4AF9C1'),(6,'Modulo Alimenticio',NULL,'#7DDEFF');
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
-- Table structure for table `programa_has_usuario`
--

DROP TABLE IF EXISTS `programa_has_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programa_has_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `programaid` int(11) DEFAULT NULL,
  `permiso` varchar(64) DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_programa` (`programaid`),
  KEY `fk_user` (`userid`),
  CONSTRAINT `fk_programa` FOREIGN KEY (`programaid`) REFERENCES `programa` (`id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programa_has_usuario`
--

LOCK TABLES `programa_has_usuario` WRITE;
/*!40000 ALTER TABLE `programa_has_usuario` DISABLE KEYS */;
INSERT INTO `programa_has_usuario` VALUES (12,2,6,'prestacion_ver','2021-01-07 14:59:43'),(13,2,6,'prestacion_crear','2021-01-07 14:59:43'),(107,2,1,'prestacion_ver','2021-01-29 12:21:11'),(108,2,1,'prestacion_crear','2021-01-29 12:21:11'),(109,2,1,'prestacion_acreditar','2021-01-29 12:21:11'),(110,2,1,'prestacion_baja','2021-01-29 12:21:11'),(111,2,2,'prestacion_ver','2021-01-29 12:22:27'),(112,2,2,'prestacion_crear','2021-01-29 12:22:27'),(113,2,2,'prestacion_acreditar','2021-01-29 12:22:27'),(114,2,2,'prestacion_baja','2021-01-29 12:22:27'),(115,2,3,'prestacion_ver','2021-01-29 12:22:31'),(116,2,3,'prestacion_crear','2021-01-29 12:22:31'),(117,2,3,'prestacion_acreditar','2021-01-29 12:22:31'),(118,2,3,'prestacion_baja','2021-01-29 12:22:31'),(119,2,4,'prestacion_ver','2021-01-29 12:22:36'),(120,2,4,'prestacion_crear','2021-01-29 12:22:36'),(121,2,4,'prestacion_acreditar','2021-01-29 12:22:36'),(122,2,4,'prestacion_baja','2021-01-29 12:22:36'),(123,2,5,'prestacion_ver','2021-01-29 12:23:30'),(124,2,5,'prestacion_crear','2021-01-29 12:23:30'),(125,2,5,'prestacion_acreditar','2021-01-29 12:23:30'),(126,2,5,'prestacion_baja','2021-01-29 12:23:30');
/*!40000 ALTER TABLE `programa_has_usuario` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsable_entrega`
--

LOCK TABLES `responsable_entrega` WRITE;
/*!40000 ALTER TABLE `responsable_entrega` DISABLE KEYS */;
INSERT INTO `responsable_entrega` VALUES (2,1,2);
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
INSERT INTO `tipo_recurso` VALUES (1,'Alimentaci√≥n'),(2,'Empleo/Formaci√≥n Laboral'),(3,'Mejora Habitacional'),(4,'Emergencia');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'admin','admin@correo.com','$2y$10$MnF9LJCnya.NrXIQBN4YGuRIdIuGtOSsGqqZTpby9RnFp7Chb4qEm','maXx0ibz2Br9UEfP06TVcltr0uOiWl4B',1556894840,NULL,NULL,'172.18.0.2',1556894840,1611922324,0,1611922324);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_persona`
--

DROP TABLE IF EXISTS `user_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_persona` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `personaid` int(11) NOT NULL,
  `localidadid` int(11) NOT NULL,
  `fecha_baja` date DEFAULT NULL,
  `descripcion_baja` text DEFAULT NULL,
  `last_login_ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  CONSTRAINT `fk_user_persona` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_persona`
--

LOCK TABLES `user_persona` WRITE;
/*!40000 ALTER TABLE `user_persona` DISABLE KEYS */;
INSERT INTO `user_persona` VALUES (2,0,2626,NULL,NULL,'172.27.0.8');
/*!40000 ALTER TABLE `user_persona` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-09 16:09:29
