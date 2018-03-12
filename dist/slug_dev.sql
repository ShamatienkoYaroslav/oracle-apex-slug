/*
Created by Shamatienko Yaroslav (shamatienko.yaroslav@gmail.com)
*/

prompt *** Installing PL/SQL-SLUG ***

-- PREPARE

prompt *** Drop Old Tables and Packages ***

DROP TABLE slug_symbols_dev;
/
DROP PACKAGE slug_util_dev;
/

-- CREATE TABLE

prompt *** Tables ***

CREATE TABLE slug_symbols_dev (
cyrillic_symbol   NVARCHAR2(10) NOT NULL,
latin_symbols     VARCHAR2(10)
);
/

ALTER TABLE slug_symbols_dev
ADD CONSTRAINT slug_symbols_cyrillic_dev UNIQUE 
(
CYRILLIC_SYMBOL 
)
ENABLE;
/

COMMENT ON COLUMN slug_symbols_dev.cyrillic_symbol IS
'Cyrillic symbol';
/

COMMENT ON COLUMN slug_symbols_dev.latin_symbols IS
'Latin symbols to change cyrillic symbol';
/
INSERT INTO slug_symbols_dev VALUES(N'À', 'A');/
INSERT INTO slug_symbols_dev VALUES(N'Á', 'A');/
INSERT INTO slug_symbols_dev VALUES(N'Â', 'A');/
INSERT INTO slug_symbols_dev VALUES(N'Ã', 'A');/
INSERT INTO slug_symbols_dev VALUES(N'Ä', 'A');/
INSERT INTO slug_symbols_dev VALUES(N'Å', 'A');/
INSERT INTO slug_symbols_dev VALUES(N'Æ', 'AE');/
INSERT INTO slug_symbols_dev VALUES(N'Ç', 'C');/
INSERT INTO slug_symbols_dev VALUES(N'È', 'E');/
INSERT INTO slug_symbols_dev VALUES(N'É', 'E');/
INSERT INTO slug_symbols_dev VALUES(N'Ê', 'E');/
INSERT INTO slug_symbols_dev VALUES(N'Ë', 'E');/
INSERT INTO slug_symbols_dev VALUES(N'Ì', 'I');/
INSERT INTO slug_symbols_dev VALUES(N'Í', 'I');/
INSERT INTO slug_symbols_dev VALUES(N'Î', 'I');/
INSERT INTO slug_symbols_dev VALUES(N'Ï', 'I');/
INSERT INTO slug_symbols_dev VALUES(N'Ð', 'D');/
INSERT INTO slug_symbols_dev VALUES(N'Ñ', 'N');/
INSERT INTO slug_symbols_dev VALUES(N'Ò', 'O');/
INSERT INTO slug_symbols_dev VALUES(N'Ó', 'O');/
INSERT INTO slug_symbols_dev VALUES(N'Ô', 'O');/
INSERT INTO slug_symbols_dev VALUES(N'Õ', 'O');/
INSERT INTO slug_symbols_dev VALUES(N'Ö', 'O');/
INSERT INTO slug_symbols_dev VALUES(N'Ő', 'O');/
INSERT INTO slug_symbols_dev VALUES(N'Ø', 'O');/
INSERT INTO slug_symbols_dev VALUES(N'Ù', 'U');/
INSERT INTO slug_symbols_dev VALUES(N'Ú', 'U');/
INSERT INTO slug_symbols_dev VALUES(N'Û', 'U');/
INSERT INTO slug_symbols_dev VALUES(N'Ü', 'U');/
INSERT INTO slug_symbols_dev VALUES(N'Ű', 'U');/
INSERT INTO slug_symbols_dev VALUES(N'Ý', 'Y');/
INSERT INTO slug_symbols_dev VALUES(N'Þ', 'TH');/
INSERT INTO slug_symbols_dev VALUES(N'ß', 'ss');/
INSERT INTO slug_symbols_dev VALUES(N'à', 'a');/
INSERT INTO slug_symbols_dev VALUES(N'á', 'a');/
INSERT INTO slug_symbols_dev VALUES(N'â', 'a');/
INSERT INTO slug_symbols_dev VALUES(N'ã', 'a');/
INSERT INTO slug_symbols_dev VALUES(N'ä', 'a');/
INSERT INTO slug_symbols_dev VALUES(N'å', 'a');/
INSERT INTO slug_symbols_dev VALUES(N'æ', 'ae');/
INSERT INTO slug_symbols_dev VALUES(N'ç', 'c');/
INSERT INTO slug_symbols_dev VALUES(N'è', 'e');/
INSERT INTO slug_symbols_dev VALUES(N'é', 'e');/
INSERT INTO slug_symbols_dev VALUES(N'ê', 'e');/
INSERT INTO slug_symbols_dev VALUES(N'ë', 'e');/
INSERT INTO slug_symbols_dev VALUES(N'ì', 'i');/
INSERT INTO slug_symbols_dev VALUES(N'í', 'i');/
INSERT INTO slug_symbols_dev VALUES(N'î', 'i');/
INSERT INTO slug_symbols_dev VALUES(N'ï', 'i');/
INSERT INTO slug_symbols_dev VALUES(N'ð', 'd');/
INSERT INTO slug_symbols_dev VALUES(N'ñ', 'n');/
INSERT INTO slug_symbols_dev VALUES(N'ò', 'o');/
INSERT INTO slug_symbols_dev VALUES(N'ó', 'o');/
INSERT INTO slug_symbols_dev VALUES(N'ô', 'o');/
INSERT INTO slug_symbols_dev VALUES(N'õ', 'o');/
INSERT INTO slug_symbols_dev VALUES(N'ö', 'o');/
INSERT INTO slug_symbols_dev VALUES(N'ő', 'o');/
INSERT INTO slug_symbols_dev VALUES(N'ø', 'o');/
INSERT INTO slug_symbols_dev VALUES(N'ù', 'u');/
INSERT INTO slug_symbols_dev VALUES(N'ú', 'u');/
INSERT INTO slug_symbols_dev VALUES(N'û', 'u');/
INSERT INTO slug_symbols_dev VALUES(N'ü', 'u');/
INSERT INTO slug_symbols_dev VALUES(N'ű', 'u');/
INSERT INTO slug_symbols_dev VALUES(N'ý', 'y');/
INSERT INTO slug_symbols_dev VALUES(N'þ', 'th');/
INSERT INTO slug_symbols_dev VALUES(N'ÿ', 'y');/
INSERT INTO slug_symbols_dev VALUES(N'ẞ', 'SS');/
INSERT INTO slug_symbols_dev VALUES(N'α', 'a');/
INSERT INTO slug_symbols_dev VALUES(N'β', 'b');/
INSERT INTO slug_symbols_dev VALUES(N'γ', 'g');/
INSERT INTO slug_symbols_dev VALUES(N'δ', 'd');/
INSERT INTO slug_symbols_dev VALUES(N'ε', 'e');/
INSERT INTO slug_symbols_dev VALUES(N'ζ', 'z');/
INSERT INTO slug_symbols_dev VALUES(N'η', 'h');/
INSERT INTO slug_symbols_dev VALUES(N'θ', '8');/
INSERT INTO slug_symbols_dev VALUES(N'ι', 'i');/
INSERT INTO slug_symbols_dev VALUES(N'κ', 'k');/
INSERT INTO slug_symbols_dev VALUES(N'λ', 'l');/
INSERT INTO slug_symbols_dev VALUES(N'μ', 'm');/
INSERT INTO slug_symbols_dev VALUES(N'ν', 'n');/
INSERT INTO slug_symbols_dev VALUES(N'ξ', '3');/
INSERT INTO slug_symbols_dev VALUES(N'ο', 'o');/
INSERT INTO slug_symbols_dev VALUES(N'π', 'p');/
INSERT INTO slug_symbols_dev VALUES(N'ρ', 'r');/
INSERT INTO slug_symbols_dev VALUES(N'σ', 's');/
INSERT INTO slug_symbols_dev VALUES(N'τ', 't');/
INSERT INTO slug_symbols_dev VALUES(N'υ', 'y');/
INSERT INTO slug_symbols_dev VALUES(N'φ', 'f');/
INSERT INTO slug_symbols_dev VALUES(N'χ', 'x');/
INSERT INTO slug_symbols_dev VALUES(N'ψ', 'ps');/
INSERT INTO slug_symbols_dev VALUES(N'ω', 'w');/
INSERT INTO slug_symbols_dev VALUES(N'ά', 'a');/
INSERT INTO slug_symbols_dev VALUES(N'έ', 'e');/
INSERT INTO slug_symbols_dev VALUES(N'ί', 'i');/
INSERT INTO slug_symbols_dev VALUES(N'ό', 'o');/
INSERT INTO slug_symbols_dev VALUES(N'ύ', 'y');/
INSERT INTO slug_symbols_dev VALUES(N'ή', 'h');/
INSERT INTO slug_symbols_dev VALUES(N'ώ', 'w');/
INSERT INTO slug_symbols_dev VALUES(N'ς', 's');/
INSERT INTO slug_symbols_dev VALUES(N'ϊ', 'i');/
INSERT INTO slug_symbols_dev VALUES(N'ΰ', 'y');/
INSERT INTO slug_symbols_dev VALUES(N'ϋ', 'y');/
INSERT INTO slug_symbols_dev VALUES(N'ΐ', 'i');/
INSERT INTO slug_symbols_dev VALUES(N'Α', 'A');/
INSERT INTO slug_symbols_dev VALUES(N'Β', 'B');/
INSERT INTO slug_symbols_dev VALUES(N'Γ', 'G');/
INSERT INTO slug_symbols_dev VALUES(N'Δ', 'D');/
INSERT INTO slug_symbols_dev VALUES(N'Ε', 'E');/
INSERT INTO slug_symbols_dev VALUES(N'Ζ', 'Z');/
INSERT INTO slug_symbols_dev VALUES(N'Η', 'H');/
INSERT INTO slug_symbols_dev VALUES(N'Θ', '8');/
INSERT INTO slug_symbols_dev VALUES(N'Ι', 'I');/
INSERT INTO slug_symbols_dev VALUES(N'Κ', 'K');/
INSERT INTO slug_symbols_dev VALUES(N'Λ', 'L');/
INSERT INTO slug_symbols_dev VALUES(N'Μ', 'M');/
INSERT INTO slug_symbols_dev VALUES(N'Ν', 'N');/
INSERT INTO slug_symbols_dev VALUES(N'Ξ', '3');/
INSERT INTO slug_symbols_dev VALUES(N'Ο', 'O');/
INSERT INTO slug_symbols_dev VALUES(N'Π', 'P');/
INSERT INTO slug_symbols_dev VALUES(N'Ρ', 'R');/
INSERT INTO slug_symbols_dev VALUES(N'Σ', 'S');/
INSERT INTO slug_symbols_dev VALUES(N'Τ', 'T');/
INSERT INTO slug_symbols_dev VALUES(N'Υ', 'Y');/
INSERT INTO slug_symbols_dev VALUES(N'Φ', 'F');/
INSERT INTO slug_symbols_dev VALUES(N'Χ', 'X');/
INSERT INTO slug_symbols_dev VALUES(N'Ψ', 'PS');/
INSERT INTO slug_symbols_dev VALUES(N'Ω', 'W');/
INSERT INTO slug_symbols_dev VALUES(N'Ά', 'A');/
INSERT INTO slug_symbols_dev VALUES(N'Έ', 'E');/
INSERT INTO slug_symbols_dev VALUES(N'Ί', 'I');/
INSERT INTO slug_symbols_dev VALUES(N'Ό', 'O');/
INSERT INTO slug_symbols_dev VALUES(N'Ύ', 'Y');/
INSERT INTO slug_symbols_dev VALUES(N'Ή', 'H');/
INSERT INTO slug_symbols_dev VALUES(N'Ώ', 'W');/
INSERT INTO slug_symbols_dev VALUES(N'Ϊ', 'I');/
INSERT INTO slug_symbols_dev VALUES(N'Ϋ', 'Y');/
INSERT INTO slug_symbols_dev VALUES(N'ş', 's');/
INSERT INTO slug_symbols_dev VALUES(N'Ş', 'S');/
INSERT INTO slug_symbols_dev VALUES(N'ı', 'i');/
INSERT INTO slug_symbols_dev VALUES(N'İ', 'I');/
INSERT INTO slug_symbols_dev VALUES(N'ğ', 'g');/
INSERT INTO slug_symbols_dev VALUES(N'Ğ', 'G');/
INSERT INTO slug_symbols_dev VALUES(N'а', 'a');/
INSERT INTO slug_symbols_dev VALUES(N'б', 'b');/
INSERT INTO slug_symbols_dev VALUES(N'в', 'v');/
INSERT INTO slug_symbols_dev VALUES(N'г', 'g');/
INSERT INTO slug_symbols_dev VALUES(N'д', 'd');/
INSERT INTO slug_symbols_dev VALUES(N'е', 'e');/
INSERT INTO slug_symbols_dev VALUES(N'ё', 'yo');/
INSERT INTO slug_symbols_dev VALUES(N'ж', 'zh');/
INSERT INTO slug_symbols_dev VALUES(N'з', 'z');/
INSERT INTO slug_symbols_dev VALUES(N'и', 'i');/
INSERT INTO slug_symbols_dev VALUES(N'й', 'j');/
INSERT INTO slug_symbols_dev VALUES(N'к', 'k');/
INSERT INTO slug_symbols_dev VALUES(N'л', 'l');/
INSERT INTO slug_symbols_dev VALUES(N'м', 'm');/
INSERT INTO slug_symbols_dev VALUES(N'н', 'n');/
INSERT INTO slug_symbols_dev VALUES(N'о', 'o');/
INSERT INTO slug_symbols_dev VALUES(N'п', 'p');/
INSERT INTO slug_symbols_dev VALUES(N'р', 'r');/
INSERT INTO slug_symbols_dev VALUES(N'с', 's');/
INSERT INTO slug_symbols_dev VALUES(N'т', 't');/
INSERT INTO slug_symbols_dev VALUES(N'у', 'u');/
INSERT INTO slug_symbols_dev VALUES(N'ф', 'f');/
INSERT INTO slug_symbols_dev VALUES(N'х', 'h');/
INSERT INTO slug_symbols_dev VALUES(N'ц', 'c');/
INSERT INTO slug_symbols_dev VALUES(N'ч', 'ch');/
INSERT INTO slug_symbols_dev VALUES(N'ш', 'sh');/
INSERT INTO slug_symbols_dev VALUES(N'щ', 'sh');/
INSERT INTO slug_symbols_dev VALUES(N'ъ', 'u');/
INSERT INTO slug_symbols_dev VALUES(N'ы', 'y');/
INSERT INTO slug_symbols_dev VALUES(N'ь', '');/
INSERT INTO slug_symbols_dev VALUES(N'э', 'e');/
INSERT INTO slug_symbols_dev VALUES(N'ю', 'yu');/
INSERT INTO slug_symbols_dev VALUES(N'я', 'ya');/
INSERT INTO slug_symbols_dev VALUES(N'А', 'A');/
INSERT INTO slug_symbols_dev VALUES(N'Б', 'B');/
INSERT INTO slug_symbols_dev VALUES(N'В', 'V');/
INSERT INTO slug_symbols_dev VALUES(N'Г', 'G');/
INSERT INTO slug_symbols_dev VALUES(N'Д', 'D');/
INSERT INTO slug_symbols_dev VALUES(N'Е', 'E');/
INSERT INTO slug_symbols_dev VALUES(N'Ё', 'Yo');/
INSERT INTO slug_symbols_dev VALUES(N'Ж', 'Zh');/
INSERT INTO slug_symbols_dev VALUES(N'З', 'Z');/
INSERT INTO slug_symbols_dev VALUES(N'И', 'I');/
INSERT INTO slug_symbols_dev VALUES(N'Й', 'J');/
INSERT INTO slug_symbols_dev VALUES(N'К', 'K');/
INSERT INTO slug_symbols_dev VALUES(N'Л', 'L');/
INSERT INTO slug_symbols_dev VALUES(N'М', 'M');/
INSERT INTO slug_symbols_dev VALUES(N'Н', 'N');/
INSERT INTO slug_symbols_dev VALUES(N'О', 'O');/
INSERT INTO slug_symbols_dev VALUES(N'П', 'P');/
INSERT INTO slug_symbols_dev VALUES(N'Р', 'R');/
INSERT INTO slug_symbols_dev VALUES(N'С', 'S');/
INSERT INTO slug_symbols_dev VALUES(N'Т', 'T');/
INSERT INTO slug_symbols_dev VALUES(N'У', 'U');/
INSERT INTO slug_symbols_dev VALUES(N'Ф', 'F');/
INSERT INTO slug_symbols_dev VALUES(N'Х', 'H');/
INSERT INTO slug_symbols_dev VALUES(N'Ц', 'C');/
INSERT INTO slug_symbols_dev VALUES(N'Ч', 'Ch');/
INSERT INTO slug_symbols_dev VALUES(N'Ш', 'Sh');/
INSERT INTO slug_symbols_dev VALUES(N'Щ', 'Sh');/
INSERT INTO slug_symbols_dev VALUES(N'Ъ', 'U');/
INSERT INTO slug_symbols_dev VALUES(N'Ы', 'Y');/
INSERT INTO slug_symbols_dev VALUES(N'Ь', '');/
INSERT INTO slug_symbols_dev VALUES(N'Э', 'E');/
INSERT INTO slug_symbols_dev VALUES(N'Ю', 'Yu');/
INSERT INTO slug_symbols_dev VALUES(N'Я', 'Ya');/
INSERT INTO slug_symbols_dev VALUES(N'Є', 'Ye');/
INSERT INTO slug_symbols_dev VALUES(N'І', 'I');/
INSERT INTO slug_symbols_dev VALUES(N'Ї', 'Yi');/
INSERT INTO slug_symbols_dev VALUES(N'Ґ', 'G');/
INSERT INTO slug_symbols_dev VALUES(N'є', 'ye');/
INSERT INTO slug_symbols_dev VALUES(N'і', 'i');/
INSERT INTO slug_symbols_dev VALUES(N'ї', 'yi');/
INSERT INTO slug_symbols_dev VALUES(N'ґ', 'g');/
INSERT INTO slug_symbols_dev VALUES(N'č', 'c');/
INSERT INTO slug_symbols_dev VALUES(N'ď', 'd');/
INSERT INTO slug_symbols_dev VALUES(N'ě', 'e');/
INSERT INTO slug_symbols_dev VALUES(N'ň', 'n');/
INSERT INTO slug_symbols_dev VALUES(N'ř', 'r');/
INSERT INTO slug_symbols_dev VALUES(N'š', 's');/
INSERT INTO slug_symbols_dev VALUES(N'ť', 't');/
INSERT INTO slug_symbols_dev VALUES(N'ů', 'u');/
INSERT INTO slug_symbols_dev VALUES(N'ž', 'z');/
INSERT INTO slug_symbols_dev VALUES(N'Č', 'C');/
INSERT INTO slug_symbols_dev VALUES(N'Ď', 'D');/
INSERT INTO slug_symbols_dev VALUES(N'Ě', 'E');/
INSERT INTO slug_symbols_dev VALUES(N'Ň', 'N');/
INSERT INTO slug_symbols_dev VALUES(N'Ř', 'R');/
INSERT INTO slug_symbols_dev VALUES(N'Š', 'S');/
INSERT INTO slug_symbols_dev VALUES(N'Ť', 'T');/
INSERT INTO slug_symbols_dev VALUES(N'Ů', 'U');/
INSERT INTO slug_symbols_dev VALUES(N'Ž', 'Z');/
INSERT INTO slug_symbols_dev VALUES(N'ą', 'a');/
INSERT INTO slug_symbols_dev VALUES(N'ć', 'c');/
INSERT INTO slug_symbols_dev VALUES(N'ę', 'e');/
INSERT INTO slug_symbols_dev VALUES(N'ł', 'l');/
INSERT INTO slug_symbols_dev VALUES(N'ń', 'n');/
INSERT INTO slug_symbols_dev VALUES(N'ś', 's');/
INSERT INTO slug_symbols_dev VALUES(N'ź', 'z');/
INSERT INTO slug_symbols_dev VALUES(N'ż', 'z');/
INSERT INTO slug_symbols_dev VALUES(N'Ą', 'A');/
INSERT INTO slug_symbols_dev VALUES(N'Ć', 'C');/
INSERT INTO slug_symbols_dev VALUES(N'Ę', 'E');/
INSERT INTO slug_symbols_dev VALUES(N'Ł', 'L');/
INSERT INTO slug_symbols_dev VALUES(N'Ń', 'N');/
INSERT INTO slug_symbols_dev VALUES(N'Ś', 'S');/
INSERT INTO slug_symbols_dev VALUES(N'Ź', 'Z');/
INSERT INTO slug_symbols_dev VALUES(N'Ż', 'Z');/
INSERT INTO slug_symbols_dev VALUES(N'ā', 'a');/
INSERT INTO slug_symbols_dev VALUES(N'ē', 'e');/
INSERT INTO slug_symbols_dev VALUES(N'ģ', 'g');/
INSERT INTO slug_symbols_dev VALUES(N'ī', 'i');/
INSERT INTO slug_symbols_dev VALUES(N'ķ', 'k');/
INSERT INTO slug_symbols_dev VALUES(N'ļ', 'l');/
INSERT INTO slug_symbols_dev VALUES(N'ņ', 'n');/
INSERT INTO slug_symbols_dev VALUES(N'ū', 'u');/
INSERT INTO slug_symbols_dev VALUES(N'Ā', 'A');/
INSERT INTO slug_symbols_dev VALUES(N'Ē', 'E');/
INSERT INTO slug_symbols_dev VALUES(N'Ģ', 'G');/
INSERT INTO slug_symbols_dev VALUES(N'Ī', 'I');/
INSERT INTO slug_symbols_dev VALUES(N'Ķ', 'K');/
INSERT INTO slug_symbols_dev VALUES(N'Ļ', 'L');/
INSERT INTO slug_symbols_dev VALUES(N'Ņ', 'N');/
INSERT INTO slug_symbols_dev VALUES(N'Ū', 'U');/
INSERT INTO slug_symbols_dev VALUES(N'ė', 'e');/
INSERT INTO slug_symbols_dev VALUES(N'į', 'i');/
INSERT INTO slug_symbols_dev VALUES(N'ų', 'u');/
INSERT INTO slug_symbols_dev VALUES(N'Ė', 'E');/
INSERT INTO slug_symbols_dev VALUES(N'Į', 'I');/
INSERT INTO slug_symbols_dev VALUES(N'Ų', 'U');/
INSERT INTO slug_symbols_dev VALUES(N'ț', 't');/
INSERT INTO slug_symbols_dev VALUES(N'Ț', 'T');/
INSERT INTO slug_symbols_dev VALUES(N'ţ', 't');/
INSERT INTO slug_symbols_dev VALUES(N'Ţ', 'T');/
INSERT INTO slug_symbols_dev VALUES(N'ș', 's');/
INSERT INTO slug_symbols_dev VALUES(N'Ș', 'S');/
INSERT INTO slug_symbols_dev VALUES(N'ă', 'a');/
INSERT INTO slug_symbols_dev VALUES(N'Ă', 'A');/
INSERT INTO slug_symbols_dev VALUES(N'Ạ', 'A');/
INSERT INTO slug_symbols_dev VALUES(N'Ả', 'A');/
INSERT INTO slug_symbols_dev VALUES(N'Ầ', 'A');/
INSERT INTO slug_symbols_dev VALUES(N'Ấ', 'A');/
INSERT INTO slug_symbols_dev VALUES(N'Ậ', 'A');/
INSERT INTO slug_symbols_dev VALUES(N'Ẩ', 'A');/
INSERT INTO slug_symbols_dev VALUES(N'Ẫ', 'A');/
INSERT INTO slug_symbols_dev VALUES(N'Ằ', 'A');/
INSERT INTO slug_symbols_dev VALUES(N'Ắ', 'A');/
INSERT INTO slug_symbols_dev VALUES(N'Ặ', 'A');/
INSERT INTO slug_symbols_dev VALUES(N'Ẳ', 'A');/
INSERT INTO slug_symbols_dev VALUES(N'Ẵ', 'A');/
INSERT INTO slug_symbols_dev VALUES(N'Ẹ', 'E');/
INSERT INTO slug_symbols_dev VALUES(N'Ẻ', 'E');/
INSERT INTO slug_symbols_dev VALUES(N'Ẽ', 'E');/
INSERT INTO slug_symbols_dev VALUES(N'Ề', 'E');/
INSERT INTO slug_symbols_dev VALUES(N'Ế', 'E');/
INSERT INTO slug_symbols_dev VALUES(N'Ệ', 'E');/
INSERT INTO slug_symbols_dev VALUES(N'Ể', 'E');/
INSERT INTO slug_symbols_dev VALUES(N'Ễ', 'E');/
INSERT INTO slug_symbols_dev VALUES(N'Ị', 'I');/
INSERT INTO slug_symbols_dev VALUES(N'Ỉ', 'I');/
INSERT INTO slug_symbols_dev VALUES(N'Ĩ', 'I');/
INSERT INTO slug_symbols_dev VALUES(N'Ọ', 'O');/
INSERT INTO slug_symbols_dev VALUES(N'Ỏ', 'O');/
INSERT INTO slug_symbols_dev VALUES(N'Ồ', 'O');/
INSERT INTO slug_symbols_dev VALUES(N'Ố', 'O');/
INSERT INTO slug_symbols_dev VALUES(N'Ộ', 'O');/
INSERT INTO slug_symbols_dev VALUES(N'Ổ', 'O');/
INSERT INTO slug_symbols_dev VALUES(N'Ỗ', 'O');/
INSERT INTO slug_symbols_dev VALUES(N'Ơ', 'O');/
INSERT INTO slug_symbols_dev VALUES(N'Ờ', 'O');/
INSERT INTO slug_symbols_dev VALUES(N'Ớ', 'O');/
INSERT INTO slug_symbols_dev VALUES(N'Ợ', 'O');/
INSERT INTO slug_symbols_dev VALUES(N'Ở', 'O');/
INSERT INTO slug_symbols_dev VALUES(N'Ỡ', 'O');/
INSERT INTO slug_symbols_dev VALUES(N'Ụ', 'U');/
INSERT INTO slug_symbols_dev VALUES(N'Ủ', 'U');/
INSERT INTO slug_symbols_dev VALUES(N'Ũ', 'U');/
INSERT INTO slug_symbols_dev VALUES(N'Ư', 'U');/
INSERT INTO slug_symbols_dev VALUES(N'Ừ', 'U');/
INSERT INTO slug_symbols_dev VALUES(N'Ứ', 'U');/
INSERT INTO slug_symbols_dev VALUES(N'Ự', 'U');/
INSERT INTO slug_symbols_dev VALUES(N'Ử', 'U');/
INSERT INTO slug_symbols_dev VALUES(N'Ữ', 'U');/
INSERT INTO slug_symbols_dev VALUES(N'Ỳ', 'Y');/
INSERT INTO slug_symbols_dev VALUES(N'Ỵ', 'Y');/
INSERT INTO slug_symbols_dev VALUES(N'Ỷ', 'Y');/
INSERT INTO slug_symbols_dev VALUES(N'Ỹ', 'Y');/
INSERT INTO slug_symbols_dev VALUES(N'Đ', 'D');/
INSERT INTO slug_symbols_dev VALUES(N'ạ', 'a');/
INSERT INTO slug_symbols_dev VALUES(N'ả', 'a');/
INSERT INTO slug_symbols_dev VALUES(N'ầ', 'a');/
INSERT INTO slug_symbols_dev VALUES(N'ấ', 'a');/
INSERT INTO slug_symbols_dev VALUES(N'ậ', 'a');/
INSERT INTO slug_symbols_dev VALUES(N'ẩ', 'a');/
INSERT INTO slug_symbols_dev VALUES(N'ẫ', 'a');/
INSERT INTO slug_symbols_dev VALUES(N'ằ', 'a');/
INSERT INTO slug_symbols_dev VALUES(N'ắ', 'a');/
INSERT INTO slug_symbols_dev VALUES(N'ặ', 'a');/
INSERT INTO slug_symbols_dev VALUES(N'ẳ', 'a');/
INSERT INTO slug_symbols_dev VALUES(N'ẵ', 'a');/
INSERT INTO slug_symbols_dev VALUES(N'ẹ', 'e');/
INSERT INTO slug_symbols_dev VALUES(N'ẻ', 'e');/
INSERT INTO slug_symbols_dev VALUES(N'ẽ', 'e');/
INSERT INTO slug_symbols_dev VALUES(N'ề', 'e');/
INSERT INTO slug_symbols_dev VALUES(N'ế', 'e');/
INSERT INTO slug_symbols_dev VALUES(N'ệ', 'e');/
INSERT INTO slug_symbols_dev VALUES(N'ể', 'e');/
INSERT INTO slug_symbols_dev VALUES(N'ễ', 'e');/
INSERT INTO slug_symbols_dev VALUES(N'ị', 'i');/
INSERT INTO slug_symbols_dev VALUES(N'ỉ', 'i');/
INSERT INTO slug_symbols_dev VALUES(N'ĩ', 'i');/
INSERT INTO slug_symbols_dev VALUES(N'ọ', 'o');/
INSERT INTO slug_symbols_dev VALUES(N'ỏ', 'o');/
INSERT INTO slug_symbols_dev VALUES(N'ồ', 'o');/
INSERT INTO slug_symbols_dev VALUES(N'ố', 'o');/
INSERT INTO slug_symbols_dev VALUES(N'ộ', 'o');/
INSERT INTO slug_symbols_dev VALUES(N'ổ', 'o');/
INSERT INTO slug_symbols_dev VALUES(N'ỗ', 'o');/
INSERT INTO slug_symbols_dev VALUES(N'ơ', 'o');/
INSERT INTO slug_symbols_dev VALUES(N'ờ', 'o');/
INSERT INTO slug_symbols_dev VALUES(N'ớ', 'o');/
INSERT INTO slug_symbols_dev VALUES(N'ợ', 'o');/
INSERT INTO slug_symbols_dev VALUES(N'ở', 'o');/
INSERT INTO slug_symbols_dev VALUES(N'ỡ', 'o');/
INSERT INTO slug_symbols_dev VALUES(N'ụ', 'u');/
INSERT INTO slug_symbols_dev VALUES(N'ủ', 'u');/
INSERT INTO slug_symbols_dev VALUES(N'ũ', 'u');/
INSERT INTO slug_symbols_dev VALUES(N'ư', 'u');/
INSERT INTO slug_symbols_dev VALUES(N'ừ', 'u');/
INSERT INTO slug_symbols_dev VALUES(N'ứ', 'u');/
INSERT INTO slug_symbols_dev VALUES(N'ự', 'u');/
INSERT INTO slug_symbols_dev VALUES(N'ử', 'u');/
INSERT INTO slug_symbols_dev VALUES(N'ữ', 'u');/
INSERT INTO slug_symbols_dev VALUES(N'ỳ', 'y');/
INSERT INTO slug_symbols_dev VALUES(N'ỵ', 'y');/
INSERT INTO slug_symbols_dev VALUES(N'ỷ', 'y');/
INSERT INTO slug_symbols_dev VALUES(N'ỹ', 'y');/
INSERT INTO slug_symbols_dev VALUES(N'đ', 'd');/
INSERT INTO slug_symbols_dev VALUES(N'€', 'euro');/
INSERT INTO slug_symbols_dev VALUES(N'₢', 'cruzeiro');/
INSERT INTO slug_symbols_dev VALUES(N'₣', 'french franc');/
INSERT INTO slug_symbols_dev VALUES(N'£', 'pound');/
INSERT INTO slug_symbols_dev VALUES(N'₤', 'lira');/
INSERT INTO slug_symbols_dev VALUES(N'₥', 'mill');/
INSERT INTO slug_symbols_dev VALUES(N'₦', 'naira');/
INSERT INTO slug_symbols_dev VALUES(N'₧', 'peseta');/
INSERT INTO slug_symbols_dev VALUES(N'₨', 'rupee');/
INSERT INTO slug_symbols_dev VALUES(N'₩', 'won');/
INSERT INTO slug_symbols_dev VALUES(N'₪', 'new shequel');/
INSERT INTO slug_symbols_dev VALUES(N'₫', 'dong');/
INSERT INTO slug_symbols_dev VALUES(N'₭', 'kip');/
INSERT INTO slug_symbols_dev VALUES(N'₮', 'tugrik');/
INSERT INTO slug_symbols_dev VALUES(N'₯', 'drachma');/
INSERT INTO slug_symbols_dev VALUES(N'₰', 'penny');/
INSERT INTO slug_symbols_dev VALUES(N'₱', 'peso');/
INSERT INTO slug_symbols_dev VALUES(N'₲', 'guarani');/
INSERT INTO slug_symbols_dev VALUES(N'₳', 'austral');/
INSERT INTO slug_symbols_dev VALUES(N'₴', 'hryvnia');/
INSERT INTO slug_symbols_dev VALUES(N'₵', 'cedi');/
INSERT INTO slug_symbols_dev VALUES(N'¢', 'cent');/
INSERT INTO slug_symbols_dev VALUES(N'¥', 'yen');/
INSERT INTO slug_symbols_dev VALUES(N'元', 'yuan');/
INSERT INTO slug_symbols_dev VALUES(N'円', 'yen');/
INSERT INTO slug_symbols_dev VALUES(N'﷼', 'rial');/
INSERT INTO slug_symbols_dev VALUES(N'₠', 'ecu');/
INSERT INTO slug_symbols_dev VALUES(N'¤', 'currency');/
INSERT INTO slug_symbols_dev VALUES(N'฿', 'baht');/
INSERT INTO slug_symbols_dev VALUES(N'$', 'dollar');/
INSERT INTO slug_symbols_dev VALUES(N'₹', 'indian rupee');/
INSERT INTO slug_symbols_dev VALUES(N'©', '(c)');/
INSERT INTO slug_symbols_dev VALUES(N'œ', 'oe');/
INSERT INTO slug_symbols_dev VALUES(N'Œ', 'OE');/
INSERT INTO slug_symbols_dev VALUES(N'∑', 'sum');/
INSERT INTO slug_symbols_dev VALUES(N'®', '(r)');/
INSERT INTO slug_symbols_dev VALUES(N'†', '+');/
INSERT INTO slug_symbols_dev VALUES(N'“', '"');/
INSERT INTO slug_symbols_dev VALUES(N'”', '"');/
INSERT INTO slug_symbols_dev VALUES(N'‘', ''');/
INSERT INTO slug_symbols_dev VALUES(N'’', ''');/
INSERT INTO slug_symbols_dev VALUES(N'∂', 'd');/
INSERT INTO slug_symbols_dev VALUES(N'ƒ', 'f');/
INSERT INTO slug_symbols_dev VALUES(N'™', 'tm');/
INSERT INTO slug_symbols_dev VALUES(N'℠', 'sm');/
INSERT INTO slug_symbols_dev VALUES(N'…', '...');/
INSERT INTO slug_symbols_dev VALUES(N'˚', 'o');/
INSERT INTO slug_symbols_dev VALUES(N'º', 'o');/
INSERT INTO slug_symbols_dev VALUES(N'ª', 'a');/
INSERT INTO slug_symbols_dev VALUES(N'•', '*');/
INSERT INTO slug_symbols_dev VALUES(N'∆', 'delta');/
INSERT INTO slug_symbols_dev VALUES(N'∞', 'infinity');/
INSERT INTO slug_symbols_dev VALUES(N'♥', 'love');/
INSERT INTO slug_symbols_dev VALUES(N'&', 'and');/
INSERT INTO slug_symbols_dev VALUES(N'|', 'or');/
INSERT INTO slug_symbols_dev VALUES(N'<', 'less');/
INSERT INTO slug_symbols_dev VALUES(N'>', 'greater');/
-- CREATE PACKAGE

