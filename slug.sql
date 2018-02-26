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

ALTER TABLE SLUG_SYMBOLS
ADD CONSTRAINT SLUG_SYMBOLS_CYRILILIC UNIQUE 
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

INSERT INTO slug_symbols VALUES(N'а', 'a');/
INSERT INTO slug_symbols VALUES(N'б', 'b');/
INSERT INTO slug_symbols VALUES(N'в', 'v');/
INSERT INTO slug_symbols VALUES(N'г', 'g');/
INSERT INTO slug_symbols VALUES(N'д', 'd');/
INSERT INTO slug_symbols VALUES(N'е', 'ee');/
INSERT INTO slug_symbols VALUES(N'ё', 'yo');/
INSERT INTO slug_symbols VALUES(N'ж', 'zh');/
INSERT INTO slug_symbols VALUES(N'з', 'z');/
INSERT INTO slug_symbols VALUES(N'и', 'i');/
INSERT INTO slug_symbols VALUES(N'й', 'y');/
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
INSERT INTO slug_symbols VALUES(N'х', 'kh');/
INSERT INTO slug_symbols VALUES(N'ц', 'c');/
INSERT INTO slug_symbols VALUES(N'ч', 'ch');/
INSERT INTO slug_symbols VALUES(N'ш', 'sh');/
INSERT INTO slug_symbols VALUES(N'щ', 'shch');/
INSERT INTO slug_symbols VALUES(N'ъ', '');/
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
INSERT INTO slug_symbols VALUES(N'Е', 'EE');/
INSERT INTO slug_symbols VALUES(N'Ё', 'YO');/
INSERT INTO slug_symbols VALUES(N'Ж', 'ZH');/
INSERT INTO slug_symbols VALUES(N'З', 'Z');/
INSERT INTO slug_symbols VALUES(N'И', 'I');/
INSERT INTO slug_symbols VALUES(N'Й', 'Y');/
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
INSERT INTO slug_symbols VALUES(N'Х', 'KH');/
INSERT INTO slug_symbols VALUES(N'Ц', 'C');/
INSERT INTO slug_symbols VALUES(N'Ч', 'CH');/
INSERT INTO slug_symbols VALUES(N'Ш', 'SH');/
INSERT INTO slug_symbols VALUES(N'Щ', 'SHCH');/
INSERT INTO slug_symbols VALUES(N'Ъ', '');/
INSERT INTO slug_symbols VALUES(N'Ы', 'Y');/
INSERT INTO slug_symbols VALUES(N'Ь', '');/
INSERT INTO slug_symbols VALUES(N'Э', 'E');/
INSERT INTO slug_symbols VALUES(N'Ю', 'YU');/
INSERT INTO slug_symbols VALUES(N'Я', 'YA');/

INSERT INTO slug_symbols VALUES(N'і', 'i');/
INSERT INTO slug_symbols VALUES(N'І', 'I');/
INSERT INTO slug_symbols VALUES(N'ї', 'yi');/
INSERT INTO slug_symbols VALUES(N'Ї', 'YI');/
INSERT INTO slug_symbols VALUES(N'є', 'ee');/
INSERT INTO slug_symbols VALUES(N'Є', 'EE');/

INSERT INTO slug_symbols VALUES(N'Є', 'EE');/


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
        select count(*) into l_exist from SLUG_SYMBOLS 
            where CYRILLIC_SYMBOL = cyrillic_symbol_in;
        if l_exist = 0 then
            l_latin_symbols := cyrillic_symbol_in;
        else
            begin
                select LATIN_SYMBOLS into l_latin_symbols from SLUG_SYMBOLS where CYRILLIC_SYMBOL = cyrillic_symbol_in;
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