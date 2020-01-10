-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 06 Oca 2020, 12:42:41
-- Sunucu sürümü: 10.4.6-MariaDB
-- PHP Sürümü: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `turistikmekandb`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `parentid` int(11) DEFAULT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `category`
--

INSERT INTO `category` (`id`, `parentid`, `title`, `keywords`, `description`, `image`, `status`, `created_at`, `updated_at`) VALUES
(13, 0, 'Tarihi Yerler', 'Tarihi Yerler', 'Tarihi Yerler', NULL, 'True', NULL, NULL),
(14, 0, 'Kutsal ve Dini Yerler', 'Kutsal ve Dini Yerler', 'Kutsal ve Dini Yerler', NULL, 'True', NULL, NULL),
(15, 0, 'Turistik  Yerler', 'Turistik ve Simgesel Yerler', 'Turistik ve Simgesel Yerler', NULL, 'True', NULL, NULL),
(16, 15, 'Tarihi Yürüyüş Alanları', 'Tarihi Yürüyüş Alanları', 'Tarihi Yürüyüş Alanları', NULL, 'True', NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `subject` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `placeid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `comment`
--

INSERT INTO `comment` (`id`, `subject`, `comment`, `status`, `ip`, `userid`, `created_at`, `updated_at`, `rate`, `placeid`) VALUES
(2, 'Best Place', 'I like this place', 'True', NULL, 1, NULL, NULL, 5, 2),
(3, 'Güzel Yer', 'En kısa zamanda mutlaka gideceğim', 'True', NULL, 1, NULL, NULL, 5, 2),
(8, 'Dikkat edin', 'Kaleye çıkarken dikkat edin, düşebilirsiniz !', 'True', '127.0.0.1', 2, NULL, NULL, 3, 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `place_id` int(11) DEFAULT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `image`
--

INSERT INTO `image` (`id`, `place_id`, `title`, `image`) VALUES
(2, 1, 'Ön', 'e5f4567e735355b9c5b888213b42a47a.jpeg'),
(3, 2, 'Havadan Görünüm', 'b572e48fd434d374222bc7e54a38d348.jpeg'),
(4, 2, 'Cafeden Görünüm', '6c34ebb7cb969e85f1e0c84ece060e69.jpeg'),
(12, 7, 'roma 2', 'f40d41b060721e586e742035c4950598.jpeg'),
(41, 7, 'ön', 'c61dc7fd754fe8ef5bfe93004e9c0d6e.jpeg'),
(42, 8, 'Kış', 'a23a34574027fb4983136c06191a6ac4.jpeg'),
(43, 8, 'Uzaktan', 'c62f60b7f220971e55eb9915623c18af.jpeg');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `firstname` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `messages`
--

INSERT INTO `messages` (`id`, `firstname`, `surname`, `email`, `phone`, `message`, `status`, `ip`, `note`, `created_at`, `updated_at`) VALUES
(5, 'ALPER1', 'KUYUCU1', 'alperkyc17@gmail.com', '+905074764396', 'testtt', 'Read', '127.0.0.1', 'I will answer this request. AlpeR', NULL, NULL),
(7, 'sdad', 'asdasd', 'sadasdas@gmail.com', '234234234', 'test test test', 'New', '127.0.0.1', NULL, NULL, NULL),
(8, 'Merve', 'Bozkurt', 'mervebozkurt@gmail.com', '05076485456', 'I like your videos', 'Answered', '127.0.0.1', 'Thank you. Follow me more information.', NULL, NULL),
(10, 'ALPER', 'KUYUCU', 'alperkyc17@gmail.com', '+905074764396', 'Mail Çalışıyor mu ?', 'New', '127.0.0.1', NULL, NULL, NULL),
(11, 'ALPER', 'KUYUCU', 'alperkyc17@gmail.com', '+905074764396', 'Mail Çalışıyor mu ?', 'New', '127.0.0.1', NULL, NULL, NULL),
(12, 'ALPER', 'KUYUCU', 'alperkyc17@gmail.com', '+905074764396', 'test mail', 'New', '127.0.0.1', NULL, NULL, NULL),
(13, 'Test', 'Test', 'placeprojecttest@gmail.com', '+905074764396', 'Test mailidir.', 'New', '127.0.0.1', NULL, NULL, NULL),
(14, 'Taha', 'Dursun', 'dursuntaha08@gmail.com', '13123123', 'test', 'New', '127.0.0.1', NULL, NULL, NULL),
(15, 'Merve', 'Bozkurt', 'placeprojecttest@gmail.com', '0577496849', 'Merhaba Ben Merve Bozkurt, \r\nSiteniz için iş başvurusunda bulunacaktım? Nereye başvurmam gerekmektedir.\r\n\r\nTeşekkür ederim.', 'Answered', '127.0.0.1', 'I will answer this request. AlpeR', NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20191028142201', '2019-10-28 14:22:10'),
('20191126160531', '2019-11-26 16:06:02'),
('20191127004611', '2019-11-27 00:46:20'),
('20191127203328', '2019-11-27 20:33:46'),
('20191129011006', '2019-11-29 01:11:03'),
('20191210232516', '2019-12-10 23:25:28'),
('20191213191734', '2019-12-13 19:17:46'),
('20191214222522', '2019-12-14 22:25:38'),
('20191218233837', '2019-12-18 23:38:55'),
('20191219001119', '2019-12-19 00:11:32');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `place`
--

CREATE TABLE `place` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `star` int(11) DEFAULT NULL,
  `adress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `detail` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `place`
--

INSERT INTO `place` (`id`, `category_id`, `title`, `keywords`, `description`, `image`, `star`, `adress`, `phone`, `fax`, `email`, `city`, `country`, `location`, `status`, `created_at`, `updated_at`, `detail`, `userid`) VALUES
(1, 14, 'Ayasofya Müzesi', 'ayasofya,müzesi', 'Bizans ve Osmanlı imparatorluklarına başkentlik yapmış İstanbul, sahip olduğu tarihi zenginlik sayesinde gezginlere çok sayıda gezilecek yer sunuyor.', '066b61fed2dc05dbaaa6d32775abffbf.jpeg', 5, 'Sultan Ahmet, Ayasofya Meydanı, 34122 Fatih/İstanbul', NULL, NULL, 'ayasofya@gmail.com', 'Istanbul', 'Turkiye', NULL, 'True', NULL, NULL, '<h1>MİMARLIK TARİHİNİN BAŞYAPITI</h1>\r\n\r\n<p>Yenilik&ccedil;i mimarisi, zengin tarihi, dini &ouml;nemi ve olağan&uuml;st&uuml; &ouml;zelliğiyle y&uuml;zyıllardır zamana direnen Ayasofya; İstanbul&#39;daki en b&uuml;y&uuml;k Doğu Roma kilisesi. Aynı yerde &uuml;&ccedil; kez inşa edilen, d&uuml;nyanın en eski ve hızlı tamamlanmış katedrali. Havada asılı gibi duran baş d&ouml;nd&uuml;r&uuml;c&uuml; kubbesi, yekpare mermer s&uuml;tunları ve eşsiz mozaikleriyle mimarlık tarihinin başyapıtlarından.</p>\r\n\r\n<p><strong>OSMANLI D&Ouml;NEMİNDE CAMİİ OLARAK VARLIĞINI S&Uuml;RD&Uuml;RD&Uuml;</strong></p>\r\n\r\n<p>Bug&uuml;nk&uuml; Ayasofya aynı yerde &ouml;ncekilerinden farklı bir mimari anlayışla yapılan &uuml;&ccedil;&uuml;nc&uuml; yapı. İmparator Justinianus tarafından Tralles&rsquo;li(Aydın) Anthemios ve Miletos&rsquo;lu (Balat) Isidoros&#39;a yaptırıldı. Yapımına 532 yılında başlandı ve beş yıl gibi bir s&uuml;rede bitirilerek, 537&#39;de b&uuml;y&uuml;k bir t&ouml;renle ibadete a&ccedil;ıldı. İstanbul&#39;un Fatih Sultan Mehmed tarafından fethiyle camii olarak yeniden d&uuml;zenlendi. Varlığını Osmanlı mimari unsuru eklemeleriyle s&uuml;rd&uuml;rd&uuml; ve 1935&#39;te de m&uuml;zeye d&ouml;n&uuml;şt&uuml;. İmparator Kapısı, G&uuml;zel Kapı ve Mermer Kapı&rsquo; larıyla tanınan Ayasofya&#39;da bir kısmı antik şehirlerden getirilen toplam 104 s&uuml;tun bulunuyor. İmparatorların ta&ccedil; giydikleri &quot;Omphalion&rdquo; b&ouml;l&uuml;m&uuml; de, bu s&uuml;tunlar gibi mermer iş&ccedil;iliğiyle &ouml;ne &ccedil;ıkıyor.</p>\r\n\r\n<p><strong>MOZAİKLERDEN VAAZ K&Uuml;RS&Uuml;LERİNE KADAR G&Ouml;R&Uuml;LMEYE DEĞER</strong></p>\r\n\r\n<p>Huşu uyandıran mimarisi dışında; altın kaplama, g&uuml;m&uuml;ş kaplama, cam, pişmiş toprak ve renkli taşla yapılan mozaikleriyle de &uuml;nl&uuml;. 6. y&uuml;zyıla ait orijinal tavan mozaikleri bitkisel ve geometrik motifleriyle b&uuml;y&uuml;l&uuml;yor. 8. &uuml;zyıldaki ikona yasağından sonraki fig&uuml;rl&uuml; mozaiklerden de, kucağında &ccedil;ocuk İsa ile tasvir edilen Hz. Meryem, Hz. Cebrail, Hz. Mikail ve Vazftizci Yahya İle Deisis Sahnesi mozaikleri mutlaka g&ouml;r&uuml;lmeli. Sultan Abd&uuml;lmecid&rsquo;in Mozaik Tuğrası ise 1847-1849 arası Fossati Kardeşlerin onarımları sırasında yaptırılmış.</p>\r\n\r\n<p>Osmanlı d&ouml;neminde eklenen sekiz b&uuml;y&uuml;k yuvarlak hat levha, Sultan Abd&uuml;lmecid d&ouml;neminde &uuml;nl&uuml; hattat Kadıasker Mustafa İzzet Efendi&#39;nin eseri. Yan neflerdeki iki adet yekpare mermerden yapılmış ve ortalama 1250 litre sıvı alabilen k&uuml;pler, Sultan III. Murad d&ouml;neminde Bergama antik şehrinden getirildi. Sultan Mahmud K&uuml;t&uuml;phanesi&#39;nin yanı sıra minber, mihrap, h&uuml;nkar mahfili ve vaaz k&uuml;rs&uuml;leri de g&ouml;r&uuml;lmeye değer.</p>\r\n\r\n<p><strong>HAZIR GELMİŞKEN</strong></p>\r\n\r\n<p>Ayasofya M&uuml;zesi&#39;nin i&ccedil;i kadar dış mekanları da meşhur. Binanın dışındaki Padişah T&uuml;rbeleri&rsquo;yse ziyaret edilmesi gerekenler arasında ilk sırada. Burada saltanat d&ouml;nemleri birbirini izleyen Sultan II. Selim, Sultan III. Murad, Sultan III. Mehmed ile Sultan I. Mustafa ve Sultan İbrahim t&uuml;rbeleri ile Şehzadeler T&uuml;rbesi bulunuyor. Ayasofya&#39;nın ikisini Mimar Sinan&rsquo;ın yaptığı bilinen d&ouml;rt minaresi, Sıbyan Mektebi şadırvanı, muvakkithanesi, sebilleri, payandaları, hazine binası ve imarethanesi de yapının ihtişamını artırıyor.</p>', NULL),
(2, 16, 'Kristal Cam Teras', 'kristal,cam,teras,safranbolu', 'Kristal Cam Teras', '7936c847d751724c943ec87b747040a1.jpeg', 1, 'İncekaya Cd., 78600 Tokatlı/Safranbolu/Karabük', '(0370) 725 19 00', '(0370) 725 19 00', 'kristalcamteras@gmail.com', 'Karabük', 'Turkiye', NULL, 'True', NULL, NULL, '<p><strong><span style=\"color:#c0392b\">Cam Teras &ndash; Kristal Teras Safran bolu olarak ta&nbsp;ge&ccedil;en bu eşsiz yer Safranbolu sınırları i&ccedil;erisinde adrenalin dolu bir seyir şansınız var desek ne d&uuml;ş&uuml;n&uuml;rs&uuml;n&uuml;z?&nbsp;Koca bir dağın tepesinden b&ouml;ylesine heyecan dolu bir seyir i&ccedil;in &ccedil;ok da uzak &uuml;lkelere gitmeye gerek yok. Ağa&ccedil;lı ve bol virajlı yolları aşmanız ilk aşama i&ccedil;in yeterli.&nbsp;Benzerlerinin Arizona ve G&uuml;rcistan&rsquo;da olduğu Safranbolu İncekaya Kanyonu &uuml;zerinde kurulu cam terasın yapımı 1 ay kadar kısa bire s&uuml;re i&ccedil;erisinde ger&ccedil;ekleşti.&nbsp;Sadece tarihi evleri ile adını duyuran ve Unesco tarafından miras listesine giren Safranbolu, artık Kristal Terası ile de yerli ve yabancı turistlerin dikkatini &ccedil;ekmekte.</span></strong></p>', NULL),
(3, 13, 'Hadrianapolis Antik Kenti', 'Hadrianapolis Antik Kenti', 'Hadrianapolis Antik Kenti', '1500f25bb22e77a21ec5d83bc165aefc.jpeg', 5, '78400 Çaylı/Eskipazar/Karabük', NULL, NULL, NULL, 'Karabük', 'Turkiye', NULL, 'True', NULL, NULL, '<h2>Hadrianapolis Antik Kenti</h2>\r\n\r\n<h3>&nbsp;</h3>\r\n\r\n<p>Karab&uuml;k&#39;&uuml;n Eskipazar il&ccedil;e merkezine 3 kilometre uzaklıkta yer alan Hadrianapolis Antik Kenti&#39;nde yaşam Roma d&ouml;nemine kadar uzanmaktadır. M.&Ouml;. 1. y&uuml;zyılda kurulduğu ve MS 8. y&uuml;zyıla kadar yerleşim amacıyla kullanıldığı d&uuml;ş&uuml;n&uuml;len bu antik d&ouml;nem kentinde yapılan her akademik kazı &ccedil;alışmasında olduk&ccedil;a &ouml;nemli bilgiler elde edilmektedir.<br />\r\n<br />\r\nOlduk&ccedil;a zengin kalıntılara sahip olan kentte bir&ccedil;ok yapı g&uuml;n&uuml;m&uuml;ze kadar gelebilmiş ve kentte diğer antik kentlerde rastlanmayan &ouml;zelliklere rastlanmıştır. Ayrıca kazı &ccedil;alışmaları ve şehrin g&uuml;n ışığına &ccedil;ıkmamış yerleri de i&ccedil;inde bir&ccedil;ok hazineyi barındırmaktadır.<br />\r\n<br />\r\nBurada yaşayanlarla ve yaşadıkları Hadrianapolis kenti i&ccedil;in tarih kitaplarında bazı &ouml;nemli bilgiler ge&ccedil;mektedir. Bu bilgilerden biri de para basımı i&ccedil;in şehirde bir darphane kurulmuş olduğudur. Ancak darphanenin yeri şehirde bulunamamıştır.<br />\r\n<br />\r\nHadrianapolis Antik Kenti&#39;nde g&uuml;n y&uuml;z&uuml;ne &ccedil;ıkarılan yerler arasında; s&uuml;tun başlıklarını, surları, kiliseleri, kaya mezarlarını, g&ouml;zyaşı şişelerini, mahzenleri ve su sarnı&ccedil;larını sayabiliriz. T&uuml;m bunların yanında mozaikleri, s&uuml;tunları ve freskleri de şehirde &ouml;zellikle ilgi &ccedil;eken yerleri arasında g&ouml;sterilmektedir. Antik kentte ayrıca Anadolu&#39;nun en erken kilise &ouml;rneklerinde rastlanmıştır.</p>', NULL),
(4, 13, 'Güzelcehisar Kalesi', 'Güzelcehisar Kalesi', 'Güzelcehisar Kalesi', 'e1f882f51858ea833921348657f9a903.jpeg', 4, '74110 Arıönü/Bartın Merkez/Bartın', NULL, NULL, NULL, 'Karabük', 'Turkiye', 'Bartın Merkez', 'True', NULL, NULL, '<p><a href=\"https://www.neredekal.com/amasra-otelleri/\" title=\"amasra\">Amasra</a>&#39;nın&nbsp;<a href=\"https://www.neredekal.com/guzelcehisar-otelleri/\" title=\"guzelcehisar\">G&uuml;zelcehisar</a>&nbsp;K&ouml;y&uuml;&#39;nde bulunan G&uuml;zelcehisar Kalesi, Cenevizlilerden kalma bir yapı. Eskiden, tarihi Kromna Kenti&#39;nin g&ouml;zc&uuml; kalesi olarak kullanıldığı s&ouml;yleniyor.<br />\r\n<br />\r\nŞuan yapının i&ccedil;i tamamen taş oldu. Kalenin en &uuml;st tepesine &ccedil;ıktığınız zaman, G&uuml;zelcehisar K&ouml;y&uuml;&#39;n&uuml;n eşsiz manzarasıyla karşılaşıyorsunuz. Kuzey y&ouml;n&uuml;ne baktığınızda ise,&nbsp;<a href=\"https://www.neredekal.com/karadeniz/\" target=\"_blank\" title=\"Karadeniz\">Karadeniz</a>&#39;in b&uuml;y&uuml;leyici manzarası sizi hemen etkisi altına alıyor.<br />\r\n<br />\r\n1900&#39;l&uuml; yıllarda G&uuml;zelcehisar Kalesi, olduk&ccedil;a b&uuml;y&uuml;k bir yapıymış aslında. Ancak şimdilerde yalnızca tek bir burcu ayakta kalabilmiş.<br />\r\n<br />\r\nKaleye ara&ccedil;la ulaşım sağlayabilmek olduk&ccedil;a g&uuml;&ccedil;. Bu nedenle kalenin 1,5 kilometre uzağına aracınızı park edip, y&uuml;r&uuml;meniz gerekiyor.<br />\r\n<br />\r\nYolunuz Amasra&#39;ya d&uuml;şerse, G&uuml;zelcehisar Kalesi&#39;ni g&ouml;r&uuml;lecek yerler listenize eklemeyi sakın ihmal etmeyin. Şimdiden iyi tatiller dileriz.</p>', 2),
(5, 15, 'Amasra Müzesi', 'Amasra Müzesi', 'Amasra Müzesi', '797382ca4a0d37f3bd9ba2b5985f1911.jpeg', 4, 'Kum, Çamlık Sok. No:4, 74300 Amasra/Bartın', '(0378) 315 10 06', NULL, NULL, 'Karabük', 'Turkiye', 'Amasra/Bartın', 'True', NULL, NULL, '<h2>Amasra M&uuml;zesi</h2>\r\n\r\n<p><a href=\"https://www.neredekal.com/amasra-otelleri/\" title=\"amasra\">Amasra</a>&#39;daki ilk ve tek m&uuml;ze olan Amasya M&uuml;zesi, şehrin merkezinde misafirlerini ağırlamaktadır. Amasra&#39;nın 3000 yılı aşan tarihinin birer kanıtı olarak g&ouml;r&uuml;len binlerce tarihi eserin sergilendiği m&uuml;ze meraklılarının kesinlikle ziyaret etmesi gereken bir yerdir. Tarihi ve m&uuml;ze gezmeyi sevenlerin kesinlikle g&ouml;rmesi gereken arkeolojik ve etnografik eserlere ev sahipliği yapan m&uuml;zenin hikayesi, ilk zamanları olan 1955 yılında belediye binasının k&uuml;&ccedil;&uuml;k bir odasında faaliyete ge&ccedil;irilmesi ile başlamıştır. 1969 yılında ise m&uuml;ze eski bir ilkokul binasına taşınmıştır.<br />\r\n<br />\r\nG&uuml;n&uuml;m&uuml;zde ise kullanılan m&uuml;ze binası 30.01.1982 tarihinde Amasra M&uuml;zesi olarak faaliyete ge&ccedil;miştir. Amasra M&uuml;zesi&#39;nde 2 etnografik, 2 adet arkeolojik olmak &uuml;zere toplamda 4 adet sergi salonu ve 1 adet binayı &ccedil;evreleyen bah&ccedil;e bulunmaktadır. M&uuml;zenin bah&ccedil;esinde tıpkı i&ccedil;erideki salonlarda olduğu gibi Helenistik, Roma, Bizans, Ceneviz ve Osmanlı d&ouml;nemine ait eserler vardır. Ancak bah&ccedil;edeki eserler bu d&ouml;nemlere ait taş eserlerden oluşmaktadır.</p>', 2),
(6, 16, 'Amasra Ağlayan Ağaç', 'Amasra Ağlayan Ağaç', 'Amasra Ağlayan Ağaç', '63e9a05687c68eee10755b270e6e8c18.jpeg', 5, 'Boztepe, 71, Nöbethane Sk., 74300 Amasra/Ba', '(0378) 315 29 30', NULL, NULL, 'Karabük', 'Turkiye', 'Amasra/Bartın', 'True', NULL, NULL, '<h2>Amasra Ağlayan Ağa&ccedil;</h2>\r\n\r\n<h3>&nbsp;</h3>\r\n\r\n<p>Amasra Boztepe&#39;de bulunan ve i&ccedil;erisinde yer aldığı &ccedil;ay bah&ccedil;esine de ismini veren Amasra Ağlayan Ağa&ccedil;, b&ouml;lgede hem yerli hem de yabancı turistlerin en &ccedil;ok ilgisini &ccedil;eken yerlerin başında gelmektedir. Ağa&ccedil; denizden ve havadan aldığı nemi b&uuml;nyesinde tutan bir selvi ağacı olup, ilkbahar ve sonbahar aylarında yağmur damlası olarak geri vermektedir. Bu nedenle baharda bambaşka bir g&uuml;zelliğe b&uuml;r&uuml;nen Amasra Ağlayan Ağa&ccedil;, her y&ouml;n&uuml;yle seyahat planına dahil edilmeyi fazlasıyla hak etmektedir. Bu selvi ağacının yaşının ise 300 ile 350 olduğu tahmin edilmektedir.<br />\r\n<br />\r\nAmasra Ağlayan Ağa&ccedil;&#39;ın bulunduğu tepe ve dolayısıyla &ccedil;ay bah&ccedil;esi ise muhteşem bir manzaraya ev sahipliği yapmaktadır. Burada &ccedil;ayınızı yudumlarken Tavşan Adası, Atat&uuml;rk Tepesi ve B&uuml;y&uuml;k Limanı seyre dalabilir, deniz manzarası sayesinde b&uuml;t&uuml;n stresinizden bir anda uzaklaşabilirsiniz. Tam karşınızda yer alan ve tavşanlara ev sahipliği yapan Tavşan Adası&#39;nı izlemek i&ccedil;in &ccedil;ay bah&ccedil;esinden d&uuml;rb&uuml;n kiralamak da m&uuml;mk&uuml;nd&uuml;r. D&ouml;n&uuml;ş yolunda kurdukları standlarda el emeği &uuml;r&uuml;nler ve birbirinden lezzetli yiyecekler satan yerli teyzelerin hazırladığı re&ccedil;el ve bal gibi &uuml;r&uuml;nlerden satın alabilirsiniz.</p>', 2),
(7, 15, 'Roma Hamamı Açık Hava Müzesi', 'Roma Hamamı Açık Hava Müzesi', 'Roma Hamamı Açık Hava Müzesi', '9144ee92fcaa395745294f01eca73631.jpeg', 5, NULL, NULL, NULL, NULL, 'Ankara', 'Turkiye', 'Çankırı', 'True', NULL, NULL, '<h2>Roma Hamamı A&ccedil;ık Hava M&uuml;zesi</h2>\r\n\r\n<h3>&nbsp;</h3>\r\n\r\n<p>Ankara&#39;nın Ulus semtinde ziyaret&ccedil;ilerini bekleyen Roma Hamamı A&ccedil;ık Hava M&uuml;zesi, Ulus Meydanı&#39;ndan Yıldırım Beyazıt Meydanı&#39;na uzanan &Ccedil;ankırı Caddesi &uuml;zerinde, Ulus&#39;tan itibaren yaklaşık 400 metre mesafede, caddeden 2,5 metre y&uuml;kseklikte konumlanıyor. 3. y&uuml;zyılda Septimius Severes&#39;un oğlu Roma İmparatoru Caracalla tarafından inşa ettirilen Roma Hamamı A&ccedil;ık Hava M&uuml;zesi, Sağlık Tanrısı Asklepion adına yaptırılmış.<br />\r\n<br />\r\nG&uuml;n&uuml;m&uuml;zde Roma Hamamı A&ccedil;ık Hava M&uuml;zesi olarak ziyaret edilen bu platformun ge&ccedil;mişte bir h&ouml;y&uuml;k olduğu tespit edilmiş. M&uuml;zenin en &uuml;st&uuml;nde &ccedil;oğunluğu Roma d&ouml;nemine, kısmen ise Bizans ve Sel&ccedil;uklu d&ouml;nemine, alt kısmında ise Frig devrine ait kalıntılar elde edilmiş.<br />\r\n<br />\r\n80 x 130 metre boyutlarında olan Roma Hamamı A&ccedil;ık Hava M&uuml;zesi, taş ve tuğladan inşa edilmiş. M&uuml;zenin &Ccedil;ankırı Caddesi&#39;ndeki girişi, s&uuml;tunlu bir revak kalıntısının &ccedil;evrelediği geniş bir alana yayılıyor. Aynı zamanda buradan Palaestra olarak adlandırılan beden eğitimi ve g&uuml;reş yapılan b&ouml;lgeye de giriliyor. Bu b&ouml;l&uuml;m&uuml;n sağ tarafındaki s&uuml;tunlu yolun &uuml;zerinde ise d&ouml;rt k&ouml;şeli ve yuvarlak pek &ccedil;ok yazılı s&uuml;tun yer alıyor.<br />\r\n<br />\r\nOlur da bir g&uuml;n yolunuz Ankara&#39;ya d&uuml;şerse eğer, Roma Hamamı A&ccedil;ık Hava M&uuml;zesi&#39;ni de ziyaret etmeyi unutmayın. M&uuml;zeyi; 15 Nisan-2 Ekim tarihleri arasında 08.30-19.00, 3 Ekim-14 Nisan tarihleri arasında ise 08.30-17.00 saatleri arasında ziyaret edebilirsiniz. M&uuml;zeye giriş &uuml;creti ise 5 TL. Şimdiden keyifli bir tatil ge&ccedil;irmenizi dileriz.</p>', 1),
(8, 13, 'Eğriova Göleti', 'Eğriova Göleti', 'Eğriova Göleti', '67b887606d19511991bb20fd07cda63b.jpeg', 5, NULL, NULL, NULL, NULL, 'Karabük', 'Turkiye', 'Yenice', 'True', NULL, NULL, '<p>Eğriova G&ouml;leti, Batı Karadeniz&#39;in en y&uuml;ksek tepesi olan (1999 metre) Keltepe mevkiinde yer alan suni bir g&ouml;let. Uzunluğu hemen hemen 1 km olarak g&ouml;letin derinliği ise tam 7 metre.</p>\r\n\r\n<p>Yenice Ormanları&#39;nda y&uuml;r&uuml;y&uuml;ş yaparken karşınıza &ccedil;ıkabilecek nadide g&uuml;zelliklerden biri Eğriova G&ouml;leti. Doğa y&uuml;r&uuml;y&uuml;şlerinin en can alıcı noktalarından biri olan bu g&ouml;let, doğaseverlere adeta g&ouml;rsel bir ş&ouml;len yaşatıyor diyebiliriz.</p>\r\n\r\n<p>Ge&ccedil;tiğimiz aylarda i&ccedil;erisine bırakılan 20.000 alabalık ile balık avı i&ccedil;in de tercih edilen Eğriova G&ouml;leti&#39;nde bir de kamp alanı bulunuyor. Doğayla kucaklaşmak deyiminin ger&ccedil;eğe d&ouml;n&uuml;şt&uuml;ğ&uuml; bir yer olan Eğriova G&ouml;leti, fotoğraf tutkunlarının da yegane adreslerinden biri.</p>\r\n\r\n<p>Eğer yolunuz Karab&uuml;k&#39;e d&uuml;şerse, Eğriova G&ouml;leti&#39;ni de mutlaka g&ouml;r&uuml;n. Şimdiden keyifli bir tatil ge&ccedil;irmenizi dileriz.</p>', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtpserver` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtpemail` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtppassword` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtpport` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aboutus` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `setting`
--

INSERT INTO `setting` (`id`, `title`, `keywords`, `description`, `company`, `adress`, `phone`, `fax`, `email`, `smtpserver`, `smtpemail`, `smtppassword`, `smtpport`, `facebook`, `instagram`, `twitter`, `aboutus`, `contact`, `reference`, `status`) VALUES
(1, 'Türkiye\'nin En iyi Turistik Mekan Sayfası - NereyeGitmeliyim.com', 'NereyeGitmeliyim.com', 'turistik mekan,turizm,Türkiye\'nin en iyi turistik mekan beğenme sitesi', 'NereyeGitmeliyim.com A.Ş', 'Gelibolu/Çanakkale', '05074764396', '05074764396', 'alperkyc17@gmail.com', 'smtp.nereyegitmeliyim.com', 'placeprojecttest@gmail.com', 'a114274xx', '578', 'https://www.facebook.com/TheLyEmpathy', 'https://www.instagram.com/alperkyc/', 'https://twitter.com/AIperKyc', '<h2>HAKKIMIZDA</h2>\r\n\r\n<p>T&uuml;rkiye&#39;nin en b&uuml;y&uuml;k turizm portallarından NereyeGitmeliyim.com, 2004 yılından itibaren milyonlarca kişiye tatil servisi sunarak m&uuml;şteri memnuniyetine verdiği &ouml;nemi ortaya koymuştur. Turizm alanında kazanmış olduğu deneyime dayanarak 2012 yılından itibaren NereyeGitmeliyim.com Kurumsal olarak deneyimli ekibiyle firmalara &ouml;zel hizmet vermektedir.</p>\r\n\r\n<h2>NEDEN NereyeGitmeliyim.com ?</h2>\r\n\r\n<ul>\r\n	<li>D&uuml;nya &ccedil;apında avantajlı otel ve bilet fiyatlarına g&uuml;venle ve hızla ulaşılabilirlik</li>\r\n	<li>M&uuml;şteri y&ouml;netim danışmanlığı; seyahat ve organizasyon olgusunu her ayrıntısıyla bilen, yeniliklerden haberdar, işinde uzman, deneyimli ve dinamik bir ekip olmamız.</li>\r\n	<li>Partner firmalarımızın işini hızlandıracak-kolaylaştıracak, m&uuml;şterimize maliyet kontrol&uuml; ve beraberinde tasarruf sağlayacak gerekli verileri raporlayabilme becerimiz</li>\r\n	<li>Hizmet kalitesinde denge ve s&uuml;reklilik</li>\r\n	<li>İş ortağı olarak g&ouml;rd&uuml;ğ&uuml;m&uuml;z k&ouml;kl&uuml; ve değerli m&uuml;şteri portf&ouml;y&uuml;m&uuml;z&uuml;n olması</li>\r\n	<li>M&uuml;şteri memnuniyeti kaynaklı, iş ortaklarımızın her ge&ccedil;en g&uuml;n artması</li>\r\n</ul>\r\n\r\n<h2>EKİBİMİZ</h2>\r\n\r\n<p>Gen&ccedil;, dinamik ve m&uuml;şteri memnuniyeti odaklı ekibimizle her ge&ccedil;en g&uuml;n b&uuml;y&uuml;meye devam ediyoruz.</p>\r\n\r\n<h2>KARİYER</h2>\r\n\r\n<p>Sekt&ouml;r&uuml;n&uuml;n lider kuruluşlarından NereyeGitmeliyim.com Kurumsal olarak; insan ilişkileri g&uuml;&ccedil;l&uuml;, yaratıcı, yeniliklere a&ccedil;ık, s&uuml;rekli gelişime ve verimliliğe odaklanan, rekabet&ccedil;i, ekip &ccedil;alışmasını seven ve m&uuml;şteri memnuniyeti odaklı &ccedil;alışabilecek yeni ekip arkadaşlarımızı aramızda g&ouml;rmekten mutluluk duyarız.</p>', '<h1>Contact</h1>\r\n\r\n<h4>We&#39;re here to help. We&rsquo;re here to help, whenever you need us.</h4>\r\n\r\n<p>You can get more information about your line from 444 1 500 TT Mobil Customer Care Services.</p>\r\n\r\n<p>Head Office</p>\r\n\r\n<p>Abdi İpek&ccedil;i Cad. No:75 34367</p>\r\n\r\n<p>Ma&ccedil;ka / İstanbul</p>', '<h3>What are Reference Sites?</h3>\r\n\r\n<p>Reference Sites are inspirational&nbsp;<strong>ecosystems</strong>, delivering creative and workable solutions that improve the lives and health of older people and the whole community.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Reference Sites are&nbsp;<strong>regions, cities</strong>, integrated hospitals or care organisations and their&nbsp;<strong>quadruple helix</strong>&nbsp;partners from industry, civil society, academia and government authorities that focus on a&nbsp;<strong>comprehensive, innovation-based approach</strong>&nbsp;to active and healthy ageing. They offer concrete examples of their positive&nbsp;<strong>impact</strong>&nbsp;in this field.</p>\r\n\r\n<p>In the 2019 Call for Reference Sites,&nbsp;<a href=\"https://ec.europa.eu/eip/ageing/news/77-regional-and-local-organisations-are-awarded-reference-site-status-results-2019-call_en\">77 regional and local organisations</a>&nbsp;were awarded Reference Site status.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>They are leading regional organisations committed to&nbsp;<strong>investing in innovation for active and healthy ageing</strong>&nbsp;and supporting the transfer and&nbsp;<strong>scaling-up</strong>&nbsp;of that innovation across Europe.&nbsp;</p>', 'True');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ;

--
-- Tablo döküm verisi `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`, `surname`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'alperkyc17@gmail.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$eW9OeVZ3MUpKcjRRU3lLTQ$SvHKjw+Jhqg0EywTPdshdu9VZvfOAjRo0sUBP5NnN3g', 'ALPER', 'KUYUCU', 'b502822969901ddeea1d9733e1f6f92a.png', 'True', NULL, NULL),
(2, 'user@user.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$c3pwV3A1VXZXNFVrUjg5OQ$2Pw1D434REsiFyEs314GnLbK2HvKD19CXJsz4pxfmIo', 'user', 'user', '9ca9ff329de25a0f810a7f233cad420a.png', 'True', NULL, NULL),
(3, 'test2@gmail.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$OUlkNkF5QS5EdTIxMFcxZQ$cBCdAV33jb5BHFZ6mRK642t/MqtOjvoVkdKSbj5JtH8', 'test2', 'test2', 'b646724249bd406a6c467c5b1824b9bf.png', 'True', NULL, NULL),
(4, 'user2@user.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$MlMzbTF1WTdFN1VVMW54Qg$o6i19Gy8QFxdh3llRcaHvJKO2s0vblzMjC+5qgPZNEI', 'user2', 'KUYUCU', '00e5c1ceccf14167e6ebaa475a4bb79e.png', 'True', NULL, NULL),
(5, 'deneme@deneme.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$YWFjRzgyTmE1UWRHbVBrdA$9aXxoJCVWuqo17G9uK3uKjMx6Mq8XXonMb1hHdQLEiI', 'deneme', 'deneme', 'ff3f012887bb3513896d2f389b92d6b9.png', 'True', NULL, NULL),
(6, 'deneme5@gmail.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$YUtwNmFCLnVsTk9aQ3lLUg$SePnIY+hk42wtbDRwAN3PnGSzwZxWn5FlKLj+YGFbAw', 'deneme5', 'deneme6', '5cd47babf5ac3093817380a9e17d6563.png', 'True', NULL, NULL),
(7, 'test6', '[]', '$argon2id$v=19$m=65536,t=4,p=1$TUs2NlV3ejlycEtBU2JuLw$/CHQtVsR/Q9oAwRhkEIisCRoi61fY+2ReDaw4zvX528', 'Alper', 'Kuyucu', '0151620b174aec059895a3636b912b73.png', 'True', NULL, NULL),
(8, 'aaaaa@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$TGJpMEsxQzQ4M29NbzFNSg$ap6VBobPVsHiJsQX74kClR9+PvTPJ4Ub17pwVZ0vN/Y', 'aaa', 'aaa', '1d54743cf5f6d9c33c39d24d73ae5136.png', 'True', NULL, NULL),
(9, 'test10@test10.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$QUxzWU4uTXBkeVhTcklrMA$NG1iZ3+e5GxuCw9g8wM7nlDXixH4ZoWKoLJp9clG1bM', 'test10', 'test10', 'e2005c94dc455222e4cf0c8ea2cee89a.png', 'True', NULL, NULL);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C53D045FDA6A219` (`place_id`);

--
-- Tablo için indeksler `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Tablo için indeksler `place`
--
ALTER TABLE `place`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_741D53CD12469DE2` (`category_id`);

--
-- Tablo için indeksler `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Tablo için AUTO_INCREMENT değeri `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Tablo için AUTO_INCREMENT değeri `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Tablo için AUTO_INCREMENT değeri `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Tablo için AUTO_INCREMENT değeri `place`
--
ALTER TABLE `place`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Tablo için AUTO_INCREMENT değeri `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `FK_C53D045FDA6A219` FOREIGN KEY (`place_id`) REFERENCES `place` (`id`);

--
-- Tablo kısıtlamaları `place`
--
ALTER TABLE `place`
  ADD CONSTRAINT `FK_741D53CD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