prompt *** Packages ***

CREATE OR REPLACE PACKAGE slug_util_dev AS
    SUBTYPE slug_varchar IS VARCHAR2(32767);
    
    FUNCTION slugify ( string_in IN slug_varchar ) RETURN slug_varchar;

END slug_util_dev;
/

CREATE OR REPLACE PACKAGE BODY slug_util_dev AS

    -- ******** PRIVATE ********
    
    function get_latin_symbols_for_cyrillic (cyrillic_symbol_in in slug_symbols_dev.CYRILLIC_SYMBOL%type) 
    return slug_symbols_dev.LATIN_SYMBOLS%type
    is
        l_exist NUMBER := 0;
        l_latin_symbols slug_symbols_dev.LATIN_SYMBOLS%type := null;
    begin
        select count(*) into l_exist from slug_symbols_dev 
            where CYRILLIC_SYMBOL = cyrillic_symbol_in;
        if l_exist = 0 then
            l_latin_symbols := cyrillic_symbol_in;
        else
            begin
                select LATIN_SYMBOLS into l_latin_symbols from slug_symbols_dev where CYRILLIC_SYMBOL = cyrillic_symbol_in;
                EXCEPTION
                    when no_data_found then
                        l_latin_symbols := null;
            end;
        end if;
        return l_latin_symbols;
    end;

    -- ******** PUBLIC ********
    
    FUNCTION slugify ( string_in IN slug_varchar ) RETURN slug_varchar
        is
        l_string slug_varchar := string_in;
        l_string_index NUMBER := 1;
        l_substring slug_symbols_dev.CYRILLIC_SYMBOL%type;
        l_latin_symbols slug_symbols_dev.LATIN_SYMBOLS%type := null;
        l_parsed_string slug_varchar := '';
    BEGIN
        l_string := regexp_replace(l_string, '[[:space:]]+', '-');
        while (l_string_index <= length(l_string))
        loop
            l_substring := SUBSTR(l_string, l_string_index, 1);
            
            l_latin_symbols := get_latin_symbols_for_cyrillic(cyrillic_symbol_in => l_substring);
            
            if l_latin_symbols is not null then
                l_parsed_string := l_parsed_string || l_latin_symbols;
            end if;
            
            l_string_index := l_string_index + 1;
        end loop;
        return l_parsed_string;
    END;

END slug_util_dev;
/