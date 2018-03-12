/*
Created by Shamatienko Yaroslav (shamatienko.yaroslav@gmail.com)
*/

prompt *** Installing PL/SQL-SLUG ***

-- PREPARE

prompt *** Drop Old Tables and Packages ***

DROP TABLE slug_symbols;
/
DROP PACKAGE slug_util;
/

-- CREATE TABLE

prompt *** Tables ***

CREATE TABLE slug_symbols (
cyrillic_symbol   NVARCHAR2(10) NOT NULL,
latin_symbols     VARCHAR2(10)
);
/

ALTER TABLE slug_symbols
ADD CONSTRAINT slug_symbols_cyrillic UNIQUE 
(
CYRILLIC_SYMBOL 
)
ENABLE;
/

COMMENT ON COLUMN slug_symbols.cyrillic_symbol IS
'Cyrillic symbol';
/

COMMENT ON COLUMN slug_symbols.latin_symbols IS
'Latin symbols to change cyrillic symbol';
/
INSERT INTO slug_symbols VALUES(N'À', 'A');/
INSERT INTO slug_symbols VALUES(N'Á', 'A');/
INSERT INTO slug_symbols VALUES(N'Â', 'A');/
INSERT INTO slug_symbols VALUES(N'Ã', 'A');/
INSERT INTO slug_symbols VALUES(N'Ä', 'A');/
INSERT INTO slug_symbols VALUES(N'Å', 'A');/
INSERT INTO slug_symbols VALUES(N'Æ', 'AE');/
INSERT INTO slug_symbols VALUES(N'Ç', 'C');/
INSERT INTO slug_symbols VALUES(N'È', 'E');/
INSERT INTO slug_symbols VALUES(N'É', 'E');/
INSERT INTO slug_symbols VALUES(N'Ê', 'E');/
INSERT INTO slug_symbols VALUES(N'Ë', 'E');/
INSERT INTO slug_symbols VALUES(N'Ì', 'I');/
INSERT INTO slug_symbols VALUES(N'Í', 'I');/
INSERT INTO slug_symbols VALUES(N'Î', 'I');/
INSERT INTO slug_symbols VALUES(N'Ï', 'I');/
INSERT INTO slug_symbols VALUES(N'Ð', 'D');/
INSERT INTO slug_symbols VALUES(N'Ñ', 'N');/
INSERT INTO slug_symbols VALUES(N'Ò', 'O');/
INSERT INTO slug_symbols VALUES(N'Ó', 'O');/
INSERT INTO slug_symbols VALUES(N'Ô', 'O');/
INSERT INTO slug_symbols VALUES(N'Õ', 'O');/
INSERT INTO slug_symbols VALUES(N'Ö', 'O');/
INSERT INTO slug_symbols VALUES(N'Ő', 'O');/
INSERT INTO slug_symbols VALUES(N'Ø', 'O');/
INSERT INTO slug_symbols VALUES(N'Ù', 'U');/
INSERT INTO slug_symbols VALUES(N'Ú', 'U');/
INSERT INTO slug_symbols VALUES(N'Û', 'U');/
INSERT INTO slug_symbols VALUES(N'Ü', 'U');/
INSERT INTO slug_symbols VALUES(N'Ű', 'U');/
INSERT INTO slug_symbols VALUES(N'Ý', 'Y');/
INSERT INTO slug_symbols VALUES(N'Þ', 'TH');/
INSERT INTO slug_symbols VALUES(N'ß', 'ss');/
INSERT INTO slug_symbols VALUES(N'à', 'a');/
INSERT INTO slug_symbols VALUES(N'á', 'a');/
INSERT INTO slug_symbols VALUES(N'â', 'a');/
INSERT INTO slug_symbols VALUES(N'ã', 'a');/
INSERT INTO slug_symbols VALUES(N'ä', 'a');/
INSERT INTO slug_symbols VALUES(N'å', 'a');/
INSERT INTO slug_symbols VALUES(N'æ', 'ae');/
INSERT INTO slug_symbols VALUES(N'ç', 'c');/
INSERT INTO slug_symbols VALUES(N'è', 'e');/
INSERT INTO slug_symbols VALUES(N'é', 'e');/
INSERT INTO slug_symbols VALUES(N'ê', 'e');/
INSERT INTO slug_symbols VALUES(N'ë', 'e');/
INSERT INTO slug_symbols VALUES(N'ì', 'i');/
INSERT INTO slug_symbols VALUES(N'í', 'i');/
INSERT INTO slug_symbols VALUES(N'î', 'i');/
INSERT INTO slug_symbols VALUES(N'ï', 'i');/
INSERT INTO slug_symbols VALUES(N'ð', 'd');/
INSERT INTO slug_symbols VALUES(N'ñ', 'n');/
INSERT INTO slug_symbols VALUES(N'ò', 'o');/
INSERT INTO slug_symbols VALUES(N'ó', 'o');/
INSERT INTO slug_symbols VALUES(N'ô', 'o');/
INSERT INTO slug_symbols VALUES(N'õ', 'o');/
INSERT INTO slug_symbols VALUES(N'ö', 'o');/
INSERT INTO slug_symbols VALUES(N'ő', 'o');/
INSERT INTO slug_symbols VALUES(N'ø', 'o');/
INSERT INTO slug_symbols VALUES(N'ù', 'u');/
INSERT INTO slug_symbols VALUES(N'ú', 'u');/
INSERT INTO slug_symbols VALUES(N'û', 'u');/
INSERT INTO slug_symbols VALUES(N'ü', 'u');/
INSERT INTO slug_symbols VALUES(N'ű', 'u');/
INSERT INTO slug_symbols VALUES(N'ý', 'y');/
INSERT INTO slug_symbols VALUES(N'þ', 'th');/
INSERT INTO slug_symbols VALUES(N'ÿ', 'y');/
INSERT INTO slug_symbols VALUES(N'ẞ', 'SS');/
INSERT INTO slug_symbols VALUES(N'α', 'a');/
INSERT INTO slug_symbols VALUES(N'β', 'b');/
INSERT INTO slug_symbols VALUES(N'γ', 'g');/
INSERT INTO slug_symbols VALUES(N'δ', 'd');/
INSERT INTO slug_symbols VALUES(N'ε', 'e');/
INSERT INTO slug_symbols VALUES(N'ζ', 'z');/
INSERT INTO slug_symbols VALUES(N'η', 'h');/
INSERT INTO slug_symbols VALUES(N'θ', '8');/
INSERT INTO slug_symbols VALUES(N'ι', 'i');/
INSERT INTO slug_symbols VALUES(N'κ', 'k');/
INSERT INTO slug_symbols VALUES(N'λ', 'l');/
INSERT INTO slug_symbols VALUES(N'μ', 'm');/
INSERT INTO slug_symbols VALUES(N'ν', 'n');/
INSERT INTO slug_symbols VALUES(N'ξ', '3');/
INSERT INTO slug_symbols VALUES(N'ο', 'o');/
INSERT INTO slug_symbols VALUES(N'π', 'p');/
INSERT INTO slug_symbols VALUES(N'ρ', 'r');/
INSERT INTO slug_symbols VALUES(N'σ', 's');/
INSERT INTO slug_symbols VALUES(N'τ', 't');/
INSERT INTO slug_symbols VALUES(N'υ', 'y');/
INSERT INTO slug_symbols VALUES(N'φ', 'f');/
INSERT INTO slug_symbols VALUES(N'χ', 'x');/
INSERT INTO slug_symbols VALUES(N'ψ', 'ps');/
INSERT INTO slug_symbols VALUES(N'ω', 'w');/
INSERT INTO slug_symbols VALUES(N'ά', 'a');/
INSERT INTO slug_symbols VALUES(N'έ', 'e');/
INSERT INTO slug_symbols VALUES(N'ί', 'i');/
INSERT INTO slug_symbols VALUES(N'ό', 'o');/
INSERT INTO slug_symbols VALUES(N'ύ', 'y');/
INSERT INTO slug_symbols VALUES(N'ή', 'h');/
INSERT INTO slug_symbols VALUES(N'ώ', 'w');/
INSERT INTO slug_symbols VALUES(N'ς', 's');/
INSERT INTO slug_symbols VALUES(N'ϊ', 'i');/
INSERT INTO slug_symbols VALUES(N'ΰ', 'y');/
INSERT INTO slug_symbols VALUES(N'ϋ', 'y');/
INSERT INTO slug_symbols VALUES(N'ΐ', 'i');/
INSERT INTO slug_symbols VALUES(N'Α', 'A');/
INSERT INTO slug_symbols VALUES(N'Β', 'B');/
INSERT INTO slug_symbols VALUES(N'Γ', 'G');/
INSERT INTO slug_symbols VALUES(N'Δ', 'D');/
INSERT INTO slug_symbols VALUES(N'Ε', 'E');/
INSERT INTO slug_symbols VALUES(N'Ζ', 'Z');/
INSERT INTO slug_symbols VALUES(N'Η', 'H');/
INSERT INTO slug_symbols VALUES(N'Θ', '8');/
INSERT INTO slug_symbols VALUES(N'Ι', 'I');/
INSERT INTO slug_symbols VALUES(N'Κ', 'K');/
INSERT INTO slug_symbols VALUES(N'Λ', 'L');/
INSERT INTO slug_symbols VALUES(N'Μ', 'M');/
INSERT INTO slug_symbols VALUES(N'Ν', 'N');/
INSERT INTO slug_symbols VALUES(N'Ξ', '3');/
INSERT INTO slug_symbols VALUES(N'Ο', 'O');/
INSERT INTO slug_symbols VALUES(N'Π', 'P');/
INSERT INTO slug_symbols VALUES(N'Ρ', 'R');/
INSERT INTO slug_symbols VALUES(N'Σ', 'S');/
INSERT INTO slug_symbols VALUES(N'Τ', 'T');/
INSERT INTO slug_symbols VALUES(N'Υ', 'Y');/
INSERT INTO slug_symbols VALUES(N'Φ', 'F');/
INSERT INTO slug_symbols VALUES(N'Χ', 'X');/
INSERT INTO slug_symbols VALUES(N'Ψ', 'PS');/
INSERT INTO slug_symbols VALUES(N'Ω', 'W');/
INSERT INTO slug_symbols VALUES(N'Ά', 'A');/
INSERT INTO slug_symbols VALUES(N'Έ', 'E');/
INSERT INTO slug_symbols VALUES(N'Ί', 'I');/
INSERT INTO slug_symbols VALUES(N'Ό', 'O');/
INSERT INTO slug_symbols VALUES(N'Ύ', 'Y');/
INSERT INTO slug_symbols VALUES(N'Ή', 'H');/
INSERT INTO slug_symbols VALUES(N'Ώ', 'W');/
INSERT INTO slug_symbols VALUES(N'Ϊ', 'I');/
INSERT INTO slug_symbols VALUES(N'Ϋ', 'Y');/
INSERT INTO slug_symbols VALUES(N'ş', 's');/
INSERT INTO slug_symbols VALUES(N'Ş', 'S');/
INSERT INTO slug_symbols VALUES(N'ı', 'i');/
INSERT INTO slug_symbols VALUES(N'İ', 'I');/
INSERT INTO slug_symbols VALUES(N'ğ', 'g');/
INSERT INTO slug_symbols VALUES(N'Ğ', 'G');/
INSERT INTO slug_symbols VALUES(N'а', 'a');/
INSERT INTO slug_symbols VALUES(N'б', 'b');/
INSERT INTO slug_symbols VALUES(N'в', 'v');/
INSERT INTO slug_symbols VALUES(N'г', 'g');/
INSERT INTO slug_symbols VALUES(N'д', 'd');/
INSERT INTO slug_symbols VALUES(N'е', 'e');/
INSERT INTO slug_symbols VALUES(N'ё', 'yo');/
INSERT INTO slug_symbols VALUES(N'ж', 'zh');/
INSERT INTO slug_symbols VALUES(N'з', 'z');/
INSERT INTO slug_symbols VALUES(N'и', 'i');/
INSERT INTO slug_symbols VALUES(N'й', 'j');/
INSERT INTO slug_symbols VALUES(N'к', 'k');/
INSERT INTO slug_symbols VALUES(N'л', 'l');/
INSERT INTO slug_symbols VALUES(N'м', 'm');/
INSERT INTO slug_symbols VALUES(N'н', 'n');/
INSERT INTO slug_symbols VALUES(N'о', 'o');/
INSERT INTO slug_symbols VALUES(N'п', 'p');/
INSERT INTO slug_symbols VALUES(N'р', 'r');/
INSERT INTO slug_symbols VALUES(N'с', 's');/
INSERT INTO slug_symbols VALUES(N'т', 't');/
INSERT INTO slug_symbols VALUES(N'у', 'u');/
INSERT INTO slug_symbols VALUES(N'ф', 'f');/
INSERT INTO slug_symbols VALUES(N'х', 'h');/
INSERT INTO slug_symbols VALUES(N'ц', 'c');/
INSERT INTO slug_symbols VALUES(N'ч', 'ch');/
INSERT INTO slug_symbols VALUES(N'ш', 'sh');/
INSERT INTO slug_symbols VALUES(N'щ', 'sh');/
INSERT INTO slug_symbols VALUES(N'ъ', 'u');/
INSERT INTO slug_symbols VALUES(N'ы', 'y');/
INSERT INTO slug_symbols VALUES(N'ь', '');/
INSERT INTO slug_symbols VALUES(N'э', 'e');/
INSERT INTO slug_symbols VALUES(N'ю', 'yu');/
INSERT INTO slug_symbols VALUES(N'я', 'ya');/
INSERT INTO slug_symbols VALUES(N'А', 'A');/
INSERT INTO slug_symbols VALUES(N'Б', 'B');/
INSERT INTO slug_symbols VALUES(N'В', 'V');/
INSERT INTO slug_symbols VALUES(N'Г', 'G');/
INSERT INTO slug_symbols VALUES(N'Д', 'D');/
INSERT INTO slug_symbols VALUES(N'Е', 'E');/
INSERT INTO slug_symbols VALUES(N'Ё', 'Yo');/
INSERT INTO slug_symbols VALUES(N'Ж', 'Zh');/
INSERT INTO slug_symbols VALUES(N'З', 'Z');/
INSERT INTO slug_symbols VALUES(N'И', 'I');/
INSERT INTO slug_symbols VALUES(N'Й', 'J');/
INSERT INTO slug_symbols VALUES(N'К', 'K');/
INSERT INTO slug_symbols VALUES(N'Л', 'L');/
INSERT INTO slug_symbols VALUES(N'М', 'M');/
INSERT INTO slug_symbols VALUES(N'Н', 'N');/
INSERT INTO slug_symbols VALUES(N'О', 'O');/
INSERT INTO slug_symbols VALUES(N'П', 'P');/
INSERT INTO slug_symbols VALUES(N'Р', 'R');/
INSERT INTO slug_symbols VALUES(N'С', 'S');/
INSERT INTO slug_symbols VALUES(N'Т', 'T');/
INSERT INTO slug_symbols VALUES(N'У', 'U');/
INSERT INTO slug_symbols VALUES(N'Ф', 'F');/
INSERT INTO slug_symbols VALUES(N'Х', 'H');/
INSERT INTO slug_symbols VALUES(N'Ц', 'C');/
INSERT INTO slug_symbols VALUES(N'Ч', 'Ch');/
INSERT INTO slug_symbols VALUES(N'Ш', 'Sh');/
INSERT INTO slug_symbols VALUES(N'Щ', 'Sh');/
INSERT INTO slug_symbols VALUES(N'Ъ', 'U');/
INSERT INTO slug_symbols VALUES(N'Ы', 'Y');/
INSERT INTO slug_symbols VALUES(N'Ь', '');/
INSERT INTO slug_symbols VALUES(N'Э', 'E');/
INSERT INTO slug_symbols VALUES(N'Ю', 'Yu');/
INSERT INTO slug_symbols VALUES(N'Я', 'Ya');/
INSERT INTO slug_symbols VALUES(N'Є', 'Ye');/
INSERT INTO slug_symbols VALUES(N'І', 'I');/
INSERT INTO slug_symbols VALUES(N'Ї', 'Yi');/
INSERT INTO slug_symbols VALUES(N'Ґ', 'G');/
INSERT INTO slug_symbols VALUES(N'є', 'ye');/
INSERT INTO slug_symbols VALUES(N'і', 'i');/
INSERT INTO slug_symbols VALUES(N'ї', 'yi');/
INSERT INTO slug_symbols VALUES(N'ґ', 'g');/
INSERT INTO slug_symbols VALUES(N'č', 'c');/
INSERT INTO slug_symbols VALUES(N'ď', 'd');/
INSERT INTO slug_symbols VALUES(N'ě', 'e');/
INSERT INTO slug_symbols VALUES(N'ň', 'n');/
INSERT INTO slug_symbols VALUES(N'ř', 'r');/
INSERT INTO slug_symbols VALUES(N'š', 's');/
INSERT INTO slug_symbols VALUES(N'ť', 't');/
INSERT INTO slug_symbols VALUES(N'ů', 'u');/
INSERT INTO slug_symbols VALUES(N'ž', 'z');/
INSERT INTO slug_symbols VALUES(N'Č', 'C');/
INSERT INTO slug_symbols VALUES(N'Ď', 'D');/
INSERT INTO slug_symbols VALUES(N'Ě', 'E');/
INSERT INTO slug_symbols VALUES(N'Ň', 'N');/
INSERT INTO slug_symbols VALUES(N'Ř', 'R');/
INSERT INTO slug_symbols VALUES(N'Š', 'S');/
INSERT INTO slug_symbols VALUES(N'Ť', 'T');/
INSERT INTO slug_symbols VALUES(N'Ů', 'U');/
INSERT INTO slug_symbols VALUES(N'Ž', 'Z');/
INSERT INTO slug_symbols VALUES(N'ą', 'a');/
INSERT INTO slug_symbols VALUES(N'ć', 'c');/
INSERT INTO slug_symbols VALUES(N'ę', 'e');/
INSERT INTO slug_symbols VALUES(N'ł', 'l');/
INSERT INTO slug_symbols VALUES(N'ń', 'n');/
INSERT INTO slug_symbols VALUES(N'ś', 's');/
INSERT INTO slug_symbols VALUES(N'ź', 'z');/
INSERT INTO slug_symbols VALUES(N'ż', 'z');/
INSERT INTO slug_symbols VALUES(N'Ą', 'A');/
INSERT INTO slug_symbols VALUES(N'Ć', 'C');/
INSERT INTO slug_symbols VALUES(N'Ę', 'E');/
INSERT INTO slug_symbols VALUES(N'Ł', 'L');/
INSERT INTO slug_symbols VALUES(N'Ń', 'N');/
INSERT INTO slug_symbols VALUES(N'Ś', 'S');/
INSERT INTO slug_symbols VALUES(N'Ź', 'Z');/
INSERT INTO slug_symbols VALUES(N'Ż', 'Z');/
INSERT INTO slug_symbols VALUES(N'ā', 'a');/
INSERT INTO slug_symbols VALUES(N'ē', 'e');/
INSERT INTO slug_symbols VALUES(N'ģ', 'g');/
INSERT INTO slug_symbols VALUES(N'ī', 'i');/
INSERT INTO slug_symbols VALUES(N'ķ', 'k');/
INSERT INTO slug_symbols VALUES(N'ļ', 'l');/
INSERT INTO slug_symbols VALUES(N'ņ', 'n');/
INSERT INTO slug_symbols VALUES(N'ū', 'u');/
INSERT INTO slug_symbols VALUES(N'Ā', 'A');/
INSERT INTO slug_symbols VALUES(N'Ē', 'E');/
INSERT INTO slug_symbols VALUES(N'Ģ', 'G');/
INSERT INTO slug_symbols VALUES(N'Ī', 'I');/
INSERT INTO slug_symbols VALUES(N'Ķ', 'K');/
INSERT INTO slug_symbols VALUES(N'Ļ', 'L');/
INSERT INTO slug_symbols VALUES(N'Ņ', 'N');/
INSERT INTO slug_symbols VALUES(N'Ū', 'U');/
INSERT INTO slug_symbols VALUES(N'ė', 'e');/
INSERT INTO slug_symbols VALUES(N'į', 'i');/
INSERT INTO slug_symbols VALUES(N'ų', 'u');/
INSERT INTO slug_symbols VALUES(N'Ė', 'E');/
INSERT INTO slug_symbols VALUES(N'Į', 'I');/
INSERT INTO slug_symbols VALUES(N'Ų', 'U');/
INSERT INTO slug_symbols VALUES(N'ț', 't');/
INSERT INTO slug_symbols VALUES(N'Ț', 'T');/
INSERT INTO slug_symbols VALUES(N'ţ', 't');/
INSERT INTO slug_symbols VALUES(N'Ţ', 'T');/
INSERT INTO slug_symbols VALUES(N'ș', 's');/
INSERT INTO slug_symbols VALUES(N'Ș', 'S');/
INSERT INTO slug_symbols VALUES(N'ă', 'a');/
INSERT INTO slug_symbols VALUES(N'Ă', 'A');/
INSERT INTO slug_symbols VALUES(N'Ạ', 'A');/
INSERT INTO slug_symbols VALUES(N'Ả', 'A');/
INSERT INTO slug_symbols VALUES(N'Ầ', 'A');/
INSERT INTO slug_symbols VALUES(N'Ấ', 'A');/
INSERT INTO slug_symbols VALUES(N'Ậ', 'A');/
INSERT INTO slug_symbols VALUES(N'Ẩ', 'A');/
INSERT INTO slug_symbols VALUES(N'Ẫ', 'A');/
INSERT INTO slug_symbols VALUES(N'Ằ', 'A');/
INSERT INTO slug_symbols VALUES(N'Ắ', 'A');/
INSERT INTO slug_symbols VALUES(N'Ặ', 'A');/
INSERT INTO slug_symbols VALUES(N'Ẳ', 'A');/
INSERT INTO slug_symbols VALUES(N'Ẵ', 'A');/
INSERT INTO slug_symbols VALUES(N'Ẹ', 'E');/
INSERT INTO slug_symbols VALUES(N'Ẻ', 'E');/
INSERT INTO slug_symbols VALUES(N'Ẽ', 'E');/
INSERT INTO slug_symbols VALUES(N'Ề', 'E');/
INSERT INTO slug_symbols VALUES(N'Ế', 'E');/
INSERT INTO slug_symbols VALUES(N'Ệ', 'E');/
INSERT INTO slug_symbols VALUES(N'Ể', 'E');/
INSERT INTO slug_symbols VALUES(N'Ễ', 'E');/
INSERT INTO slug_symbols VALUES(N'Ị', 'I');/
INSERT INTO slug_symbols VALUES(N'Ỉ', 'I');/
INSERT INTO slug_symbols VALUES(N'Ĩ', 'I');/
INSERT INTO slug_symbols VALUES(N'Ọ', 'O');/
INSERT INTO slug_symbols VALUES(N'Ỏ', 'O');/
INSERT INTO slug_symbols VALUES(N'Ồ', 'O');/
INSERT INTO slug_symbols VALUES(N'Ố', 'O');/
INSERT INTO slug_symbols VALUES(N'Ộ', 'O');/
INSERT INTO slug_symbols VALUES(N'Ổ', 'O');/
INSERT INTO slug_symbols VALUES(N'Ỗ', 'O');/
INSERT INTO slug_symbols VALUES(N'Ơ', 'O');/
INSERT INTO slug_symbols VALUES(N'Ờ', 'O');/
INSERT INTO slug_symbols VALUES(N'Ớ', 'O');/
INSERT INTO slug_symbols VALUES(N'Ợ', 'O');/
INSERT INTO slug_symbols VALUES(N'Ở', 'O');/
INSERT INTO slug_symbols VALUES(N'Ỡ', 'O');/
INSERT INTO slug_symbols VALUES(N'Ụ', 'U');/
INSERT INTO slug_symbols VALUES(N'Ủ', 'U');/
INSERT INTO slug_symbols VALUES(N'Ũ', 'U');/
INSERT INTO slug_symbols VALUES(N'Ư', 'U');/
INSERT INTO slug_symbols VALUES(N'Ừ', 'U');/
INSERT INTO slug_symbols VALUES(N'Ứ', 'U');/
INSERT INTO slug_symbols VALUES(N'Ự', 'U');/
INSERT INTO slug_symbols VALUES(N'Ử', 'U');/
INSERT INTO slug_symbols VALUES(N'Ữ', 'U');/
INSERT INTO slug_symbols VALUES(N'Ỳ', 'Y');/
INSERT INTO slug_symbols VALUES(N'Ỵ', 'Y');/
INSERT INTO slug_symbols VALUES(N'Ỷ', 'Y');/
INSERT INTO slug_symbols VALUES(N'Ỹ', 'Y');/
INSERT INTO slug_symbols VALUES(N'Đ', 'D');/
INSERT INTO slug_symbols VALUES(N'ạ', 'a');/
INSERT INTO slug_symbols VALUES(N'ả', 'a');/
INSERT INTO slug_symbols VALUES(N'ầ', 'a');/
INSERT INTO slug_symbols VALUES(N'ấ', 'a');/
INSERT INTO slug_symbols VALUES(N'ậ', 'a');/
INSERT INTO slug_symbols VALUES(N'ẩ', 'a');/
INSERT INTO slug_symbols VALUES(N'ẫ', 'a');/
INSERT INTO slug_symbols VALUES(N'ằ', 'a');/
INSERT INTO slug_symbols VALUES(N'ắ', 'a');/
INSERT INTO slug_symbols VALUES(N'ặ', 'a');/
INSERT INTO slug_symbols VALUES(N'ẳ', 'a');/
INSERT INTO slug_symbols VALUES(N'ẵ', 'a');/
INSERT INTO slug_symbols VALUES(N'ẹ', 'e');/
INSERT INTO slug_symbols VALUES(N'ẻ', 'e');/
INSERT INTO slug_symbols VALUES(N'ẽ', 'e');/
INSERT INTO slug_symbols VALUES(N'ề', 'e');/
INSERT INTO slug_symbols VALUES(N'ế', 'e');/
INSERT INTO slug_symbols VALUES(N'ệ', 'e');/
INSERT INTO slug_symbols VALUES(N'ể', 'e');/
INSERT INTO slug_symbols VALUES(N'ễ', 'e');/
INSERT INTO slug_symbols VALUES(N'ị', 'i');/
INSERT INTO slug_symbols VALUES(N'ỉ', 'i');/
INSERT INTO slug_symbols VALUES(N'ĩ', 'i');/
INSERT INTO slug_symbols VALUES(N'ọ', 'o');/
INSERT INTO slug_symbols VALUES(N'ỏ', 'o');/
INSERT INTO slug_symbols VALUES(N'ồ', 'o');/
INSERT INTO slug_symbols VALUES(N'ố', 'o');/
INSERT INTO slug_symbols VALUES(N'ộ', 'o');/
INSERT INTO slug_symbols VALUES(N'ổ', 'o');/
INSERT INTO slug_symbols VALUES(N'ỗ', 'o');/
INSERT INTO slug_symbols VALUES(N'ơ', 'o');/
INSERT INTO slug_symbols VALUES(N'ờ', 'o');/
INSERT INTO slug_symbols VALUES(N'ớ', 'o');/
INSERT INTO slug_symbols VALUES(N'ợ', 'o');/
INSERT INTO slug_symbols VALUES(N'ở', 'o');/
INSERT INTO slug_symbols VALUES(N'ỡ', 'o');/
INSERT INTO slug_symbols VALUES(N'ụ', 'u');/
INSERT INTO slug_symbols VALUES(N'ủ', 'u');/
INSERT INTO slug_symbols VALUES(N'ũ', 'u');/
INSERT INTO slug_symbols VALUES(N'ư', 'u');/
INSERT INTO slug_symbols VALUES(N'ừ', 'u');/
INSERT INTO slug_symbols VALUES(N'ứ', 'u');/
INSERT INTO slug_symbols VALUES(N'ự', 'u');/
INSERT INTO slug_symbols VALUES(N'ử', 'u');/
INSERT INTO slug_symbols VALUES(N'ữ', 'u');/
INSERT INTO slug_symbols VALUES(N'ỳ', 'y');/
INSERT INTO slug_symbols VALUES(N'ỵ', 'y');/
INSERT INTO slug_symbols VALUES(N'ỷ', 'y');/
INSERT INTO slug_symbols VALUES(N'ỹ', 'y');/
INSERT INTO slug_symbols VALUES(N'đ', 'd');/
INSERT INTO slug_symbols VALUES(N'€', 'euro');/
INSERT INTO slug_symbols VALUES(N'₢', 'cruzeiro');/
INSERT INTO slug_symbols VALUES(N'₣', 'french franc');/
INSERT INTO slug_symbols VALUES(N'£', 'pound');/
INSERT INTO slug_symbols VALUES(N'₤', 'lira');/
INSERT INTO slug_symbols VALUES(N'₥', 'mill');/
INSERT INTO slug_symbols VALUES(N'₦', 'naira');/
INSERT INTO slug_symbols VALUES(N'₧', 'peseta');/
INSERT INTO slug_symbols VALUES(N'₨', 'rupee');/
INSERT INTO slug_symbols VALUES(N'₩', 'won');/
INSERT INTO slug_symbols VALUES(N'₪', 'new shequel');/
INSERT INTO slug_symbols VALUES(N'₫', 'dong');/
INSERT INTO slug_symbols VALUES(N'₭', 'kip');/
INSERT INTO slug_symbols VALUES(N'₮', 'tugrik');/
INSERT INTO slug_symbols VALUES(N'₯', 'drachma');/
INSERT INTO slug_symbols VALUES(N'₰', 'penny');/
INSERT INTO slug_symbols VALUES(N'₱', 'peso');/
INSERT INTO slug_symbols VALUES(N'₲', 'guarani');/
INSERT INTO slug_symbols VALUES(N'₳', 'austral');/
INSERT INTO slug_symbols VALUES(N'₴', 'hryvnia');/
INSERT INTO slug_symbols VALUES(N'₵', 'cedi');/
INSERT INTO slug_symbols VALUES(N'¢', 'cent');/
INSERT INTO slug_symbols VALUES(N'¥', 'yen');/
INSERT INTO slug_symbols VALUES(N'元', 'yuan');/
INSERT INTO slug_symbols VALUES(N'円', 'yen');/
INSERT INTO slug_symbols VALUES(N'﷼', 'rial');/
INSERT INTO slug_symbols VALUES(N'₠', 'ecu');/
INSERT INTO slug_symbols VALUES(N'¤', 'currency');/
INSERT INTO slug_symbols VALUES(N'฿', 'baht');/
INSERT INTO slug_symbols VALUES(N'$', 'dollar');/
INSERT INTO slug_symbols VALUES(N'₹', 'indian rupee');/
INSERT INTO slug_symbols VALUES(N'©', '(c)');/
INSERT INTO slug_symbols VALUES(N'œ', 'oe');/
INSERT INTO slug_symbols VALUES(N'Œ', 'OE');/
INSERT INTO slug_symbols VALUES(N'∑', 'sum');/
INSERT INTO slug_symbols VALUES(N'®', '(r)');/
INSERT INTO slug_symbols VALUES(N'†', '+');/
INSERT INTO slug_symbols VALUES(N'“', '"');/
INSERT INTO slug_symbols VALUES(N'”', '"');/
INSERT INTO slug_symbols VALUES(N'‘', ''');/
INSERT INTO slug_symbols VALUES(N'’', ''');/
INSERT INTO slug_symbols VALUES(N'∂', 'd');/
INSERT INTO slug_symbols VALUES(N'ƒ', 'f');/
INSERT INTO slug_symbols VALUES(N'™', 'tm');/
INSERT INTO slug_symbols VALUES(N'℠', 'sm');/
INSERT INTO slug_symbols VALUES(N'…', '...');/
INSERT INTO slug_symbols VALUES(N'˚', 'o');/
INSERT INTO slug_symbols VALUES(N'º', 'o');/
INSERT INTO slug_symbols VALUES(N'ª', 'a');/
INSERT INTO slug_symbols VALUES(N'•', '*');/
INSERT INTO slug_symbols VALUES(N'∆', 'delta');/
INSERT INTO slug_symbols VALUES(N'∞', 'infinity');/
INSERT INTO slug_symbols VALUES(N'♥', 'love');/
INSERT INTO slug_symbols VALUES(N'&', 'and');/
INSERT INTO slug_symbols VALUES(N'|', 'or');/
INSERT INTO slug_symbols VALUES(N'<', 'less');/
INSERT INTO slug_symbols VALUES(N'>', 'greater');/
-- CREATE PACKAGE

