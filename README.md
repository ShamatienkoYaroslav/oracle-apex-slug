# oracle-apex-slug
Slug for Oracle Apex

## Installation

```@https://raw.githubusercontent.com/ShamatienkoYaroslav/oracle-apex-slug/master/slug.sql```

## Example

```
declare
  l_string := 'Тест   1';
begin
  l_string := slug_util.slugify(string_in => l_string);
  DBMS_OUTPUT.PRINT_LINE(l_string);
end;


-----

Test-1
```