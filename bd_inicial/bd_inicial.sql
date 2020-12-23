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
) ENGINE=InnoDB AUTO_INCREMENT=18861 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_data`
--

LOCK TABLES `audit_data` WRITE;
/*!40000 ALTER TABLE `audit_data` DISABLE KEYS */;
INSERT INTO `audit_data` VALUES (18857,9225,'audit/request','xœuUÙŽ£8ý•O3	f_¢~`1	ê$¤ô,Š„p%H	0RÕ]êÛ@*ÕÕó‚|}ïrî²%Õ~%¶aODÎ˜dûõ±%`¤C]O¼ºÀÂ¢´Á‚0¼Ðâ{LºFn_hLGšº\"øƒ’éê¾£†(P±Ôe\'æŒª¾a—:½Ë»²®¸ ÙÂø{yªßÊR>pü!¯¯WTäà0Ñ««®­/ÜÚöðÖìýþw#O&w¨EWŒl¿Ž‰|Œ¡´¥çb6C\'ü	–”tOØ­‹oo	Ñx…17k4ún¶Š’”»7ØË¼oI‘:/Ñ%+ŽLaÚÃl\rœÂ´€\nUEêÓ‹ÉÒ¡Ü-\r†Ø%-D\nã\r;Rn_:Ü^9–Æ»[í²pf~ó+êPìI+^ê]DÜåbsn&×„kxwF}SõL›ësÉœw¨¿|cŠ÷ÛMäÃÑ}ÓÖÅxÜ9éŠ§f¼sEŽee?ÈwñMÁƒÈ?m]wâœÖ¹©	nÅ®Šš£Fæ–»eöþp‘æ\n\\ß0]-°\r\0_Õ€©˜¥ù45Ã·ø€žô›Õ@w\\E–ßF {Š\"CÅñd7\0®§*Šx¦«0Ã”ïÝŸþD½xC­øüü,ž»+§ž²–þÃtFœ+nË‰n«šdNÙ²)âEIVë¯knÅ¤‘©U4ÐLÕ<W®C’•#k:ïŠÔÔ¢°$ çŠª[ÇÜ\0²©«jaÈ(—T€ž\0Ð5M•ÁñˆÐ“ŠUFºŠ-\\\0çÒÐGl\\Y—†^eëýÒá\r!SQÓ8Ë®:rHp{+ó²^÷\'ÔN©±˜à_iìdî>\\û™wÉÔc¨AùË³ß¦»;Šá2Lè3ž»\"ÿ¯³ŸJÒµC?OK\'*	£í¸†.ä©yÑ6—ûfN¼L¦^žÍžËî<CÍ‘GÞ³_L\0í¦iÌ‘y¸ÆÂÓm3…“xq¸Kïcø ÔîÊÇÑy`3‘ÑX·ÉÚI¡ÿ€ýÈÛoà6Íâ(âƒR>EÃ/{˜¤Y\Zn`¬#‡\n[Òi(Š¤isYWS³ÆÄá|‘ÝC×¡ötc{J™ÖßÉ°ó~¹åËp°”3­Âdúl	Ó·ÈJÄ·ßÃ’ô¢èsßýgÉÛÁZ\'Š>Üýøtœô¡','2020-12-23 14:19:16'),(18858,9225,'audit/db','xœí˜ßOÛHÇßù+Vy$Jwg;—©Ê)MNÚ—J±±—Ö×ØálçD„øßom‡7‹ÔáÞC„ÄÞ]Ïgæ;³³	<âÝçžòz‰Éóà‹É{ýÀåÝÇ³ïDù÷s\n¯7}?ù„Þ]Fèt2ºú0ž¢w“È–Q\\ÌLZd+¿×=bÿ¶/`\'ñz«8þ]>]$IFž÷ÏÒd«r$íGXIJ	çÇ ˜\0©ûõ³±wÿ{¼ü¤¹\\ô«/0J‹VFqÂÁa“T\\V6ÉM›ÖÖ¨áhxz¹‡ìÏ·py.Ò¼È‚8-fi˜£óe’þp137&3ih¢Y\\ÏÍó·7¦ïUÔqz³È’ ˆé,¿š$x^ÄÁ|ödGŽN¦(÷þœœ]³¾™ÕãêËRåpûp4WvT¯¼0(‚ùâ\ZØÅ]×\'ßg<3õ|ŠÆe8OÆgÏ,²qX-uXtyº&Ù²d}ù™I¥+·¦Tþýô~x1t¯5@‘µì:ÈÍAeMµh:Çˆ½5ØSlííý\r¹îÿ°†kÈÓŒÌ·Í1P¦+E«ßŠþ­è_£è¶5Zãí\ZmÍAB©h‚7%Mˆ•ôùx:¼¸DçãËIs»@~¶XÆ?B~fì3ób–˜âë\"*¯„™	\nù‡èãÉèj8E5ÇÛpn‚ty»„öOGçå?À€ßxæÙg¾¸ºtÔÜ™ÐZàBÕ ävò\n	R(U¡’ÿêSLwDå˜âbU\ZjVºÉª±×;³…êrØhJ¥ú¨–{±º}’ÞÛ5r­Ï5-úcÐÀ±6sm5w\ZqL9œmÓHL(ÐZ¤¬{šV±)i€âíNÍÂ0¶Î8±	£øŽ0ÑuGQ¥¶ÓÉrH\\ï…DvÊÑ:”RáT—²7*Ý\0;‚Ø}ª£ˆPé(pÒ>I\\‚\0î¤uH˜m¨\\ \0¸FŸå–VÄóGïùõœ/G^Ûm„¬½O_ÍèÖŽ–;¤O\0³µ£ÇF\r;*æ6[ÜÄó8í*¤ÂÚÉCWÛˆ_ÁÓ:<\n´KRÀ«qšç\rwB—j—‰ 9wT!¢¥í³*£õëÝÖÓcWÅ!ÚvÇ¬4š6zCIœFÿüäaßÝ¹[‚Á¡y×\"¡ðÊ¦·v:á.yƒP7ä”ý„RL–-²ýmu|Ófo3ªj©ð×³ºµ«X1»¬æb-ðf·¦v¬ŒæÎfl7U^€\r€“E±ú8@U×,íãÂ(u¡hQX³e“;¢„ËlÞUTìÍPŸé¥}Ps…Ù»&itrJ{½«¿ÎN,Ió+‚éðùÑ2«¾NóäkÀ¶I‘˜AŸ˜d‘­lÏwç¤MQŒÕcEˆ# ø‹ÃbÈ­yÝ”2Ö9Jë°p†¹c§³­ª²îyxxøžô†P','2020-12-23 14:19:16'),(18859,9225,'audit/log','xœ½W[oÚH~Ï¯ñ‘ÒÔ3ãÛÃòM¨JE¡\n¤}©„{’x‹m:¶WAQþûÛàzX-ªÄÅŸsæûæ\\‘‹çL¸¢«,“*ëô¥ÀL<GÂ‚+^_d‚rÑ™}œ~CîÆct=ß}žÌÐ‡ÛégäË\"Œò…Jr½ñ;ýH`øØð! G°èl¢è{¸ü~Æ±LB!~JoJAÚæ–ëPŠ»$.Åö*m),ñü	VÞ¹¶=Þ)MïarˆèL×*‰’tó\'\nÒ$QA¥‰@ñ&û¹i–´\n\n¥‹,\r\"¹Z„Ë~¸Ld¬vêõnº‡ûÕ®Ha»È]fn{Ä*ó}àÜòà4‡ãáõüÁëGP\\ú,×2JòE‰îbïÁªˆ“_µºWZ%\n¹\\®ÔáÇ{êg•»¢ä>Õ±,ù,²àQÅr\'ž—çó†#CW3¤ƒ³OÓÑÄ¤õCmvÖ‹2tJqØM\'Ž^õm È\\®Ò4\0ã¦õéí«fï€êh†&e^MnÙJœW¦ÎKAÓI×LZH¶Ë”Ê£l©Tçûíãðvh¶5@! [ÊLõ*4•ÑÚu‰³-±7ßÂãî^žu±aù½TdÌ³[Í,b1×.ÚÛhŒ! G“ÙðvŽF“ù´YPÏ×i‘+ÿùZÁ–Y¾ˆUþ˜†åJ •ÌUèŸ£¯Wã»áõjïƒ•’I±î^ îõxTþØþ&ïEØ°\'fÝóÍÜ-Mõ¹ž+QpNq‹)w¹UÍ!ûT=Ktn uçÃFõ+}ç£:\0òÍúÍï·ŒkmÉ¢?\r6€™yðnûì2ü’2¸±ÛÔ±0¶íšÛ\'ã²#É„ËÓð ®MÚNŒ‚;Jnƒ?’”ˆÓ¡5úÃÃNÕÐH££q³?b­v<^óåƒÌN˜1vˆ]õ2b7‚yökÞG+hÚ§ñ€ãpf¢C°MªJFœ†Ì¡TVóúÀcØÚƒê[å1mLg6‚þKþ-³@GëüdÈ9¶8m\'PcI\rœþ‡ÓVZ§út˜Áf2¥ÄæU€ÐÆðæºGÆ»z‚à9I¬sB MMT8ß†M£m»Î‘T``^ˆ	£†®ìPÛbu°]Ù…ùãîËÍ0iŽ³áùa¡«ÉÕàKò²(X6æÆXÅ©Þ@‰}òPø°e¹»¸‹BàÂ~—%†?5ÐÏ*//ÿ\04Ý\0®','2020-12-23 14:19:16'),(18860,9225,'audit/profiling','xœíY]OÛH}çWŒòH”Î·gœÍ©Ê*MV¶/•càmbSÛYUü÷½c‡7Ãª1Š»HH<_çÜ{î;và3ÿkîK¿37ó4[vº±ïIKÊ»¹ÏýNÏM§ùäkA…TXp¢5%\ZÚ•–çÁ­É;ÝÀgØÿ\Zû¾IûCúÑ½IâäýŽÂ4ILXÄiâ£ù2ÿ2óïÒ¼èe&\\dy:ÉÓ0f“èº]\'ÁÜ<5T×-6o…»v•Ü§Ìï,ãøStýéôyb?…õl_faK¬<ÆˆÇT1¢¤†êcìûKiI8ï>Ú;†®eCè\\Ï][‡(¯CgàÏñûÑGôîj0@§£ÁÕ‡á½»}@Ó`ÅÅÄ$E¶œnZ”¬ÁšÏƒ$òý/SéÂŠºA))d·üù\nPÏ¶Ú\n” ‚:0yJx%&o“Ä\Z@õýÓË=¯ÏáâY\'ÅÄ:òh­a¶˜\'ß]ÌÌÉLšhR×3óróÚð½’uœÜ¤Ù<°žŸäá™OÝ+¥g9:£,Üûct>túl–O³/l0Úî°8\Z\rKå§ƒ^Á,½E=˜Üu}tñmäÁCÏÇhhÝy2<{a’UÃrªCÛÑeéŠÉ’ÕåYSn)íûñ}ÿ¢ïž«‡\"@väæ DSNZ¹ÎÑcoEìÙ·Ð¼¿&×ýïæpuye˜	‰Å†¢¦ŒëRÑê—¢)úç(ºiŽÖx3Gƒ¢õ¨U4Áë’&$}>÷/.ÑùðrTß.ÐÁ4K…™¡if`Í¼˜ÌMq—FöJ˜™ 0Ñôýu2¸êÑAÅãm83A²¸ß?Bû§ƒsûbŠßú†2D¸k±øß5ÇŠ¨y€½¾0.ªšJo3x¥G=©Ê}›ÿUwòT„¸¸*M+®µúJc¿s‰ê²_+¬R§¨’{±¼–ÞÛåJŸ+¶è·^`\Zþ9w6ò˜	\"¡ÐÝ`ãaÂ(«DÊÛgÓÈ7–\rex³R2œ¯\"N®“QbK2ÑuK^¡Jm†ððpµ¯UýÁ“Nu)h(‰è\Z¹%Ø§Zòó	Îƒ•´Ä–Åíiì•‹¥¸\"R;ØJ·´æA<{\"ò-#ïÎøpú£Ž¸†m„¬¬Ïvº±¡=†Ò\'ó•¡kÇFM·TÌ}–ÞÄ38µ·\0žÂÚÉ‡ÑêhNåÏàÓØ=Šj—¤(ç¼¢S?o¸ÚV¨m‚Â‘…ˆö Î*AëÝnji‰±+ã\rÕqu;ªVzÄ	úïàŸ ³ø¾hÏÜ’Lš§RàJ$Œîzc£á’7•’V9ã? “eiÖ¢½aRÇ6hæLUR»CÝØÔ”€˜]¨…\\	¼^­©-3£y€ˆm\'ËK\nprQ¼:0Õ6—æ~áŒ¹¨hYx½dó¶¤.²Y[^±#T8¥Õy€“–©4wŠä.§p¨°+&µJNi¿sõçÙ	0©ß\"÷/Ñ4Zdåí´iÏ>¶¡Šs\"ÙšVÏy æ{˜ö<QŒÕSFˆ£iOS*^í8\";¨h-ª¢”óÖ©4v‹àX8v:(U˜çñññ_uƒÛ','2020-12-23 14:19:16');
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
) ENGINE=InnoDB AUTO_INCREMENT=9226 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_entry`
--

LOCK TABLES `audit_entry` WRITE;
/*!40000 ALTER TABLE `audit_entry` DISABLE KEYS */;
INSERT INTO `audit_entry` VALUES (9225,'2020-12-23 14:19:15',0,1.09204,NULL,'CLI',0,'audit/cleanup',7621008);
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
INSERT INTO `auth_assignment` VALUES ('1_ver','2',1608731960),('3_ver','2',1608731968),('usuario','2',1608732824);
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
INSERT INTO `auth_item` VALUES ('1_acreditar',2,'Permite acreditar prestaciones de su programa',NULL,NULL,1608730687,NULL),('1_baja',2,'Permite dar de baja prestaciones de su programa',NULL,NULL,1608730687,NULL),('1_crear',2,'Permite crear una prestaciones de su programa',NULL,NULL,1608730687,NULL),('1_ver',2,'Permite ver prestaciones de su programa',NULL,NULL,1608730687,NULL),('2_acreditar',2,'Permite acreditar prestaciones de su programa',NULL,NULL,1608730687,NULL),('2_baja',2,'Permite dar de baja prestaciones de su programa',NULL,NULL,1608730687,NULL),('2_crear',2,'Permite crear una prestaciones de su programa',NULL,NULL,1608730687,NULL),('2_ver',2,'Permite ver prestaciones de su programa',NULL,NULL,1608730687,NULL),('3_acreditar',2,'Permite acreditar prestaciones de su programa',NULL,NULL,1608730687,NULL),('3_baja',2,'Permite dar de baja prestaciones de su programa',NULL,NULL,1608730687,NULL),('3_crear',2,'Permite crear una prestaciones de su programa',NULL,NULL,1608730687,NULL),('3_ver',2,'Permite ver prestaciones de su programa',NULL,NULL,1608730687,NULL),('4_acreditar',2,'Permite acreditar prestaciones de su programa',NULL,NULL,1608730687,NULL),('4_baja',2,'Permite dar de baja prestaciones de su programa',NULL,NULL,1608730687,NULL),('4_crear',2,'Permite crear una prestaciones de su programa',NULL,NULL,1608730687,NULL),('4_ver',2,'Permite ver prestaciones de su programa',NULL,NULL,1608730687,NULL),('5_acreditar',2,'Permite acreditar prestaciones de su programa',NULL,NULL,1608730687,NULL),('5_baja',2,'Permite dar de baja prestaciones de su programa',NULL,NULL,1608730687,NULL),('5_crear',2,'Permite crear una prestaciones de su programa',NULL,NULL,1608730687,NULL),('5_ver',2,'Permite ver prestaciones de su programa',NULL,NULL,1608730687,NULL),('6_acreditar',2,'Permite acreditar prestaciones de su programa',NULL,NULL,1608730687,NULL),('6_baja',2,'Permite dar de baja prestaciones de su programa',NULL,NULL,1608730687,NULL),('6_crear',2,'Permite crear una prestaciones de su programa',NULL,NULL,1608730687,NULL),('6_ver',2,'Permite ver prestaciones de su programa',NULL,NULL,1608730687,NULL),('admin',1,'Controla todo el sistema',NULL,NULL,1608216298,1608560794),('soporte',1,'Realiza operaciones de soporte',NULL,NULL,1608216343,1608560667),('usuario',1,'Puede efectuar funcionalidades administrativas',NULL,NULL,1608216429,1608726657);
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
INSERT INTO `migration` VALUES ('m000000_000000_base',1552672687),('m190724_153500_deleteProgramaHasTipoRecurso',1607700037),('m190730_144525_add_localidadid_to_recurso_social',1607700037),('m200411_221328_tipo_responsable',1607700037),('m200413_171649_responsable_entrega',1607700037),('m200413_181257_modulo_alimenticio',1607700037),('m200414_020356_programa_has_tipo_recurso',1607700037),('m200420_185346_fk_reponsable_to_tipo_responsable',1607700037),('m200421_071947_fix_table_responsable',1607700037),('m200421_230417_add_fecha_entrega_to_recurso',1607700037),('m200429_165019_programaColor',1607700037),('m201223_123304_permisos',1608730687);
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
INSERT INTO `user` VALUES (2,'admin','admin@correo.com','$2y$10$MnF9LJCnya.NrXIQBN4YGuRIdIuGtOSsGqqZTpby9RnFp7Chb4qEm','maXx0ibz2Br9UEfP06TVcltr0uOiWl4B',1556894840,NULL,NULL,'172.18.0.2',1556894840,1607700159,0,1608214173);
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

-- Dump completed on 2020-12-23 14:20:22