prompt *** Packages ***

CREATE OR REPLACE PACKAGE slug_util AS
    SUBTYPE slug_varchar IS VARCHAR2(32767);
    
    FUNCTION slugify ( string_in IN slug_varchar ) RETURN slug_varchar;

END slug_util;
/

CREATE OR REPLACE PACKAGE BODY slug_util AS

    -- ******** PRIVATE ********
    
    function get_latin_symbols_for_cyrillic (cyrillic_symbol_in in slug_symbols.CYRILLIC_SYMBOL%type) 
    return slug_symbols.LATIN_SYMBOLS%type
    is
        l_exist NUMBER := 0;
        l_latin_symbols slug_symbols.LATIN_SYMBOLS%type := null;
    begin
        select count(*) into l_exist from slug_symbols 
            where CYRILLIC_SYMBOL = cyrillic_symbol_in;
        if l_exist = 0 then
            l_latin_symbols := cyrillic_symbol_in;
        else
            begin
                select LATIN_SYMBOLS into l_latin_symbols from slug_symbols where CYRILLIC_SYMBOL = cyrillic_symbol_in;
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
        l_substring slug_symbols.CYRILLIC_SYMBOL%type;
        l_latin_symbols slug_symbols.LATIN_SYMBOLS%type := null;
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

END slug_util;
/