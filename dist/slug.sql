/*
Created by Shamatienko Yaroslav (shamatienko.yaroslav@gmail.com)
*/

prompt *** Installing PL/SQL-SLUG ***

-- PREPARE

prompt *** Drop Old Package ***

DROP PACKAGE slug_util;
/

-- CREATE PACKAGE

prompt *** Package ***

CREATE OR REPLACE PACKAGE slug_util AS
    SUBTYPE slug_varchar IS VARCHAR2(32767);
    
    FUNCTION slugify ( string_in IN slug_varchar ) RETURN slug_varchar;

END slug_util;
/

CREATE OR REPLACE PACKAGE BODY slug_util AS

    -- ******** PUBLIC ********
    
    FUNCTION slugify ( string_in IN slug_varchar ) RETURN slug_varchar
        is
        l_parsed_string slug_varchar := regexp_replace(string_in, '[[:space:]]+', '-');
        
        type r_char_record is record (
            CYRILLIC_SYMBOL NVARCHAR2(10),
            LATIN_SYMBOLS slug_varchar
        );
        type a_chars is table of r_char_record index by pls_integer;
        v_chars a_chars;
        v_index pls_integer;
        
        function init_chars return a_chars
        as
            v_chars a_chars;
        begin
            
            v_chars(1).CYRILLIC_SYMBOL := N'À';
            v_chars(1).LATIN_SYMBOLS := 'A';

            v_chars(2).CYRILLIC_SYMBOL := N'Á';
            v_chars(2).LATIN_SYMBOLS := 'A';

            v_chars(3).CYRILLIC_SYMBOL := N'Â';
            v_chars(3).LATIN_SYMBOLS := 'A';

            v_chars(4).CYRILLIC_SYMBOL := N'Ã';
            v_chars(4).LATIN_SYMBOLS := 'A';

            v_chars(5).CYRILLIC_SYMBOL := N'Ä';
            v_chars(5).LATIN_SYMBOLS := 'A';

            v_chars(6).CYRILLIC_SYMBOL := N'Å';
            v_chars(6).LATIN_SYMBOLS := 'A';

            v_chars(7).CYRILLIC_SYMBOL := N'Æ';
            v_chars(7).LATIN_SYMBOLS := 'AE';

            v_chars(8).CYRILLIC_SYMBOL := N'Ç';
            v_chars(8).LATIN_SYMBOLS := 'C';

            v_chars(9).CYRILLIC_SYMBOL := N'È';
            v_chars(9).LATIN_SYMBOLS := 'E';

            v_chars(10).CYRILLIC_SYMBOL := N'É';
            v_chars(10).LATIN_SYMBOLS := 'E';

            v_chars(11).CYRILLIC_SYMBOL := N'Ê';
            v_chars(11).LATIN_SYMBOLS := 'E';

            v_chars(12).CYRILLIC_SYMBOL := N'Ë';
            v_chars(12).LATIN_SYMBOLS := 'E';

            v_chars(13).CYRILLIC_SYMBOL := N'Ì';
            v_chars(13).LATIN_SYMBOLS := 'I';

            v_chars(14).CYRILLIC_SYMBOL := N'Í';
            v_chars(14).LATIN_SYMBOLS := 'I';

            v_chars(15).CYRILLIC_SYMBOL := N'Î';
            v_chars(15).LATIN_SYMBOLS := 'I';

            v_chars(16).CYRILLIC_SYMBOL := N'Ï';
            v_chars(16).LATIN_SYMBOLS := 'I';

            v_chars(17).CYRILLIC_SYMBOL := N'Ð';
            v_chars(17).LATIN_SYMBOLS := 'D';

            v_chars(18).CYRILLIC_SYMBOL := N'Ñ';
            v_chars(18).LATIN_SYMBOLS := 'N';

            v_chars(19).CYRILLIC_SYMBOL := N'Ò';
            v_chars(19).LATIN_SYMBOLS := 'O';

            v_chars(20).CYRILLIC_SYMBOL := N'Ó';
            v_chars(20).LATIN_SYMBOLS := 'O';

            v_chars(21).CYRILLIC_SYMBOL := N'Ô';
            v_chars(21).LATIN_SYMBOLS := 'O';

            v_chars(22).CYRILLIC_SYMBOL := N'Õ';
            v_chars(22).LATIN_SYMBOLS := 'O';

            v_chars(23).CYRILLIC_SYMBOL := N'Ö';
            v_chars(23).LATIN_SYMBOLS := 'O';

            v_chars(24).CYRILLIC_SYMBOL := N'Ő';
            v_chars(24).LATIN_SYMBOLS := 'O';

            v_chars(25).CYRILLIC_SYMBOL := N'Ø';
            v_chars(25).LATIN_SYMBOLS := 'O';

            v_chars(26).CYRILLIC_SYMBOL := N'Ù';
            v_chars(26).LATIN_SYMBOLS := 'U';

            v_chars(27).CYRILLIC_SYMBOL := N'Ú';
            v_chars(27).LATIN_SYMBOLS := 'U';

            v_chars(28).CYRILLIC_SYMBOL := N'Û';
            v_chars(28).LATIN_SYMBOLS := 'U';

            v_chars(29).CYRILLIC_SYMBOL := N'Ü';
            v_chars(29).LATIN_SYMBOLS := 'U';

            v_chars(30).CYRILLIC_SYMBOL := N'Ű';
            v_chars(30).LATIN_SYMBOLS := 'U';

            v_chars(31).CYRILLIC_SYMBOL := N'Ý';
            v_chars(31).LATIN_SYMBOLS := 'Y';

            v_chars(32).CYRILLIC_SYMBOL := N'Þ';
            v_chars(32).LATIN_SYMBOLS := 'TH';

            v_chars(33).CYRILLIC_SYMBOL := N'ß';
            v_chars(33).LATIN_SYMBOLS := 'ss';

            v_chars(34).CYRILLIC_SYMBOL := N'à';
            v_chars(34).LATIN_SYMBOLS := 'a';

            v_chars(35).CYRILLIC_SYMBOL := N'á';
            v_chars(35).LATIN_SYMBOLS := 'a';

            v_chars(36).CYRILLIC_SYMBOL := N'â';
            v_chars(36).LATIN_SYMBOLS := 'a';

            v_chars(37).CYRILLIC_SYMBOL := N'ã';
            v_chars(37).LATIN_SYMBOLS := 'a';

            v_chars(38).CYRILLIC_SYMBOL := N'ä';
            v_chars(38).LATIN_SYMBOLS := 'a';

            v_chars(39).CYRILLIC_SYMBOL := N'å';
            v_chars(39).LATIN_SYMBOLS := 'a';

            v_chars(40).CYRILLIC_SYMBOL := N'æ';
            v_chars(40).LATIN_SYMBOLS := 'ae';

            v_chars(41).CYRILLIC_SYMBOL := N'ç';
            v_chars(41).LATIN_SYMBOLS := 'c';

            v_chars(42).CYRILLIC_SYMBOL := N'è';
            v_chars(42).LATIN_SYMBOLS := 'e';

            v_chars(43).CYRILLIC_SYMBOL := N'é';
            v_chars(43).LATIN_SYMBOLS := 'e';

            v_chars(44).CYRILLIC_SYMBOL := N'ê';
            v_chars(44).LATIN_SYMBOLS := 'e';

            v_chars(45).CYRILLIC_SYMBOL := N'ë';
            v_chars(45).LATIN_SYMBOLS := 'e';

            v_chars(46).CYRILLIC_SYMBOL := N'ì';
            v_chars(46).LATIN_SYMBOLS := 'i';

            v_chars(47).CYRILLIC_SYMBOL := N'í';
            v_chars(47).LATIN_SYMBOLS := 'i';

            v_chars(48).CYRILLIC_SYMBOL := N'î';
            v_chars(48).LATIN_SYMBOLS := 'i';

            v_chars(49).CYRILLIC_SYMBOL := N'ï';
            v_chars(49).LATIN_SYMBOLS := 'i';

            v_chars(50).CYRILLIC_SYMBOL := N'ð';
            v_chars(50).LATIN_SYMBOLS := 'd';

            v_chars(51).CYRILLIC_SYMBOL := N'ñ';
            v_chars(51).LATIN_SYMBOLS := 'n';

            v_chars(52).CYRILLIC_SYMBOL := N'ò';
            v_chars(52).LATIN_SYMBOLS := 'o';

            v_chars(53).CYRILLIC_SYMBOL := N'ó';
            v_chars(53).LATIN_SYMBOLS := 'o';

            v_chars(54).CYRILLIC_SYMBOL := N'ô';
            v_chars(54).LATIN_SYMBOLS := 'o';

            v_chars(55).CYRILLIC_SYMBOL := N'õ';
            v_chars(55).LATIN_SYMBOLS := 'o';

            v_chars(56).CYRILLIC_SYMBOL := N'ö';
            v_chars(56).LATIN_SYMBOLS := 'o';

            v_chars(57).CYRILLIC_SYMBOL := N'ő';
            v_chars(57).LATIN_SYMBOLS := 'o';

            v_chars(58).CYRILLIC_SYMBOL := N'ø';
            v_chars(58).LATIN_SYMBOLS := 'o';

            v_chars(59).CYRILLIC_SYMBOL := N'ù';
            v_chars(59).LATIN_SYMBOLS := 'u';

            v_chars(60).CYRILLIC_SYMBOL := N'ú';
            v_chars(60).LATIN_SYMBOLS := 'u';

            v_chars(61).CYRILLIC_SYMBOL := N'û';
            v_chars(61).LATIN_SYMBOLS := 'u';

            v_chars(62).CYRILLIC_SYMBOL := N'ü';
            v_chars(62).LATIN_SYMBOLS := 'u';

            v_chars(63).CYRILLIC_SYMBOL := N'ű';
            v_chars(63).LATIN_SYMBOLS := 'u';

            v_chars(64).CYRILLIC_SYMBOL := N'ý';
            v_chars(64).LATIN_SYMBOLS := 'y';

            v_chars(65).CYRILLIC_SYMBOL := N'þ';
            v_chars(65).LATIN_SYMBOLS := 'th';

            v_chars(66).CYRILLIC_SYMBOL := N'ÿ';
            v_chars(66).LATIN_SYMBOLS := 'y';

            v_chars(67).CYRILLIC_SYMBOL := N'ẞ';
            v_chars(67).LATIN_SYMBOLS := 'SS';

            v_chars(68).CYRILLIC_SYMBOL := N'α';
            v_chars(68).LATIN_SYMBOLS := 'a';

            v_chars(69).CYRILLIC_SYMBOL := N'β';
            v_chars(69).LATIN_SYMBOLS := 'b';

            v_chars(70).CYRILLIC_SYMBOL := N'γ';
            v_chars(70).LATIN_SYMBOLS := 'g';

            v_chars(71).CYRILLIC_SYMBOL := N'δ';
            v_chars(71).LATIN_SYMBOLS := 'd';

            v_chars(72).CYRILLIC_SYMBOL := N'ε';
            v_chars(72).LATIN_SYMBOLS := 'e';

            v_chars(73).CYRILLIC_SYMBOL := N'ζ';
            v_chars(73).LATIN_SYMBOLS := 'z';

            v_chars(74).CYRILLIC_SYMBOL := N'η';
            v_chars(74).LATIN_SYMBOLS := 'h';

            v_chars(75).CYRILLIC_SYMBOL := N'θ';
            v_chars(75).LATIN_SYMBOLS := '8';

            v_chars(76).CYRILLIC_SYMBOL := N'ι';
            v_chars(76).LATIN_SYMBOLS := 'i';

            v_chars(77).CYRILLIC_SYMBOL := N'κ';
            v_chars(77).LATIN_SYMBOLS := 'k';

            v_chars(78).CYRILLIC_SYMBOL := N'λ';
            v_chars(78).LATIN_SYMBOLS := 'l';

            v_chars(79).CYRILLIC_SYMBOL := N'μ';
            v_chars(79).LATIN_SYMBOLS := 'm';

            v_chars(80).CYRILLIC_SYMBOL := N'ν';
            v_chars(80).LATIN_SYMBOLS := 'n';

            v_chars(81).CYRILLIC_SYMBOL := N'ξ';
            v_chars(81).LATIN_SYMBOLS := '3';

            v_chars(82).CYRILLIC_SYMBOL := N'ο';
            v_chars(82).LATIN_SYMBOLS := 'o';

            v_chars(83).CYRILLIC_SYMBOL := N'π';
            v_chars(83).LATIN_SYMBOLS := 'p';

            v_chars(84).CYRILLIC_SYMBOL := N'ρ';
            v_chars(84).LATIN_SYMBOLS := 'r';

            v_chars(85).CYRILLIC_SYMBOL := N'σ';
            v_chars(85).LATIN_SYMBOLS := 's';

            v_chars(86).CYRILLIC_SYMBOL := N'τ';
            v_chars(86).LATIN_SYMBOLS := 't';

            v_chars(87).CYRILLIC_SYMBOL := N'υ';
            v_chars(87).LATIN_SYMBOLS := 'y';

            v_chars(88).CYRILLIC_SYMBOL := N'φ';
            v_chars(88).LATIN_SYMBOLS := 'f';

            v_chars(89).CYRILLIC_SYMBOL := N'χ';
            v_chars(89).LATIN_SYMBOLS := 'x';

            v_chars(90).CYRILLIC_SYMBOL := N'ψ';
            v_chars(90).LATIN_SYMBOLS := 'ps';

            v_chars(91).CYRILLIC_SYMBOL := N'ω';
            v_chars(91).LATIN_SYMBOLS := 'w';

            v_chars(92).CYRILLIC_SYMBOL := N'ά';
            v_chars(92).LATIN_SYMBOLS := 'a';

            v_chars(93).CYRILLIC_SYMBOL := N'έ';
            v_chars(93).LATIN_SYMBOLS := 'e';

            v_chars(94).CYRILLIC_SYMBOL := N'ί';
            v_chars(94).LATIN_SYMBOLS := 'i';

            v_chars(95).CYRILLIC_SYMBOL := N'ό';
            v_chars(95).LATIN_SYMBOLS := 'o';

            v_chars(96).CYRILLIC_SYMBOL := N'ύ';
            v_chars(96).LATIN_SYMBOLS := 'y';

            v_chars(97).CYRILLIC_SYMBOL := N'ή';
            v_chars(97).LATIN_SYMBOLS := 'h';

            v_chars(98).CYRILLIC_SYMBOL := N'ώ';
            v_chars(98).LATIN_SYMBOLS := 'w';

            v_chars(99).CYRILLIC_SYMBOL := N'ς';
            v_chars(99).LATIN_SYMBOLS := 's';

            v_chars(100).CYRILLIC_SYMBOL := N'ϊ';
            v_chars(100).LATIN_SYMBOLS := 'i';

            v_chars(101).CYRILLIC_SYMBOL := N'ΰ';
            v_chars(101).LATIN_SYMBOLS := 'y';

            v_chars(102).CYRILLIC_SYMBOL := N'ϋ';
            v_chars(102).LATIN_SYMBOLS := 'y';

            v_chars(103).CYRILLIC_SYMBOL := N'ΐ';
            v_chars(103).LATIN_SYMBOLS := 'i';

            v_chars(104).CYRILLIC_SYMBOL := N'Α';
            v_chars(104).LATIN_SYMBOLS := 'A';

            v_chars(105).CYRILLIC_SYMBOL := N'Β';
            v_chars(105).LATIN_SYMBOLS := 'B';

            v_chars(106).CYRILLIC_SYMBOL := N'Γ';
            v_chars(106).LATIN_SYMBOLS := 'G';

            v_chars(107).CYRILLIC_SYMBOL := N'Δ';
            v_chars(107).LATIN_SYMBOLS := 'D';

            v_chars(108).CYRILLIC_SYMBOL := N'Ε';
            v_chars(108).LATIN_SYMBOLS := 'E';

            v_chars(109).CYRILLIC_SYMBOL := N'Ζ';
            v_chars(109).LATIN_SYMBOLS := 'Z';

            v_chars(110).CYRILLIC_SYMBOL := N'Η';
            v_chars(110).LATIN_SYMBOLS := 'H';

            v_chars(111).CYRILLIC_SYMBOL := N'Θ';
            v_chars(111).LATIN_SYMBOLS := '8';

            v_chars(112).CYRILLIC_SYMBOL := N'Ι';
            v_chars(112).LATIN_SYMBOLS := 'I';

            v_chars(113).CYRILLIC_SYMBOL := N'Κ';
            v_chars(113).LATIN_SYMBOLS := 'K';

            v_chars(114).CYRILLIC_SYMBOL := N'Λ';
            v_chars(114).LATIN_SYMBOLS := 'L';

            v_chars(115).CYRILLIC_SYMBOL := N'Μ';
            v_chars(115).LATIN_SYMBOLS := 'M';

            v_chars(116).CYRILLIC_SYMBOL := N'Ν';
            v_chars(116).LATIN_SYMBOLS := 'N';

            v_chars(117).CYRILLIC_SYMBOL := N'Ξ';
            v_chars(117).LATIN_SYMBOLS := '3';

            v_chars(118).CYRILLIC_SYMBOL := N'Ο';
            v_chars(118).LATIN_SYMBOLS := 'O';

            v_chars(119).CYRILLIC_SYMBOL := N'Π';
            v_chars(119).LATIN_SYMBOLS := 'P';

            v_chars(120).CYRILLIC_SYMBOL := N'Ρ';
            v_chars(120).LATIN_SYMBOLS := 'R';

            v_chars(121).CYRILLIC_SYMBOL := N'Σ';
            v_chars(121).LATIN_SYMBOLS := 'S';

            v_chars(122).CYRILLIC_SYMBOL := N'Τ';
            v_chars(122).LATIN_SYMBOLS := 'T';

            v_chars(123).CYRILLIC_SYMBOL := N'Υ';
            v_chars(123).LATIN_SYMBOLS := 'Y';

            v_chars(124).CYRILLIC_SYMBOL := N'Φ';
            v_chars(124).LATIN_SYMBOLS := 'F';

            v_chars(125).CYRILLIC_SYMBOL := N'Χ';
            v_chars(125).LATIN_SYMBOLS := 'X';

            v_chars(126).CYRILLIC_SYMBOL := N'Ψ';
            v_chars(126).LATIN_SYMBOLS := 'PS';

            v_chars(127).CYRILLIC_SYMBOL := N'Ω';
            v_chars(127).LATIN_SYMBOLS := 'W';

            v_chars(128).CYRILLIC_SYMBOL := N'Ά';
            v_chars(128).LATIN_SYMBOLS := 'A';

            v_chars(129).CYRILLIC_SYMBOL := N'Έ';
            v_chars(129).LATIN_SYMBOLS := 'E';

            v_chars(130).CYRILLIC_SYMBOL := N'Ί';
            v_chars(130).LATIN_SYMBOLS := 'I';

            v_chars(131).CYRILLIC_SYMBOL := N'Ό';
            v_chars(131).LATIN_SYMBOLS := 'O';

            v_chars(132).CYRILLIC_SYMBOL := N'Ύ';
            v_chars(132).LATIN_SYMBOLS := 'Y';

            v_chars(133).CYRILLIC_SYMBOL := N'Ή';
            v_chars(133).LATIN_SYMBOLS := 'H';

            v_chars(134).CYRILLIC_SYMBOL := N'Ώ';
            v_chars(134).LATIN_SYMBOLS := 'W';

            v_chars(135).CYRILLIC_SYMBOL := N'Ϊ';
            v_chars(135).LATIN_SYMBOLS := 'I';

            v_chars(136).CYRILLIC_SYMBOL := N'Ϋ';
            v_chars(136).LATIN_SYMBOLS := 'Y';

            v_chars(137).CYRILLIC_SYMBOL := N'ş';
            v_chars(137).LATIN_SYMBOLS := 's';

            v_chars(138).CYRILLIC_SYMBOL := N'Ş';
            v_chars(138).LATIN_SYMBOLS := 'S';

            v_chars(139).CYRILLIC_SYMBOL := N'ı';
            v_chars(139).LATIN_SYMBOLS := 'i';

            v_chars(140).CYRILLIC_SYMBOL := N'İ';
            v_chars(140).LATIN_SYMBOLS := 'I';

            v_chars(141).CYRILLIC_SYMBOL := N'ğ';
            v_chars(141).LATIN_SYMBOLS := 'g';

            v_chars(142).CYRILLIC_SYMBOL := N'Ğ';
            v_chars(142).LATIN_SYMBOLS := 'G';

            v_chars(143).CYRILLIC_SYMBOL := N'а';
            v_chars(143).LATIN_SYMBOLS := 'a';

            v_chars(144).CYRILLIC_SYMBOL := N'б';
            v_chars(144).LATIN_SYMBOLS := 'b';

            v_chars(145).CYRILLIC_SYMBOL := N'в';
            v_chars(145).LATIN_SYMBOLS := 'v';

            v_chars(146).CYRILLIC_SYMBOL := N'г';
            v_chars(146).LATIN_SYMBOLS := 'g';

            v_chars(147).CYRILLIC_SYMBOL := N'д';
            v_chars(147).LATIN_SYMBOLS := 'd';

            v_chars(148).CYRILLIC_SYMBOL := N'е';
            v_chars(148).LATIN_SYMBOLS := 'e';

            v_chars(149).CYRILLIC_SYMBOL := N'ё';
            v_chars(149).LATIN_SYMBOLS := 'yo';

            v_chars(150).CYRILLIC_SYMBOL := N'ж';
            v_chars(150).LATIN_SYMBOLS := 'zh';

            v_chars(151).CYRILLIC_SYMBOL := N'з';
            v_chars(151).LATIN_SYMBOLS := 'z';

            v_chars(152).CYRILLIC_SYMBOL := N'и';
            v_chars(152).LATIN_SYMBOLS := 'i';

            v_chars(153).CYRILLIC_SYMBOL := N'й';
            v_chars(153).LATIN_SYMBOLS := 'j';

            v_chars(154).CYRILLIC_SYMBOL := N'к';
            v_chars(154).LATIN_SYMBOLS := 'k';

            v_chars(155).CYRILLIC_SYMBOL := N'л';
            v_chars(155).LATIN_SYMBOLS := 'l';

            v_chars(156).CYRILLIC_SYMBOL := N'м';
            v_chars(156).LATIN_SYMBOLS := 'm';

            v_chars(157).CYRILLIC_SYMBOL := N'н';
            v_chars(157).LATIN_SYMBOLS := 'n';

            v_chars(158).CYRILLIC_SYMBOL := N'о';
            v_chars(158).LATIN_SYMBOLS := 'o';

            v_chars(159).CYRILLIC_SYMBOL := N'п';
            v_chars(159).LATIN_SYMBOLS := 'p';

            v_chars(160).CYRILLIC_SYMBOL := N'р';
            v_chars(160).LATIN_SYMBOLS := 'r';

            v_chars(161).CYRILLIC_SYMBOL := N'с';
            v_chars(161).LATIN_SYMBOLS := 's';

            v_chars(162).CYRILLIC_SYMBOL := N'т';
            v_chars(162).LATIN_SYMBOLS := 't';

            v_chars(163).CYRILLIC_SYMBOL := N'у';
            v_chars(163).LATIN_SYMBOLS := 'u';

            v_chars(164).CYRILLIC_SYMBOL := N'ф';
            v_chars(164).LATIN_SYMBOLS := 'f';

            v_chars(165).CYRILLIC_SYMBOL := N'х';
            v_chars(165).LATIN_SYMBOLS := 'h';

            v_chars(166).CYRILLIC_SYMBOL := N'ц';
            v_chars(166).LATIN_SYMBOLS := 'c';

            v_chars(167).CYRILLIC_SYMBOL := N'ч';
            v_chars(167).LATIN_SYMBOLS := 'ch';

            v_chars(168).CYRILLIC_SYMBOL := N'ш';
            v_chars(168).LATIN_SYMBOLS := 'sh';

            v_chars(169).CYRILLIC_SYMBOL := N'щ';
            v_chars(169).LATIN_SYMBOLS := 'sh';

            v_chars(170).CYRILLIC_SYMBOL := N'ъ';
            v_chars(170).LATIN_SYMBOLS := 'u';

            v_chars(171).CYRILLIC_SYMBOL := N'ы';
            v_chars(171).LATIN_SYMBOLS := 'y';

            v_chars(172).CYRILLIC_SYMBOL := N'ь';
            v_chars(172).LATIN_SYMBOLS := '';

            v_chars(173).CYRILLIC_SYMBOL := N'э';
            v_chars(173).LATIN_SYMBOLS := 'e';

            v_chars(174).CYRILLIC_SYMBOL := N'ю';
            v_chars(174).LATIN_SYMBOLS := 'yu';

            v_chars(175).CYRILLIC_SYMBOL := N'я';
            v_chars(175).LATIN_SYMBOLS := 'ya';

            v_chars(176).CYRILLIC_SYMBOL := N'А';
            v_chars(176).LATIN_SYMBOLS := 'A';

            v_chars(177).CYRILLIC_SYMBOL := N'Б';
            v_chars(177).LATIN_SYMBOLS := 'B';

            v_chars(178).CYRILLIC_SYMBOL := N'В';
            v_chars(178).LATIN_SYMBOLS := 'V';

            v_chars(179).CYRILLIC_SYMBOL := N'Г';
            v_chars(179).LATIN_SYMBOLS := 'G';

            v_chars(180).CYRILLIC_SYMBOL := N'Д';
            v_chars(180).LATIN_SYMBOLS := 'D';

            v_chars(181).CYRILLIC_SYMBOL := N'Е';
            v_chars(181).LATIN_SYMBOLS := 'E';

            v_chars(182).CYRILLIC_SYMBOL := N'Ё';
            v_chars(182).LATIN_SYMBOLS := 'Yo';

            v_chars(183).CYRILLIC_SYMBOL := N'Ж';
            v_chars(183).LATIN_SYMBOLS := 'Zh';

            v_chars(184).CYRILLIC_SYMBOL := N'З';
            v_chars(184).LATIN_SYMBOLS := 'Z';

            v_chars(185).CYRILLIC_SYMBOL := N'И';
            v_chars(185).LATIN_SYMBOLS := 'I';

            v_chars(186).CYRILLIC_SYMBOL := N'Й';
            v_chars(186).LATIN_SYMBOLS := 'J';

            v_chars(187).CYRILLIC_SYMBOL := N'К';
            v_chars(187).LATIN_SYMBOLS := 'K';

            v_chars(188).CYRILLIC_SYMBOL := N'Л';
            v_chars(188).LATIN_SYMBOLS := 'L';

            v_chars(189).CYRILLIC_SYMBOL := N'М';
            v_chars(189).LATIN_SYMBOLS := 'M';

            v_chars(190).CYRILLIC_SYMBOL := N'Н';
            v_chars(190).LATIN_SYMBOLS := 'N';

            v_chars(191).CYRILLIC_SYMBOL := N'О';
            v_chars(191).LATIN_SYMBOLS := 'O';

            v_chars(192).CYRILLIC_SYMBOL := N'П';
            v_chars(192).LATIN_SYMBOLS := 'P';

            v_chars(193).CYRILLIC_SYMBOL := N'Р';
            v_chars(193).LATIN_SYMBOLS := 'R';

            v_chars(194).CYRILLIC_SYMBOL := N'С';
            v_chars(194).LATIN_SYMBOLS := 'S';

            v_chars(195).CYRILLIC_SYMBOL := N'Т';
            v_chars(195).LATIN_SYMBOLS := 'T';

            v_chars(196).CYRILLIC_SYMBOL := N'У';
            v_chars(196).LATIN_SYMBOLS := 'U';

            v_chars(197).CYRILLIC_SYMBOL := N'Ф';
            v_chars(197).LATIN_SYMBOLS := 'F';

            v_chars(198).CYRILLIC_SYMBOL := N'Х';
            v_chars(198).LATIN_SYMBOLS := 'H';

            v_chars(199).CYRILLIC_SYMBOL := N'Ц';
            v_chars(199).LATIN_SYMBOLS := 'C';

            v_chars(200).CYRILLIC_SYMBOL := N'Ч';
            v_chars(200).LATIN_SYMBOLS := 'Ch';

            v_chars(201).CYRILLIC_SYMBOL := N'Ш';
            v_chars(201).LATIN_SYMBOLS := 'Sh';

            v_chars(202).CYRILLIC_SYMBOL := N'Щ';
            v_chars(202).LATIN_SYMBOLS := 'Sh';

            v_chars(203).CYRILLIC_SYMBOL := N'Ъ';
            v_chars(203).LATIN_SYMBOLS := 'U';

            v_chars(204).CYRILLIC_SYMBOL := N'Ы';
            v_chars(204).LATIN_SYMBOLS := 'Y';

            v_chars(205).CYRILLIC_SYMBOL := N'Ь';
            v_chars(205).LATIN_SYMBOLS := '';

            v_chars(206).CYRILLIC_SYMBOL := N'Э';
            v_chars(206).LATIN_SYMBOLS := 'E';

            v_chars(207).CYRILLIC_SYMBOL := N'Ю';
            v_chars(207).LATIN_SYMBOLS := 'Yu';

            v_chars(208).CYRILLIC_SYMBOL := N'Я';
            v_chars(208).LATIN_SYMBOLS := 'Ya';

            v_chars(209).CYRILLIC_SYMBOL := N'Є';
            v_chars(209).LATIN_SYMBOLS := 'Ye';

            v_chars(210).CYRILLIC_SYMBOL := N'І';
            v_chars(210).LATIN_SYMBOLS := 'I';

            v_chars(211).CYRILLIC_SYMBOL := N'Ї';
            v_chars(211).LATIN_SYMBOLS := 'Yi';

            v_chars(212).CYRILLIC_SYMBOL := N'Ґ';
            v_chars(212).LATIN_SYMBOLS := 'G';

            v_chars(213).CYRILLIC_SYMBOL := N'є';
            v_chars(213).LATIN_SYMBOLS := 'ye';

            v_chars(214).CYRILLIC_SYMBOL := N'і';
            v_chars(214).LATIN_SYMBOLS := 'i';

            v_chars(215).CYRILLIC_SYMBOL := N'ї';
            v_chars(215).LATIN_SYMBOLS := 'yi';

            v_chars(216).CYRILLIC_SYMBOL := N'ґ';
            v_chars(216).LATIN_SYMBOLS := 'g';

            v_chars(217).CYRILLIC_SYMBOL := N'č';
            v_chars(217).LATIN_SYMBOLS := 'c';

            v_chars(218).CYRILLIC_SYMBOL := N'ď';
            v_chars(218).LATIN_SYMBOLS := 'd';

            v_chars(219).CYRILLIC_SYMBOL := N'ě';
            v_chars(219).LATIN_SYMBOLS := 'e';

            v_chars(220).CYRILLIC_SYMBOL := N'ň';
            v_chars(220).LATIN_SYMBOLS := 'n';

            v_chars(221).CYRILLIC_SYMBOL := N'ř';
            v_chars(221).LATIN_SYMBOLS := 'r';

            v_chars(222).CYRILLIC_SYMBOL := N'š';
            v_chars(222).LATIN_SYMBOLS := 's';

            v_chars(223).CYRILLIC_SYMBOL := N'ť';
            v_chars(223).LATIN_SYMBOLS := 't';

            v_chars(224).CYRILLIC_SYMBOL := N'ů';
            v_chars(224).LATIN_SYMBOLS := 'u';

            v_chars(225).CYRILLIC_SYMBOL := N'ž';
            v_chars(225).LATIN_SYMBOLS := 'z';

            v_chars(226).CYRILLIC_SYMBOL := N'Č';
            v_chars(226).LATIN_SYMBOLS := 'C';

            v_chars(227).CYRILLIC_SYMBOL := N'Ď';
            v_chars(227).LATIN_SYMBOLS := 'D';

            v_chars(228).CYRILLIC_SYMBOL := N'Ě';
            v_chars(228).LATIN_SYMBOLS := 'E';

            v_chars(229).CYRILLIC_SYMBOL := N'Ň';
            v_chars(229).LATIN_SYMBOLS := 'N';

            v_chars(230).CYRILLIC_SYMBOL := N'Ř';
            v_chars(230).LATIN_SYMBOLS := 'R';

            v_chars(231).CYRILLIC_SYMBOL := N'Š';
            v_chars(231).LATIN_SYMBOLS := 'S';

            v_chars(232).CYRILLIC_SYMBOL := N'Ť';
            v_chars(232).LATIN_SYMBOLS := 'T';

            v_chars(233).CYRILLIC_SYMBOL := N'Ů';
            v_chars(233).LATIN_SYMBOLS := 'U';

            v_chars(234).CYRILLIC_SYMBOL := N'Ž';
            v_chars(234).LATIN_SYMBOLS := 'Z';

            v_chars(235).CYRILLIC_SYMBOL := N'ą';
            v_chars(235).LATIN_SYMBOLS := 'a';

            v_chars(236).CYRILLIC_SYMBOL := N'ć';
            v_chars(236).LATIN_SYMBOLS := 'c';

            v_chars(237).CYRILLIC_SYMBOL := N'ę';
            v_chars(237).LATIN_SYMBOLS := 'e';

            v_chars(238).CYRILLIC_SYMBOL := N'ł';
            v_chars(238).LATIN_SYMBOLS := 'l';

            v_chars(239).CYRILLIC_SYMBOL := N'ń';
            v_chars(239).LATIN_SYMBOLS := 'n';

            v_chars(240).CYRILLIC_SYMBOL := N'ś';
            v_chars(240).LATIN_SYMBOLS := 's';

            v_chars(241).CYRILLIC_SYMBOL := N'ź';
            v_chars(241).LATIN_SYMBOLS := 'z';

            v_chars(242).CYRILLIC_SYMBOL := N'ż';
            v_chars(242).LATIN_SYMBOLS := 'z';

            v_chars(243).CYRILLIC_SYMBOL := N'Ą';
            v_chars(243).LATIN_SYMBOLS := 'A';

            v_chars(244).CYRILLIC_SYMBOL := N'Ć';
            v_chars(244).LATIN_SYMBOLS := 'C';

            v_chars(245).CYRILLIC_SYMBOL := N'Ę';
            v_chars(245).LATIN_SYMBOLS := 'E';

            v_chars(246).CYRILLIC_SYMBOL := N'Ł';
            v_chars(246).LATIN_SYMBOLS := 'L';

            v_chars(247).CYRILLIC_SYMBOL := N'Ń';
            v_chars(247).LATIN_SYMBOLS := 'N';

            v_chars(248).CYRILLIC_SYMBOL := N'Ś';
            v_chars(248).LATIN_SYMBOLS := 'S';

            v_chars(249).CYRILLIC_SYMBOL := N'Ź';
            v_chars(249).LATIN_SYMBOLS := 'Z';

            v_chars(250).CYRILLIC_SYMBOL := N'Ż';
            v_chars(250).LATIN_SYMBOLS := 'Z';

            v_chars(251).CYRILLIC_SYMBOL := N'ā';
            v_chars(251).LATIN_SYMBOLS := 'a';

            v_chars(252).CYRILLIC_SYMBOL := N'ē';
            v_chars(252).LATIN_SYMBOLS := 'e';

            v_chars(253).CYRILLIC_SYMBOL := N'ģ';
            v_chars(253).LATIN_SYMBOLS := 'g';

            v_chars(254).CYRILLIC_SYMBOL := N'ī';
            v_chars(254).LATIN_SYMBOLS := 'i';

            v_chars(255).CYRILLIC_SYMBOL := N'ķ';
            v_chars(255).LATIN_SYMBOLS := 'k';

            v_chars(256).CYRILLIC_SYMBOL := N'ļ';
            v_chars(256).LATIN_SYMBOLS := 'l';

            v_chars(257).CYRILLIC_SYMBOL := N'ņ';
            v_chars(257).LATIN_SYMBOLS := 'n';

            v_chars(258).CYRILLIC_SYMBOL := N'ū';
            v_chars(258).LATIN_SYMBOLS := 'u';

            v_chars(259).CYRILLIC_SYMBOL := N'Ā';
            v_chars(259).LATIN_SYMBOLS := 'A';

            v_chars(260).CYRILLIC_SYMBOL := N'Ē';
            v_chars(260).LATIN_SYMBOLS := 'E';

            v_chars(261).CYRILLIC_SYMBOL := N'Ģ';
            v_chars(261).LATIN_SYMBOLS := 'G';

            v_chars(262).CYRILLIC_SYMBOL := N'Ī';
            v_chars(262).LATIN_SYMBOLS := 'I';

            v_chars(263).CYRILLIC_SYMBOL := N'Ķ';
            v_chars(263).LATIN_SYMBOLS := 'K';

            v_chars(264).CYRILLIC_SYMBOL := N'Ļ';
            v_chars(264).LATIN_SYMBOLS := 'L';

            v_chars(265).CYRILLIC_SYMBOL := N'Ņ';
            v_chars(265).LATIN_SYMBOLS := 'N';

            v_chars(266).CYRILLIC_SYMBOL := N'Ū';
            v_chars(266).LATIN_SYMBOLS := 'U';

            v_chars(267).CYRILLIC_SYMBOL := N'ė';
            v_chars(267).LATIN_SYMBOLS := 'e';

            v_chars(268).CYRILLIC_SYMBOL := N'į';
            v_chars(268).LATIN_SYMBOLS := 'i';

            v_chars(269).CYRILLIC_SYMBOL := N'ų';
            v_chars(269).LATIN_SYMBOLS := 'u';

            v_chars(270).CYRILLIC_SYMBOL := N'Ė';
            v_chars(270).LATIN_SYMBOLS := 'E';

            v_chars(271).CYRILLIC_SYMBOL := N'Į';
            v_chars(271).LATIN_SYMBOLS := 'I';

            v_chars(272).CYRILLIC_SYMBOL := N'Ų';
            v_chars(272).LATIN_SYMBOLS := 'U';

            v_chars(273).CYRILLIC_SYMBOL := N'ț';
            v_chars(273).LATIN_SYMBOLS := 't';

            v_chars(274).CYRILLIC_SYMBOL := N'Ț';
            v_chars(274).LATIN_SYMBOLS := 'T';

            v_chars(275).CYRILLIC_SYMBOL := N'ţ';
            v_chars(275).LATIN_SYMBOLS := 't';

            v_chars(276).CYRILLIC_SYMBOL := N'Ţ';
            v_chars(276).LATIN_SYMBOLS := 'T';

            v_chars(277).CYRILLIC_SYMBOL := N'ș';
            v_chars(277).LATIN_SYMBOLS := 's';

            v_chars(278).CYRILLIC_SYMBOL := N'Ș';
            v_chars(278).LATIN_SYMBOLS := 'S';

            v_chars(279).CYRILLIC_SYMBOL := N'ă';
            v_chars(279).LATIN_SYMBOLS := 'a';

            v_chars(280).CYRILLIC_SYMBOL := N'Ă';
            v_chars(280).LATIN_SYMBOLS := 'A';

            v_chars(281).CYRILLIC_SYMBOL := N'Ạ';
            v_chars(281).LATIN_SYMBOLS := 'A';

            v_chars(282).CYRILLIC_SYMBOL := N'Ả';
            v_chars(282).LATIN_SYMBOLS := 'A';

            v_chars(283).CYRILLIC_SYMBOL := N'Ầ';
            v_chars(283).LATIN_SYMBOLS := 'A';

            v_chars(284).CYRILLIC_SYMBOL := N'Ấ';
            v_chars(284).LATIN_SYMBOLS := 'A';

            v_chars(285).CYRILLIC_SYMBOL := N'Ậ';
            v_chars(285).LATIN_SYMBOLS := 'A';

            v_chars(286).CYRILLIC_SYMBOL := N'Ẩ';
            v_chars(286).LATIN_SYMBOLS := 'A';

            v_chars(287).CYRILLIC_SYMBOL := N'Ẫ';
            v_chars(287).LATIN_SYMBOLS := 'A';

            v_chars(288).CYRILLIC_SYMBOL := N'Ằ';
            v_chars(288).LATIN_SYMBOLS := 'A';

            v_chars(289).CYRILLIC_SYMBOL := N'Ắ';
            v_chars(289).LATIN_SYMBOLS := 'A';

            v_chars(290).CYRILLIC_SYMBOL := N'Ặ';
            v_chars(290).LATIN_SYMBOLS := 'A';

            v_chars(291).CYRILLIC_SYMBOL := N'Ẳ';
            v_chars(291).LATIN_SYMBOLS := 'A';

            v_chars(292).CYRILLIC_SYMBOL := N'Ẵ';
            v_chars(292).LATIN_SYMBOLS := 'A';

            v_chars(293).CYRILLIC_SYMBOL := N'Ẹ';
            v_chars(293).LATIN_SYMBOLS := 'E';

            v_chars(294).CYRILLIC_SYMBOL := N'Ẻ';
            v_chars(294).LATIN_SYMBOLS := 'E';

            v_chars(295).CYRILLIC_SYMBOL := N'Ẽ';
            v_chars(295).LATIN_SYMBOLS := 'E';

            v_chars(296).CYRILLIC_SYMBOL := N'Ề';
            v_chars(296).LATIN_SYMBOLS := 'E';

            v_chars(297).CYRILLIC_SYMBOL := N'Ế';
            v_chars(297).LATIN_SYMBOLS := 'E';

            v_chars(298).CYRILLIC_SYMBOL := N'Ệ';
            v_chars(298).LATIN_SYMBOLS := 'E';

            v_chars(299).CYRILLIC_SYMBOL := N'Ể';
            v_chars(299).LATIN_SYMBOLS := 'E';

            v_chars(300).CYRILLIC_SYMBOL := N'Ễ';
            v_chars(300).LATIN_SYMBOLS := 'E';

            v_chars(301).CYRILLIC_SYMBOL := N'Ị';
            v_chars(301).LATIN_SYMBOLS := 'I';

            v_chars(302).CYRILLIC_SYMBOL := N'Ỉ';
            v_chars(302).LATIN_SYMBOLS := 'I';

            v_chars(303).CYRILLIC_SYMBOL := N'Ĩ';
            v_chars(303).LATIN_SYMBOLS := 'I';

            v_chars(304).CYRILLIC_SYMBOL := N'Ọ';
            v_chars(304).LATIN_SYMBOLS := 'O';

            v_chars(305).CYRILLIC_SYMBOL := N'Ỏ';
            v_chars(305).LATIN_SYMBOLS := 'O';

            v_chars(306).CYRILLIC_SYMBOL := N'Ồ';
            v_chars(306).LATIN_SYMBOLS := 'O';

            v_chars(307).CYRILLIC_SYMBOL := N'Ố';
            v_chars(307).LATIN_SYMBOLS := 'O';

            v_chars(308).CYRILLIC_SYMBOL := N'Ộ';
            v_chars(308).LATIN_SYMBOLS := 'O';

            v_chars(309).CYRILLIC_SYMBOL := N'Ổ';
            v_chars(309).LATIN_SYMBOLS := 'O';

            v_chars(310).CYRILLIC_SYMBOL := N'Ỗ';
            v_chars(310).LATIN_SYMBOLS := 'O';

            v_chars(311).CYRILLIC_SYMBOL := N'Ơ';
            v_chars(311).LATIN_SYMBOLS := 'O';

            v_chars(312).CYRILLIC_SYMBOL := N'Ờ';
            v_chars(312).LATIN_SYMBOLS := 'O';

            v_chars(313).CYRILLIC_SYMBOL := N'Ớ';
            v_chars(313).LATIN_SYMBOLS := 'O';

            v_chars(314).CYRILLIC_SYMBOL := N'Ợ';
            v_chars(314).LATIN_SYMBOLS := 'O';

            v_chars(315).CYRILLIC_SYMBOL := N'Ở';
            v_chars(315).LATIN_SYMBOLS := 'O';

            v_chars(316).CYRILLIC_SYMBOL := N'Ỡ';
            v_chars(316).LATIN_SYMBOLS := 'O';

            v_chars(317).CYRILLIC_SYMBOL := N'Ụ';
            v_chars(317).LATIN_SYMBOLS := 'U';

            v_chars(318).CYRILLIC_SYMBOL := N'Ủ';
            v_chars(318).LATIN_SYMBOLS := 'U';

            v_chars(319).CYRILLIC_SYMBOL := N'Ũ';
            v_chars(319).LATIN_SYMBOLS := 'U';

            v_chars(320).CYRILLIC_SYMBOL := N'Ư';
            v_chars(320).LATIN_SYMBOLS := 'U';

            v_chars(321).CYRILLIC_SYMBOL := N'Ừ';
            v_chars(321).LATIN_SYMBOLS := 'U';

            v_chars(322).CYRILLIC_SYMBOL := N'Ứ';
            v_chars(322).LATIN_SYMBOLS := 'U';

            v_chars(323).CYRILLIC_SYMBOL := N'Ự';
            v_chars(323).LATIN_SYMBOLS := 'U';

            v_chars(324).CYRILLIC_SYMBOL := N'Ử';
            v_chars(324).LATIN_SYMBOLS := 'U';

            v_chars(325).CYRILLIC_SYMBOL := N'Ữ';
            v_chars(325).LATIN_SYMBOLS := 'U';

            v_chars(326).CYRILLIC_SYMBOL := N'Ỳ';
            v_chars(326).LATIN_SYMBOLS := 'Y';

            v_chars(327).CYRILLIC_SYMBOL := N'Ỵ';
            v_chars(327).LATIN_SYMBOLS := 'Y';

            v_chars(328).CYRILLIC_SYMBOL := N'Ỷ';
            v_chars(328).LATIN_SYMBOLS := 'Y';

            v_chars(329).CYRILLIC_SYMBOL := N'Ỹ';
            v_chars(329).LATIN_SYMBOLS := 'Y';

            v_chars(330).CYRILLIC_SYMBOL := N'Đ';
            v_chars(330).LATIN_SYMBOLS := 'D';

            v_chars(331).CYRILLIC_SYMBOL := N'ạ';
            v_chars(331).LATIN_SYMBOLS := 'a';

            v_chars(332).CYRILLIC_SYMBOL := N'ả';
            v_chars(332).LATIN_SYMBOLS := 'a';

            v_chars(333).CYRILLIC_SYMBOL := N'ầ';
            v_chars(333).LATIN_SYMBOLS := 'a';

            v_chars(334).CYRILLIC_SYMBOL := N'ấ';
            v_chars(334).LATIN_SYMBOLS := 'a';

            v_chars(335).CYRILLIC_SYMBOL := N'ậ';
            v_chars(335).LATIN_SYMBOLS := 'a';

            v_chars(336).CYRILLIC_SYMBOL := N'ẩ';
            v_chars(336).LATIN_SYMBOLS := 'a';

            v_chars(337).CYRILLIC_SYMBOL := N'ẫ';
            v_chars(337).LATIN_SYMBOLS := 'a';

            v_chars(338).CYRILLIC_SYMBOL := N'ằ';
            v_chars(338).LATIN_SYMBOLS := 'a';

            v_chars(339).CYRILLIC_SYMBOL := N'ắ';
            v_chars(339).LATIN_SYMBOLS := 'a';

            v_chars(340).CYRILLIC_SYMBOL := N'ặ';
            v_chars(340).LATIN_SYMBOLS := 'a';

            v_chars(341).CYRILLIC_SYMBOL := N'ẳ';
            v_chars(341).LATIN_SYMBOLS := 'a';

            v_chars(342).CYRILLIC_SYMBOL := N'ẵ';
            v_chars(342).LATIN_SYMBOLS := 'a';

            v_chars(343).CYRILLIC_SYMBOL := N'ẹ';
            v_chars(343).LATIN_SYMBOLS := 'e';

            v_chars(344).CYRILLIC_SYMBOL := N'ẻ';
            v_chars(344).LATIN_SYMBOLS := 'e';

            v_chars(345).CYRILLIC_SYMBOL := N'ẽ';
            v_chars(345).LATIN_SYMBOLS := 'e';

            v_chars(346).CYRILLIC_SYMBOL := N'ề';
            v_chars(346).LATIN_SYMBOLS := 'e';

            v_chars(347).CYRILLIC_SYMBOL := N'ế';
            v_chars(347).LATIN_SYMBOLS := 'e';

            v_chars(348).CYRILLIC_SYMBOL := N'ệ';
            v_chars(348).LATIN_SYMBOLS := 'e';

            v_chars(349).CYRILLIC_SYMBOL := N'ể';
            v_chars(349).LATIN_SYMBOLS := 'e';

            v_chars(350).CYRILLIC_SYMBOL := N'ễ';
            v_chars(350).LATIN_SYMBOLS := 'e';

            v_chars(351).CYRILLIC_SYMBOL := N'ị';
            v_chars(351).LATIN_SYMBOLS := 'i';

            v_chars(352).CYRILLIC_SYMBOL := N'ỉ';
            v_chars(352).LATIN_SYMBOLS := 'i';

            v_chars(353).CYRILLIC_SYMBOL := N'ĩ';
            v_chars(353).LATIN_SYMBOLS := 'i';

            v_chars(354).CYRILLIC_SYMBOL := N'ọ';
            v_chars(354).LATIN_SYMBOLS := 'o';

            v_chars(355).CYRILLIC_SYMBOL := N'ỏ';
            v_chars(355).LATIN_SYMBOLS := 'o';

            v_chars(356).CYRILLIC_SYMBOL := N'ồ';
            v_chars(356).LATIN_SYMBOLS := 'o';

            v_chars(357).CYRILLIC_SYMBOL := N'ố';
            v_chars(357).LATIN_SYMBOLS := 'o';

            v_chars(358).CYRILLIC_SYMBOL := N'ộ';
            v_chars(358).LATIN_SYMBOLS := 'o';

            v_chars(359).CYRILLIC_SYMBOL := N'ổ';
            v_chars(359).LATIN_SYMBOLS := 'o';

            v_chars(360).CYRILLIC_SYMBOL := N'ỗ';
            v_chars(360).LATIN_SYMBOLS := 'o';

            v_chars(361).CYRILLIC_SYMBOL := N'ơ';
            v_chars(361).LATIN_SYMBOLS := 'o';

            v_chars(362).CYRILLIC_SYMBOL := N'ờ';
            v_chars(362).LATIN_SYMBOLS := 'o';

            v_chars(363).CYRILLIC_SYMBOL := N'ớ';
            v_chars(363).LATIN_SYMBOLS := 'o';

            v_chars(364).CYRILLIC_SYMBOL := N'ợ';
            v_chars(364).LATIN_SYMBOLS := 'o';

            v_chars(365).CYRILLIC_SYMBOL := N'ở';
            v_chars(365).LATIN_SYMBOLS := 'o';

            v_chars(366).CYRILLIC_SYMBOL := N'ỡ';
            v_chars(366).LATIN_SYMBOLS := 'o';

            v_chars(367).CYRILLIC_SYMBOL := N'ụ';
            v_chars(367).LATIN_SYMBOLS := 'u';

            v_chars(368).CYRILLIC_SYMBOL := N'ủ';
            v_chars(368).LATIN_SYMBOLS := 'u';

            v_chars(369).CYRILLIC_SYMBOL := N'ũ';
            v_chars(369).LATIN_SYMBOLS := 'u';

            v_chars(370).CYRILLIC_SYMBOL := N'ư';
            v_chars(370).LATIN_SYMBOLS := 'u';

            v_chars(371).CYRILLIC_SYMBOL := N'ừ';
            v_chars(371).LATIN_SYMBOLS := 'u';

            v_chars(372).CYRILLIC_SYMBOL := N'ứ';
            v_chars(372).LATIN_SYMBOLS := 'u';

            v_chars(373).CYRILLIC_SYMBOL := N'ự';
            v_chars(373).LATIN_SYMBOLS := 'u';

            v_chars(374).CYRILLIC_SYMBOL := N'ử';
            v_chars(374).LATIN_SYMBOLS := 'u';

            v_chars(375).CYRILLIC_SYMBOL := N'ữ';
            v_chars(375).LATIN_SYMBOLS := 'u';

            v_chars(376).CYRILLIC_SYMBOL := N'ỳ';
            v_chars(376).LATIN_SYMBOLS := 'y';

            v_chars(377).CYRILLIC_SYMBOL := N'ỵ';
            v_chars(377).LATIN_SYMBOLS := 'y';

            v_chars(378).CYRILLIC_SYMBOL := N'ỷ';
            v_chars(378).LATIN_SYMBOLS := 'y';

            v_chars(379).CYRILLIC_SYMBOL := N'ỹ';
            v_chars(379).LATIN_SYMBOLS := 'y';

            v_chars(380).CYRILLIC_SYMBOL := N'đ';
            v_chars(380).LATIN_SYMBOLS := 'd';

            v_chars(381).CYRILLIC_SYMBOL := N'€';
            v_chars(381).LATIN_SYMBOLS := 'euro';

            v_chars(382).CYRILLIC_SYMBOL := N'₢';
            v_chars(382).LATIN_SYMBOLS := 'cruzeiro';

            v_chars(383).CYRILLIC_SYMBOL := N'₣';
            v_chars(383).LATIN_SYMBOLS := 'french franc';

            v_chars(384).CYRILLIC_SYMBOL := N'£';
            v_chars(384).LATIN_SYMBOLS := 'pound';

            v_chars(385).CYRILLIC_SYMBOL := N'₤';
            v_chars(385).LATIN_SYMBOLS := 'lira';

            v_chars(386).CYRILLIC_SYMBOL := N'₥';
            v_chars(386).LATIN_SYMBOLS := 'mill';

            v_chars(387).CYRILLIC_SYMBOL := N'₦';
            v_chars(387).LATIN_SYMBOLS := 'naira';

            v_chars(388).CYRILLIC_SYMBOL := N'₧';
            v_chars(388).LATIN_SYMBOLS := 'peseta';

            v_chars(389).CYRILLIC_SYMBOL := N'₨';
            v_chars(389).LATIN_SYMBOLS := 'rupee';

            v_chars(390).CYRILLIC_SYMBOL := N'₩';
            v_chars(390).LATIN_SYMBOLS := 'won';

            v_chars(391).CYRILLIC_SYMBOL := N'₪';
            v_chars(391).LATIN_SYMBOLS := 'new shequel';

            v_chars(392).CYRILLIC_SYMBOL := N'₫';
            v_chars(392).LATIN_SYMBOLS := 'dong';

            v_chars(393).CYRILLIC_SYMBOL := N'₭';
            v_chars(393).LATIN_SYMBOLS := 'kip';

            v_chars(394).CYRILLIC_SYMBOL := N'₮';
            v_chars(394).LATIN_SYMBOLS := 'tugrik';

            v_chars(395).CYRILLIC_SYMBOL := N'₯';
            v_chars(395).LATIN_SYMBOLS := 'drachma';

            v_chars(396).CYRILLIC_SYMBOL := N'₰';
            v_chars(396).LATIN_SYMBOLS := 'penny';

            v_chars(397).CYRILLIC_SYMBOL := N'₱';
            v_chars(397).LATIN_SYMBOLS := 'peso';

            v_chars(398).CYRILLIC_SYMBOL := N'₲';
            v_chars(398).LATIN_SYMBOLS := 'guarani';

            v_chars(399).CYRILLIC_SYMBOL := N'₳';
            v_chars(399).LATIN_SYMBOLS := 'austral';

            v_chars(400).CYRILLIC_SYMBOL := N'₴';
            v_chars(400).LATIN_SYMBOLS := 'hryvnia';

            v_chars(401).CYRILLIC_SYMBOL := N'₵';
            v_chars(401).LATIN_SYMBOLS := 'cedi';

            v_chars(402).CYRILLIC_SYMBOL := N'¢';
            v_chars(402).LATIN_SYMBOLS := 'cent';

            v_chars(403).CYRILLIC_SYMBOL := N'¥';
            v_chars(403).LATIN_SYMBOLS := 'yen';

            v_chars(404).CYRILLIC_SYMBOL := N'元';
            v_chars(404).LATIN_SYMBOLS := 'yuan';

            v_chars(405).CYRILLIC_SYMBOL := N'円';
            v_chars(405).LATIN_SYMBOLS := 'yen';

            v_chars(406).CYRILLIC_SYMBOL := N'﷼';
            v_chars(406).LATIN_SYMBOLS := 'rial';

            v_chars(407).CYRILLIC_SYMBOL := N'₠';
            v_chars(407).LATIN_SYMBOLS := 'ecu';

            v_chars(408).CYRILLIC_SYMBOL := N'¤';
            v_chars(408).LATIN_SYMBOLS := 'currency';

            v_chars(409).CYRILLIC_SYMBOL := N'฿';
            v_chars(409).LATIN_SYMBOLS := 'baht';

            v_chars(410).CYRILLIC_SYMBOL := N'$';
            v_chars(410).LATIN_SYMBOLS := 'dollar';

            v_chars(411).CYRILLIC_SYMBOL := N'₹';
            v_chars(411).LATIN_SYMBOLS := 'indian rupee';

            v_chars(412).CYRILLIC_SYMBOL := N'©';
            v_chars(412).LATIN_SYMBOLS := '(c)';

            v_chars(413).CYRILLIC_SYMBOL := N'œ';
            v_chars(413).LATIN_SYMBOLS := 'oe';

            v_chars(414).CYRILLIC_SYMBOL := N'Œ';
            v_chars(414).LATIN_SYMBOLS := 'OE';

            v_chars(415).CYRILLIC_SYMBOL := N'∑';
            v_chars(415).LATIN_SYMBOLS := 'sum';

            v_chars(416).CYRILLIC_SYMBOL := N'®';
            v_chars(416).LATIN_SYMBOLS := '(r)';

            v_chars(417).CYRILLIC_SYMBOL := N'†';
            v_chars(417).LATIN_SYMBOLS := '+';

            v_chars(418).CYRILLIC_SYMBOL := N'∂';
            v_chars(418).LATIN_SYMBOLS := 'd';

            v_chars(419).CYRILLIC_SYMBOL := N'ƒ';
            v_chars(419).LATIN_SYMBOLS := 'f';

            v_chars(420).CYRILLIC_SYMBOL := N'™';
            v_chars(420).LATIN_SYMBOLS := 'tm';

            v_chars(421).CYRILLIC_SYMBOL := N'℠';
            v_chars(421).LATIN_SYMBOLS := 'sm';

            v_chars(422).CYRILLIC_SYMBOL := N'…';
            v_chars(422).LATIN_SYMBOLS := '...';

            v_chars(423).CYRILLIC_SYMBOL := N'˚';
            v_chars(423).LATIN_SYMBOLS := 'o';

            v_chars(424).CYRILLIC_SYMBOL := N'º';
            v_chars(424).LATIN_SYMBOLS := 'o';

            v_chars(425).CYRILLIC_SYMBOL := N'ª';
            v_chars(425).LATIN_SYMBOLS := 'a';

            v_chars(426).CYRILLIC_SYMBOL := N'•';
            v_chars(426).LATIN_SYMBOLS := '*';

            v_chars(427).CYRILLIC_SYMBOL := N'∆';
            v_chars(427).LATIN_SYMBOLS := 'delta';

            v_chars(428).CYRILLIC_SYMBOL := N'∞';
            v_chars(428).LATIN_SYMBOLS := 'infinity';

            v_chars(429).CYRILLIC_SYMBOL := N'♥';
            v_chars(429).LATIN_SYMBOLS := 'love';

            v_chars(430).CYRILLIC_SYMBOL := N'&';
            v_chars(430).LATIN_SYMBOLS := 'and';

            v_chars(431).CYRILLIC_SYMBOL := N'|';
            v_chars(431).LATIN_SYMBOLS := 'or';

            v_chars(432).CYRILLIC_SYMBOL := N'<';
            v_chars(432).LATIN_SYMBOLS := 'less';

            v_chars(433).CYRILLIC_SYMBOL := N'>';
            v_chars(433).LATIN_SYMBOLS := 'greater';

            
            return v_chars;
        end;
    begin
        v_chars := init_chars();
        v_index := v_chars.FIRST;
        while (v_index is not null) loop
            l_parsed_string := replace(l_parsed_string, v_chars(v_index).CYRILLIC_SYMBOL, v_chars(v_index).LATIN_SYMBOLS);
            v_index := v_chars.next(v_index);
        end loop;
        
        return l_parsed_string;
    end;

END slug_util;
/