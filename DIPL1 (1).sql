-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 28 2025 г., 10:03
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `DIPL1`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Fakultet`
--

CREATE TABLE `Fakultet` (
  `idFakultet` int NOT NULL COMMENT 'Номер факультета',
  `name` varchar(45) NOT NULL COMMENT 'Название факультета'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Fakultet`
--

INSERT INTO `Fakultet` (`idFakultet`, `name`) VALUES
(11, 'Инженерный факультет'),
(12, 'Факультет информационных технологий'),
(13, 'Экономический факультет'),
(14, 'Гуманитарный факультет');

-- --------------------------------------------------------

--
-- Структура таблицы `FioRassilki`
--

CREATE TABLE `FioRassilki` (
  `idFioRassilki` int NOT NULL,
  `dolzhnost` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `FioRassilki`
--

INSERT INTO `FioRassilki` (`idFioRassilki`, `dolzhnost`) VALUES
(1, 'Менеджер по продажам'),
(2, 'Главный бухгалтер'),
(3, 'Системный администратор'),
(4, 'Юрист'),
(5, 'Директор по маркетингу'),
(6, 'Инженер-программист'),
(7, 'HR-менеджер'),
(8, 'Офис-менеджер'),
(9, 'Аналитик данных'),
(10, 'Руководитель отдела разработки');

-- --------------------------------------------------------

--
-- Структура таблицы `Instruct`
--

CREATE TABLE `Instruct` (
  `idInstruct` int NOT NULL,
  `file` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Instruct`
--

INSERT INTO `Instruct` (`idInstruct`, `file`) VALUES
(1, 'instruct_po_tehnike_bezopasnosti.pdf'),
(2, 'instruct_po_pozharnoy_bezopasnosti.docx'),
(3, 'instruct_po_ekspluatacii_oborudovaniya.pdf'),
(4, 'instruct_po_ohrane_truda.doc'),
(5, 'instruct_po_rabote_s_kompyuterom.pdf'),
(6, 'instruct_po_provedeniyu_instruktazha.docx'),
(7, 'instruct_po_organizacii_rabochego_mesta.pdf'),
(8, 'instruct_po_ispolzovaniyu_sistemy_bezopasnosti.pdf'),
(9, 'instruct_po_sanitarnym_normam.doc'),
(10, 'instruct_po_ekologicheskim_trebovaniyam.pdf');

-- --------------------------------------------------------

--
-- Структура таблицы `Ispdn`
--

CREATE TABLE `Ispdn` (
  `idIspdn` int NOT NULL,
  `nomer` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Ispdn`
--

INSERT INTO `Ispdn` (`idIspdn`, `nomer`) VALUES
(1, '12345'),
(3, '22334'),
(4, '66789'),
(2, '67890');

-- --------------------------------------------------------

--
-- Структура таблицы `Ispdn_has_Instruct`
--

CREATE TABLE `Ispdn_has_Instruct` (
  `Ispdn_idIspdn` int NOT NULL,
  `Instruct_idInstruct` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Ispdn_has_Instruct`
--

INSERT INTO `Ispdn_has_Instruct` (`Ispdn_idIspdn`, `Instruct_idInstruct`) VALUES
(3, 3),
(1, 10);

-- --------------------------------------------------------

--
-- Структура таблицы `Ispdn_has_Polozhenie`
--

CREATE TABLE `Ispdn_has_Polozhenie` (
  `Ispdn_idIspdn` int NOT NULL,
  `Polozhenie_idPolozhenie` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Ispdn_has_Polozhenie`
--

INSERT INTO `Ispdn_has_Polozhenie` (`Ispdn_idIspdn`, `Polozhenie_idPolozhenie`) VALUES
(3, 1),
(3, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `Ispdn_has_Prikaz`
--

CREATE TABLE `Ispdn_has_Prikaz` (
  `Ispdn_idIspdn` int NOT NULL,
  `Prikaz_idPrikaz` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Ispdn_has_Prikaz`
--

INSERT INTO `Ispdn_has_Prikaz` (`Ispdn_idIspdn`, `Prikaz_idPrikaz`) VALUES
(4, 3),
(2, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `Ispdn_has_ProgOb`
--

CREATE TABLE `Ispdn_has_ProgOb` (
  `Ispdn_idIspdn` int NOT NULL,
  `ProgOb_idProgOb` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Ispdn_has_ProgOb`
--

INSERT INTO `Ispdn_has_ProgOb` (`Ispdn_idIspdn`, `ProgOb_idProgOb`) VALUES
(4, 1),
(2, 7);

-- --------------------------------------------------------

--
-- Структура таблицы `Ispdn_has_Raznoe`
--

CREATE TABLE `Ispdn_has_Raznoe` (
  `Ispdn_idIspdn` int NOT NULL,
  `Raznoe_idRaznoe` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Ispdn_has_Raznoe`
--

INSERT INTO `Ispdn_has_Raznoe` (`Ispdn_idIspdn`, `Raznoe_idRaznoe`) VALUES
(2, 3),
(2, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `OrganCrypto`
--

CREATE TABLE `OrganCrypto` (
  `idOrganCrypto` int NOT NULL,
  `fio` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `OrganCrypto`
--

INSERT INTO `OrganCrypto` (`idOrganCrypto`, `fio`) VALUES
(1, 'Иванов Иван Иванович'),
(2, 'Петров Петр Петрович'),
(3, 'Сидоров Сергей Сергеевич'),
(4, 'Кузнецова Анна Викторовна'),
(5, 'Смирнов Алексей Алексеевич'),
(6, 'Васильева Ольга Николаевна'),
(7, 'Морозов Дмитрий Владимирович'),
(8, 'Федорова Елена Александровна'),
(9, 'Ковалев Артем Игоревич'),
(10, 'Григорьева Мария Сергеевна');

-- --------------------------------------------------------

--
-- Структура таблицы `PdnPerson`
--

CREATE TABLE `PdnPerson` (
  `idPdnPerson` int NOT NULL,
  `sog_obr` tinyint DEFAULT NULL COMMENT 'Согласие на обработку персональных данных (0 - нет, 1 - да)',
  `spgl_raspr` tinyint DEFAULT NULL COMMENT 'Согласие на распространение персональных данных (0 - нет, 1 - да)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `PdnPerson`
--

INSERT INTO `PdnPerson` (`idPdnPerson`, `sog_obr`, `spgl_raspr`) VALUES
(1, 1, 1),
(2, 1, 0),
(3, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `Podrazdelenie`
--

CREATE TABLE `Podrazdelenie` (
  `idPodrazdelenie` int NOT NULL COMMENT 'Номер подразделения',
  `name` varchar(45) NOT NULL COMMENT 'Название подразделения'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Podrazdelenie`
--

INSERT INTO `Podrazdelenie` (`idPodrazdelenie`, `name`) VALUES
(1, 'Отдел кадров'),
(2, 'Бухгалтерия'),
(3, 'Юридический отдел'),
(4, 'Отдел информационных технологий'),
(5, 'Отдел маркетинга'),
(6, 'Отдел продаж'),
(7, 'Отдел логистики'),
(8, 'Отдел разработки'),
(9, 'Отдел поддержки клиентов'),
(10, 'Отдел исследований и разработок');

-- --------------------------------------------------------

--
-- Структура таблицы `Polozhenie`
--

CREATE TABLE `Polozhenie` (
  `idPolozhenie` int NOT NULL,
  `file` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Polozhenie`
--

INSERT INTO `Polozhenie` (`idPolozhenie`, `file`) VALUES
(1, 'polozhenie_o_zashchite_personalnykh_dannykh.pdf'),
(2, 'polozhenie_o_rabochem_vremeni_i_otdykhe.docx'),
(3, 'polozhenie_o_poryadke_provedeniya_attestacii.pdf'),
(4, 'polozhenie_o_komandirovkakh.doc'),
(5, 'polozhenie_o_premirovanii_sotrudnikov.pdf'),
(6, 'polozhenie_o_dolzhnostnykh_instrukciyakh.docx'),
(7, 'polozhenie_o_poryadke_rassmotreniya_zhalob.pdf'),
(8, 'polozhenie_o_korporativnoy_kulture.pdf'),
(9, 'polozhenie_o_poryadke_provedeniya_sobraniy.doc'),
(10, 'polozhenie_o_finansovoy_otchetnosti.pdf');

-- --------------------------------------------------------

--
-- Структура таблицы `Prikaz`
--

CREATE TABLE `Prikaz` (
  `idPrikaz` int NOT NULL,
  `file` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Prikaz`
--

INSERT INTO `Prikaz` (`idPrikaz`, `file`) VALUES
(1, 'prikaz_o_naznachenii_direktora.pdf'),
(2, 'prikaz_o_provedenii_inventarizacii.docx'),
(3, 'prikaz_o_komandirovke_sotrudnika.pdf'),
(4, 'prikaz_o_uvolnenii_sotrudnika.doc'),
(5, 'prikaz_o_povyshenii_zarplaty.pdf'),
(6, 'prikaz_o_provedenii_obucheniya.docx'),
(7, 'prikaz_o_vvedenii_novogo_grafika_raboty.pdf'),
(8, 'prikaz_o_sokraschenii_shtata.doc'),
(9, 'prikaz_o_perevode_na_druguyu_dolzhnost.pdf'),
(10, 'prikaz_o_provedenii_sobraniya.docx');

-- --------------------------------------------------------

--
-- Структура таблицы `ProgOb`
--

CREATE TABLE `ProgOb` (
  `idProgOb` int NOT NULL,
  `file` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `ProgOb`
--

INSERT INTO `ProgOb` (`idProgOb`, `file`) VALUES
(1, 'programma_obucheniya_po_it_tehnologiyam.pdf'),
(2, 'programma_obucheniya_po_marketingu.docx'),
(3, 'programma_obucheniya_po_finansovomu_upravleniyu.pdf'),
(4, 'programma_obucheniya_po_upravleniyu_personalom.doc'),
(5, 'programma_obucheniya_po_proizvodstvennym_processam.pdf'),
(6, 'programma_obucheniya_po_analizu_dannyh.docx'),
(7, 'programma_obucheniya_po_razrabotke_softa.pdf'),
(8, 'programma_obucheniya_po_ekologicheskim_normam.pdf'),
(9, 'programma_obucheniya_po_bezopasnosti_truda.doc'),
(10, 'programma_obucheniya_po_kommunikacii_v_komande.pdf');

-- --------------------------------------------------------

--
-- Структура таблицы `Raznoe`
--

CREATE TABLE `Raznoe` (
  `idRaznoe` int NOT NULL,
  `file` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Raznoe`
--

INSERT INTO `Raznoe` (`idRaznoe`, `file`) VALUES
(1, 'raznoe_dokument_1.pdf'),
(2, 'raznoe_dokument_2.docx'),
(3, 'raznoe_dokument_3.xlsx'),
(4, 'raznoe_dokument_4.pptx'),
(5, 'raznoe_dokument_5.txt'),
(6, 'raznoe_dokument_6.pdf'),
(7, 'raznoe_dokument_7.doc'),
(8, 'raznoe_dokument_8.csv'),
(9, 'raznoe_dokument_9.xml'),
(10, 'raznoe_dokument_10.json');

-- --------------------------------------------------------

--
-- Структура таблицы `Rukovodstvo`
--

CREATE TABLE `Rukovodstvo` (
  `idRukovodstvo` int NOT NULL,
  `file` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Rukovodstvo`
--

INSERT INTO `Rukovodstvo` (`idRukovodstvo`, `file`) VALUES
(1, 'rukovodstvo_po_bezopasnosti.pdf'),
(2, 'instrukciya_po_ekspluatacii.docx'),
(3, 'rukovodstvo_po_proektu_v1.pdf'),
(4, 'tehnicheskoe_rukovodstvo.doc'),
(5, 'rukovodstvo_po_marketingu.pdf'),
(6, 'manual_po_sistemam_bezopasnosti.pdf'),
(7, 'rukovodstvo_po_upravleniyu_proektami.docx'),
(8, 'instrukciya_po_obsluzhivaniyu.pdf'),
(9, 'rukovodstvo_po_analizu_dannyh.xlsx'),
(10, 'rukovodstvo_po_organizacii_raboty.docx');

-- --------------------------------------------------------

--
-- Структура таблицы `Rukovodstvo_has_Ispdn`
--

CREATE TABLE `Rukovodstvo_has_Ispdn` (
  `Rukovodstvo_idRukovodstvo` int NOT NULL,
  `Ispdn_idIspdn` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Rukovodstvo_has_Ispdn`
--

INSERT INTO `Rukovodstvo_has_Ispdn` (`Rukovodstvo_idRukovodstvo`, `Ispdn_idIspdn`) VALUES
(10, 2),
(10, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `Skzi`
--

CREATE TABLE `Skzi` (
  `idSkzi` int NOT NULL COMMENT 'Уникальный идентификатор записи',
  `serial_n` varchar(45) DEFAULT NULL COMMENT 'Серийные номера',
  `ekzemp_n` varchar(45) DEFAULT NULL COMMENT 'Номера экземпляров',
  `date_poluch` date DEFAULT NULL COMMENT 'Дата получения',
  `nomer_poluch` varchar(45) DEFAULT NULL COMMENT 'Номер сопроводительного письма',
  `date_sopr` date DEFAULT NULL COMMENT 'Дата сопроводительного письма о рассылке',
  `nomer_sopr` varchar(45) DEFAULT NULL COMMENT 'Номер сопроводительного письма о рассылке',
  `date_podtv` date DEFAULT NULL COMMENT 'Дата подтверждения рассылки',
  `nomer_podtv` varchar(45) DEFAULT NULL COMMENT 'Номер подтверждения рассылки',
  `podtv_rospis` tinyint DEFAULT NULL COMMENT 'Наличие расписки в подтверждении (0 - нет, 1 - да)',
  `vozvr_date_sopr` date DEFAULT NULL COMMENT 'Дата сопроводительного письма',
  `vozvr_nomer_sopr` varchar(45) DEFAULT NULL COMMENT 'Номер сопроводительного письма',
  `vozvr_date_podtv` date DEFAULT NULL COMMENT 'Дата подтверждения возврата',
  `vozvr_nomer_podtv` varchar(45) DEFAULT NULL COMMENT 'Номер подтверждения возврата',
  `date_vvod` date DEFAULT NULL COMMENT 'Дата ввода в действие',
  `date_vivod` date DEFAULT NULL COMMENT 'Дата вывода из действия',
  `date_unichtozh` varchar(45) DEFAULT NULL COMMENT 'Дата уничтожения',
  `nomer_acta` varchar(45) DEFAULT NULL COMMENT 'Номер акта об уничтожении',
  `act_rospis` tinyint DEFAULT NULL COMMENT 'Наличие расписки об уничтожении (0 - нет, 1 - да)',
  `primechanie` varchar(45) DEFAULT NULL COMMENT 'Дополнительное поле для каких-либо меток',
  `SkziName_idSkziName` int NOT NULL COMMENT 'Внешний ключ на таблицу SkziName',
  `OrganCrypto_idOrganCrypto` int NOT NULL COMMENT 'Внешний ключ на таблицу OrganCrypto',
  `FioRassilki_idFioRassilki` int NOT NULL COMMENT 'Внешний ключ на таблицу FioRassilki'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Skzi`
--

INSERT INTO `Skzi` (`idSkzi`, `serial_n`, `ekzemp_n`, `date_poluch`, `nomer_poluch`, `date_sopr`, `nomer_sopr`, `date_podtv`, `nomer_podtv`, `podtv_rospis`, `vozvr_date_sopr`, `vozvr_nomer_sopr`, `vozvr_date_podtv`, `vozvr_nomer_podtv`, `date_vvod`, `date_vivod`, `date_unichtozh`, `nomer_acta`, `act_rospis`, `primechanie`, `SkziName_idSkziName`, `OrganCrypto_idOrganCrypto`, `FioRassilki_idFioRassilki`) VALUES
(1, 'SN12345', 'EN67890', '2023-01-15', 'NP123', '2023-01-20', 'NS456', '2023-01-25', 'NP789', 1, '2023-02-01', 'NV123', '2023-02-05', 'NV456', '2023-01-30', '2023-12-31', '2024-01-01', 'NA123', 1, 'Пример заметки 1', 1, 1, 1),
(2, 'SN54321', 'EN09876', '2023-02-10', 'NP321', '2023-02-15', 'NS654', '2023-02-20', 'NP987', 0, '2023-03-01', 'NV321', '2023-03-05', 'NV654', '2023-02-25', '2023-11-30', '2024-02-01', 'NA321', 0, 'Пример заметки 2', 2, 2, 2),
(3, 'SN67890', 'EN12345', '2023-03-05', 'NP567', '2023-03-10', 'NS789', '2023-03-15', 'NP123', 1, '2023-04-01', 'NV567', '2023-04-05', 'NV789', '2023-03-20', '2023-10-31', '2024-03-01', 'NA567', 1, 'Пример заметки 3', 3, 3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `SkziName`
--

CREATE TABLE `SkziName` (
  `idSkziName` int NOT NULL,
  `type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `SkziName`
--

INSERT INTO `SkziName` (`idSkziName`, `type`) VALUES
(1, 'Криптографический модуль'),
(2, 'Электронная подпись'),
(3, 'Система шифрования данных'),
(4, 'Аппаратный токен'),
(5, 'Программный токен'),
(6, 'Сертификат безопасности'),
(7, 'Система защиты информации'),
(8, 'Модуль генерации ключей'),
(9, 'Система контроля доступа'),
(10, 'Программное обеспечение для шифрования'),
(11, 'КриптоПро CSP'),
(12, 'ViPNet CSP'),
(13, 'Signal-COM CSP'),
(14, 'КриптоАРМ'),
(15, 'КриптоПро DSS'),
(16, 'ViPNet Coordinator'),
(17, 'КриптоПро JCP'),
(18, 'КриптоПро PDF'),
(19, 'КриптоПро TLS'),
(20, 'КриптоПро HSM');

-- --------------------------------------------------------

--
-- Структура таблицы `User`
--

CREATE TABLE `User` (
  `idUser` int NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` tinyint DEFAULT '0' COMMENT '0 - не админ, 1 - админ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `User`
--

INSERT INTO `User` (`idUser`, `email`, `password`, `is_admin`) VALUES
(1, 'user1@example.com', 'hashed_password1', 0),
(2, 'user2@example.com', 'hashed_password2', 0),
(3, 'admin@example.com', 'hashed_password3', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Zametka`
--

CREATE TABLE `Zametka` (
  `idZametka` int NOT NULL,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Zametka`
--

INSERT INTO `Zametka` (`idZametka`, `content`) VALUES
(1, 'Подготовить отчет по проекту до конца недели.'),
(2, 'Созвон с клиентом в пятницу в 15:00.'),
(3, 'Написать статью для блога о новых технологиях.'),
(4, 'Проверить почту и ответить на важные письма.'),
(5, 'Закупить материалы для офиса.'),
(6, 'Запланировать встречу с командой разработки.'),
(7, 'Обновить документацию по проекту.'),
(8, 'Составить список задач на следующий месяц.'),
(9, 'Провести анализ конкурентов.'),
(10, 'Подготовить презентацию для совещания.');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Fakultet`
--
ALTER TABLE `Fakultet`
  ADD PRIMARY KEY (`idFakultet`);

--
-- Индексы таблицы `FioRassilki`
--
ALTER TABLE `FioRassilki`
  ADD PRIMARY KEY (`idFioRassilki`);

--
-- Индексы таблицы `Instruct`
--
ALTER TABLE `Instruct`
  ADD PRIMARY KEY (`idInstruct`);

--
-- Индексы таблицы `Ispdn`
--
ALTER TABLE `Ispdn`
  ADD PRIMARY KEY (`idIspdn`),
  ADD KEY `idx_ispdn_nomer` (`nomer`);

--
-- Индексы таблицы `Ispdn_has_Instruct`
--
ALTER TABLE `Ispdn_has_Instruct`
  ADD PRIMARY KEY (`Ispdn_idIspdn`,`Instruct_idInstruct`),
  ADD KEY `ispdn_has_instruct_ibfk_2` (`Instruct_idInstruct`);

--
-- Индексы таблицы `Ispdn_has_Polozhenie`
--
ALTER TABLE `Ispdn_has_Polozhenie`
  ADD PRIMARY KEY (`Ispdn_idIspdn`,`Polozhenie_idPolozhenie`),
  ADD KEY `ispdn_has_polozhenie_ibfk_2` (`Polozhenie_idPolozhenie`);

--
-- Индексы таблицы `Ispdn_has_Prikaz`
--
ALTER TABLE `Ispdn_has_Prikaz`
  ADD PRIMARY KEY (`Ispdn_idIspdn`,`Prikaz_idPrikaz`),
  ADD KEY `ispdn_has_prikaz_ibfk_2` (`Prikaz_idPrikaz`);

--
-- Индексы таблицы `Ispdn_has_ProgOb`
--
ALTER TABLE `Ispdn_has_ProgOb`
  ADD PRIMARY KEY (`Ispdn_idIspdn`,`ProgOb_idProgOb`),
  ADD KEY `ispdn_has_progob_ibfk_2` (`ProgOb_idProgOb`);

--
-- Индексы таблицы `Ispdn_has_Raznoe`
--
ALTER TABLE `Ispdn_has_Raznoe`
  ADD PRIMARY KEY (`Ispdn_idIspdn`,`Raznoe_idRaznoe`),
  ADD KEY `ispdn_has_raznoe_ibfk_2` (`Raznoe_idRaznoe`);

--
-- Индексы таблицы `OrganCrypto`
--
ALTER TABLE `OrganCrypto`
  ADD PRIMARY KEY (`idOrganCrypto`);

--
-- Индексы таблицы `PdnPerson`
--
ALTER TABLE `PdnPerson`
  ADD PRIMARY KEY (`idPdnPerson`);

--
-- Индексы таблицы `Podrazdelenie`
--
ALTER TABLE `Podrazdelenie`
  ADD PRIMARY KEY (`idPodrazdelenie`);

--
-- Индексы таблицы `Polozhenie`
--
ALTER TABLE `Polozhenie`
  ADD PRIMARY KEY (`idPolozhenie`);

--
-- Индексы таблицы `Prikaz`
--
ALTER TABLE `Prikaz`
  ADD PRIMARY KEY (`idPrikaz`);

--
-- Индексы таблицы `ProgOb`
--
ALTER TABLE `ProgOb`
  ADD PRIMARY KEY (`idProgOb`);

--
-- Индексы таблицы `Raznoe`
--
ALTER TABLE `Raznoe`
  ADD PRIMARY KEY (`idRaznoe`);

--
-- Индексы таблицы `Rukovodstvo`
--
ALTER TABLE `Rukovodstvo`
  ADD PRIMARY KEY (`idRukovodstvo`);

--
-- Индексы таблицы `Rukovodstvo_has_Ispdn`
--
ALTER TABLE `Rukovodstvo_has_Ispdn`
  ADD PRIMARY KEY (`Rukovodstvo_idRukovodstvo`,`Ispdn_idIspdn`),
  ADD KEY `rukovodstvo_has_ispdn_ibfk_1` (`Ispdn_idIspdn`);

--
-- Индексы таблицы `Skzi`
--
ALTER TABLE `Skzi`
  ADD PRIMARY KEY (`idSkzi`),
  ADD KEY `fk_skzi_skziname` (`SkziName_idSkziName`),
  ADD KEY `fk_skzi_organcrypto` (`OrganCrypto_idOrganCrypto`),
  ADD KEY `fk_skzi_fiorassilki` (`FioRassilki_idFioRassilki`);

--
-- Индексы таблицы `SkziName`
--
ALTER TABLE `SkziName`
  ADD PRIMARY KEY (`idSkziName`);

--
-- Индексы таблицы `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`idUser`),
  ADD KEY `idx_user_email` (`email`);

--
-- Индексы таблицы `Zametka`
--
ALTER TABLE `Zametka`
  ADD PRIMARY KEY (`idZametka`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Fakultet`
--
ALTER TABLE `Fakultet`
  MODIFY `idFakultet` int NOT NULL AUTO_INCREMENT COMMENT 'Номер факультета', AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `FioRassilki`
--
ALTER TABLE `FioRassilki`
  MODIFY `idFioRassilki` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `Instruct`
--
ALTER TABLE `Instruct`
  MODIFY `idInstruct` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `Ispdn`
--
ALTER TABLE `Ispdn`
  MODIFY `idIspdn` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `OrganCrypto`
--
ALTER TABLE `OrganCrypto`
  MODIFY `idOrganCrypto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `PdnPerson`
--
ALTER TABLE `PdnPerson`
  MODIFY `idPdnPerson` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `Podrazdelenie`
--
ALTER TABLE `Podrazdelenie`
  MODIFY `idPodrazdelenie` int NOT NULL AUTO_INCREMENT COMMENT 'Номер подразделения', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `Polozhenie`
--
ALTER TABLE `Polozhenie`
  MODIFY `idPolozhenie` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `Prikaz`
--
ALTER TABLE `Prikaz`
  MODIFY `idPrikaz` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `ProgOb`
--
ALTER TABLE `ProgOb`
  MODIFY `idProgOb` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `Raznoe`
--
ALTER TABLE `Raznoe`
  MODIFY `idRaznoe` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `Rukovodstvo`
--
ALTER TABLE `Rukovodstvo`
  MODIFY `idRukovodstvo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `Skzi`
--
ALTER TABLE `Skzi`
  MODIFY `idSkzi` int NOT NULL AUTO_INCREMENT COMMENT 'Уникальный идентификатор записи', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `SkziName`
--
ALTER TABLE `SkziName`
  MODIFY `idSkziName` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `User`
--
ALTER TABLE `User`
  MODIFY `idUser` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `Zametka`
--
ALTER TABLE `Zametka`
  MODIFY `idZametka` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Ispdn_has_Instruct`
--
ALTER TABLE `Ispdn_has_Instruct`
  ADD CONSTRAINT `ispdn_has_instruct_ibfk_1` FOREIGN KEY (`Ispdn_idIspdn`) REFERENCES `Ispdn` (`idIspdn`),
  ADD CONSTRAINT `ispdn_has_instruct_ibfk_2` FOREIGN KEY (`Instruct_idInstruct`) REFERENCES `Instruct` (`idInstruct`);

--
-- Ограничения внешнего ключа таблицы `Ispdn_has_Polozhenie`
--
ALTER TABLE `Ispdn_has_Polozhenie`
  ADD CONSTRAINT `ispdn_has_polozhenie_ibfk_1` FOREIGN KEY (`Ispdn_idIspdn`) REFERENCES `Ispdn` (`idIspdn`),
  ADD CONSTRAINT `ispdn_has_polozhenie_ibfk_2` FOREIGN KEY (`Polozhenie_idPolozhenie`) REFERENCES `Polozhenie` (`idPolozhenie`);

--
-- Ограничения внешнего ключа таблицы `Ispdn_has_Prikaz`
--
ALTER TABLE `Ispdn_has_Prikaz`
  ADD CONSTRAINT `ispdn_has_prikaz_ibfk_1` FOREIGN KEY (`Ispdn_idIspdn`) REFERENCES `Ispdn` (`idIspdn`),
  ADD CONSTRAINT `ispdn_has_prikaz_ibfk_2` FOREIGN KEY (`Prikaz_idPrikaz`) REFERENCES `Prikaz` (`idPrikaz`);

--
-- Ограничения внешнего ключа таблицы `Ispdn_has_ProgOb`
--
ALTER TABLE `Ispdn_has_ProgOb`
  ADD CONSTRAINT `ispdn_has_progob_ibfk_1` FOREIGN KEY (`Ispdn_idIspdn`) REFERENCES `Ispdn` (`idIspdn`),
  ADD CONSTRAINT `ispdn_has_progob_ibfk_2` FOREIGN KEY (`ProgOb_idProgOb`) REFERENCES `ProgOb` (`idProgOb`);

--
-- Ограничения внешнего ключа таблицы `Ispdn_has_Raznoe`
--
ALTER TABLE `Ispdn_has_Raznoe`
  ADD CONSTRAINT `ispdn_has_raznoe_ibfk_1` FOREIGN KEY (`Ispdn_idIspdn`) REFERENCES `Ispdn` (`idIspdn`),
  ADD CONSTRAINT `ispdn_has_raznoe_ibfk_2` FOREIGN KEY (`Raznoe_idRaznoe`) REFERENCES `Raznoe` (`idRaznoe`);

--
-- Ограничения внешнего ключа таблицы `Rukovodstvo_has_Ispdn`
--
ALTER TABLE `Rukovodstvo_has_Ispdn`
  ADD CONSTRAINT `rukovodstvo_has_ispdn_ibfk_1` FOREIGN KEY (`Ispdn_idIspdn`) REFERENCES `Ispdn` (`idIspdn`),
  ADD CONSTRAINT `rukovodstvo_has_ispdn_ibfk_2` FOREIGN KEY (`Rukovodstvo_idRukovodstvo`) REFERENCES `Rukovodstvo` (`idRukovodstvo`);

--
-- Ограничения внешнего ключа таблицы `Skzi`
--
ALTER TABLE `Skzi`
  ADD CONSTRAINT `fk_skzi_fiorassilki` FOREIGN KEY (`FioRassilki_idFioRassilki`) REFERENCES `FioRassilki` (`idFioRassilki`),
  ADD CONSTRAINT `fk_skzi_organcrypto` FOREIGN KEY (`OrganCrypto_idOrganCrypto`) REFERENCES `OrganCrypto` (`idOrganCrypto`),
  ADD CONSTRAINT `fk_skzi_skziname` FOREIGN KEY (`SkziName_idSkziName`) REFERENCES `SkziName` (`idSkziName`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
