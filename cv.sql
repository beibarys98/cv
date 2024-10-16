-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: cv-mysql-1
-- Generation Time: May 29, 2024 at 12:47 PM
-- Server version: 5.7.44
-- PHP Version: 8.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yii2advanced`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `user_id`) VALUES
(1, 116);

-- --------------------------------------------------------

--
-- Table structure for table `club`
--

CREATE TABLE `club` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `club` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `date`
--

CREATE TABLE `date` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `degree`
--

CREATE TABLE `degree` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `degree` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discipline`
--

CREATE TABLE `discipline` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `discipline` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `education` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `interest`
--

CREATE TABLE `interest` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `interest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mail`
--

CREATE TABLE `mail` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `mail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1713850142),
('m130524_201442_init', 1713850146),
('m190124_110200_add_verification_token_column_to_user_table', 1713850146);

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

CREATE TABLE `photo` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prize`
--

CREATE TABLE `prize` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prize` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `publication`
--

CREATE TABLE `publication` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publication` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qualification`
--

CREATE TABLE `qualification` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `qualification` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `auth_key`, `password_hash`) VALUES
(1, 'Ахан Бекежан', 'ahan_bekejan', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(2, 'Жанпеисова Назия Маденовна', 'janpeisova_naziia', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(3, 'Асан Жұманазар ', 'asan_jumanazar', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(4, 'Асадуллин Раиль Мирваевич', 'asadullin_rail', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(5, 'Исакулов Баизак Разакович', 'isakulov_baizak', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(6, 'Құлнияз Серік Сағынұлы', 'qulniiaz_serik', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(7, 'Лыгина Ольга Ивановна', 'lygina_olga', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(8, 'Кайракбаев Аят Крымович', 'kairakbaev_aiat', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(9, 'Телибекова Ирина Мендигереевна', 'telibekova_irina', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(10, 'Телибеков Бакытбек Арыкбаевич', 'telibekov_bakytbek', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(11, 'Уразгалиева Маржан Абдешевна', 'urazgalieva_marjan', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(12, 'Сұлтамұрат Гүлмира Изатуллақызы', 'sultamurat_gulmira', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(13, 'Майдангалиева Жумагуль Алдияровна', 'maidangalieva_jumagul', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(14, 'Саммерс Данна Гадылшаевна', 'sammers_danna', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(15, 'Сайтбеков Нурбол Доктарбаевич', 'saitbekov_nurbol', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(16, 'Балымов Ерлан Куанышевич ', 'balymov_erlan', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(17, 'Султанов Нурболат Ныгметович', 'sultanov_nurbolat', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(18, 'Балмагамбетова Венера Максатовна', 'balmagambetova_venera', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(19, 'Бактыгалиева Асемгул Темирхановна', 'baktygalieva_asemgul', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(20, 'Жакыпова Акмарал Жумабаевна', 'jakypova_akmaral', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(21, 'Гусенов Искандер Шахсаванович', 'gusenov_iskander', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(22, 'Төлеутай Гаухар       ', 'toleutai_gauhar', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(23, 'Макатов Дархан Кайратович', 'makatov_darhan', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(24, 'Джумабаев Мурат Давлетович', 'djumabaev_murat', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(25, 'Даев Жанат Ариккулович', 'daev_janat', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(26, 'Усов Анатолий Владимирович', 'usov_anatolii', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(27, 'Жумагамбетов Серик Смагулович', 'jumagambetov_serik', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(28, 'Кульбаева Бакит Сагиндыковна', 'kulbaeva_bakit', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(29, 'Калимухашева Багит Демеуовна', 'kalimuhasheva_bagit', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(30, 'Балабаева Айымкуль Идрисовна', 'balabaeva_aiymkul', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(31, 'Қондыбай Күлшат Әбдіғанымқызы', 'qondybai_kulshat', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(32, 'Исина Жаннур Аманкелдиевна', 'isina_jannur', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(33, 'Ниязова Гайша Мухамбетовна', 'niiazova_gaisha', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(34, 'Тлеуова Акмоншак Зархомкызы', 'tleuova_akmonshak', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(35, 'Нуржанова Мария Нарымбаевна', 'nurjanova_mariia', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(36, 'Жубанова Ардак Есетовна', 'jubanova_ardak', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(37, 'Куспаева Райхан Булешевна ', 'kuspaeva_raihan', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(38, 'Батурина Оксана Сергеевна', 'baturina_oksana', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(39, 'Коптлеуова Кулпаш Балапановна', 'koptleuova_kulpash', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(40, 'Садыкова Гузель Зуфаровна', 'sadykova_guzel', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(41, 'Екибаева Нинель Амантурлиевна', 'ekibaeva_ninel', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(42, 'Шукурова Бибигайша Максутовна', 'shukurova_bibigaisha', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(43, 'Курманкулова Роза Жумагазиевна', 'kurmankulova_roza', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(44, 'Кайыргалиева Майра Гайноллаевна', 'kaiyrgalieva_maira', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(45, 'Шукуров Адиетулла Кадилжанович', 'shukurov_adietulla', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(46, 'Баймукашева Жанымгуль Зулкарнаевна', 'baimukasheva_janymgul', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(47, 'Калаганова Нурсулу Кыдыровна', 'kalaganova_nursulu', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(48, 'Бухарбаев Шыныбек Мусинович', 'buharbaev_shynybek', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(49, 'Аханов Серик Бекежанович', 'ahanov_serik', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(50, 'Куанов Асылбек Ондасынович', 'kuanov_asylbek', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(51, 'Нигматулин Артур Юсуфович', 'nigmatulin_artur', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(52, 'Сулейменов Базарбай', 'suleimenov_bazarbai', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(53, 'Айжариков Турикпенбай Жубанович', 'aijarikov_turikpenbai', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(54, 'Дадин Акилбек Дадинович', 'dadin_akilbek', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(55, 'Есенгалиев Данияр Куанышкалиевич ', 'esengaliev_daniiar', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(56, 'Изтлеуова Гульнара Курбанклычевна', 'iztleuova_gulnara', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(57, 'Кадырбаев Куандык Сарсенович', 'kadyrbaev_kuandyk', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(58, 'Балмаганбетова Фатыма Турегалиевна', 'balmaganbetova_fatyma', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(59, 'Бисалиев Ибрай ', 'bisaliev_ibrai', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(60, 'Тулепбергенов Caгын Kуaнышович ', 'tulepbergenov_cagyn', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(61, 'Аяганова Алия Жумабаевна', 'aiaganova_aliia', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(62, 'Бекетов Галымжан Шакирович', 'beketov_galymjan', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(63, 'Беркешева Асель Салимжановна ', 'berkesheva_asel', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(64, 'Алдамжаров Нұрлан Нұрмашұлы', 'aldamjarov_nurlan', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(65, 'Усенкова Елена Юрьевна', 'usenkova_elena', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(66, 'Исина Шынар Амангельдиевна', 'isina_shynar', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(67, 'Жумаганбетова Бакыт Тенилбайкызы', 'jumaganbetova_bakyt', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(68, 'Бекжанова Данагүл Бекболатқызы ', 'bekjanova_danagul', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(69, 'Жубантаева Жанар Кадырбергеновна', 'jubantaeva_janar', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(70, 'Сәубет Эльвира Берікқызы', 'saubet_ielvira', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(71, 'Жолмурзаева Райхан Байсалбаевна', 'jolmurzaeva_raihan', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(72, 'Пилипенко Елена Николаевна', 'pilipenko_elena', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(73, 'Сабирова Нагима Жамбыловна ', 'sabirova_nagima', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(74, 'Жаксыбаева Кунзиба Капеновна', 'jaksybaeva_kunziba', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(75, 'Бекжанова Жадыра Амантаевна', 'bekjanova_jadyra', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(76, 'Тарасенко Марина Юрьевна', 'tarasenko_marina', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(77, 'Сайынова Гүлім Ергенқызы ', 'saiynova_gulim', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(78, 'Қазақстанова Гүлназ Қуанышқызы', 'qazaqstanova_gulnaz', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(79, 'Шахмерден Ақниет Ғанисламұлы', 'shahmerden_aqniet', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(80, 'Кубанова Дана Байтоковна', 'kubanova_dana', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(81, 'Ахметова Эльвира Ерболатовна', 'ahmetova_ielvira', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(82, 'Ержанова Зарина Кабидоллаевна', 'erjanova_zarina', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(83, 'Калмагамбетова Сагира Райхановна', 'kalmagambetova_sagira', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(84, 'Мухамедьярова Алия Рамазановна', 'muhamediarova_aliia', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(85, 'Кабижанова Жадыра Маратовна', 'kabijanova_jadyra', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(86, 'Кумаров Нурлан Амангельдиевич', 'kumarov_nurlan', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(87, 'Акбаров Галымжан Сагымбаевич', 'akbarov_galymjan', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(88, 'Сарбаев Думан Даулетович', 'sarbaev_duman', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(89, 'Ситинова Лаура Тулешевна', 'sitinova_laura', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(90, 'Саматова Динара Қайратқызы', 'samatova_dinara', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(91, 'Масабаева Айнур Нагимовна', 'masabaeva_ainur', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(92, 'Кожабергенова Асстрагуль Бакытжановна', 'kojabergenova_asstragul', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(93, 'Шарипова Айгерим Аманбайкызы', 'sharipova_aigerim', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(94, 'Габдушева Алмагуль Сериковна', 'gabdusheva_almagul', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(95, 'Сундетова Алмагуль Рауловна', 'sundetova_almagul', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(96, 'Токсанбаева Бакытгул Айтбаевна', 'toksanbaeva_bakytgul', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(97, 'Шопанова Гульжан Ережеповна', 'shopanova_guljan', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(98, 'Нурғазы Лаура Куанышбекқызы ', 'nurgazy_laura', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(99, 'Қалиева Айман Ақниетқызы', 'qalieva_aiman', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(100, 'Жанпейсова Құндыз Әсімбекқызы', 'janpeisova_qundyz', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(101, 'Сартабанова Асем Абдимуратовна', 'sartabanova_asem', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(102, 'Имангазина Назерке Абидуллаевна', 'imangazina_nazerke', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(103, 'Тажиева Гулден Нуржановна', 'tajieva_gulden', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(104, 'Даулетова Салтанат Саденовна', 'dauletova_saltanat', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(105, 'Насипкалиева Айнур Тулебаевна', 'nasipkalieva_ainur', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(106, 'Отарбай Самал Отарбайқызы', 'otarbai_samal', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(107, 'Конысбаева Жанна Онгаровна', 'konysbaeva_janna', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(108, 'Шалабаева Сауле Изтлеуовна ', 'shalabaeva_saule', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(109, 'Шлапак Елена Юрьевна', 'shlapak_elena', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(110, 'Зарманов Сафиулла Дунисович', 'zarmanov_safiulla', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(111, 'Меркашев Кадирбек', 'merkashev_kadirbek', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(112, 'Шампиков  Хаиржан Джамалович ', 'shampikov_hairjan', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(113, 'Умарова Гулжан Нурсеитовна', 'umarova_guljan', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(114, 'Изимова Гулбаршин Калабаевна', 'izimova_gulbarshin', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(115, 'Ермагамбетова Жанылдык Жанаковна', 'ermagambetova_janyldyk', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C'),
(116, 'admin', 'admin', '715aCPy_zGRLLv5br0T47Mq-Dxpq36Gv', '$2y$13$2As8odkpcB0dS7HsW36/EuInZLAUKeL9cq33vIpaLNjONIqngXI3C');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `club`
--
ALTER TABLE `club`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `date`
--
ALTER TABLE `date`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `degree`
--
ALTER TABLE `degree`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `discipline`
--
ALTER TABLE `discipline`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `interest`
--
ALTER TABLE `interest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `mail`
--
ALTER TABLE `mail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `prize`
--
ALTER TABLE `prize`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `publication`
--
ALTER TABLE `publication`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `qualification`
--
ALTER TABLE `qualification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `club`
--
ALTER TABLE `club`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `date`
--
ALTER TABLE `date`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `degree`
--
ALTER TABLE `degree`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `discipline`
--
ALTER TABLE `discipline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `interest`
--
ALTER TABLE `interest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mail`
--
ALTER TABLE `mail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `photo`
--
ALTER TABLE `photo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prize`
--
ALTER TABLE `prize`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `publication`
--
ALTER TABLE `publication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qualification`
--
ALTER TABLE `qualification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `club`
--
ALTER TABLE `club`
  ADD CONSTRAINT `club_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `date`
--
ALTER TABLE `date`
  ADD CONSTRAINT `date_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `degree`
--
ALTER TABLE `degree`
  ADD CONSTRAINT `degree_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `discipline`
--
ALTER TABLE `discipline`
  ADD CONSTRAINT `discipline_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `education`
--
ALTER TABLE `education`
  ADD CONSTRAINT `education_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `interest`
--
ALTER TABLE `interest`
  ADD CONSTRAINT `interest_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `job_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `mail`
--
ALTER TABLE `mail`
  ADD CONSTRAINT `mail_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `prize`
--
ALTER TABLE `prize`
  ADD CONSTRAINT `prize_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `publication`
--
ALTER TABLE `publication`
  ADD CONSTRAINT `publication_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `qualification`
--
ALTER TABLE `qualification`
  ADD CONSTRAINT `qualification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
