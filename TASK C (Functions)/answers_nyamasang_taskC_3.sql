/* 3. **Utility Function: `fn_title_case_city(text)`**
    - Return city name with first letter of each word 
	 capitalized (hint: split/upper/lower or use `initcap()`in PostgreSQL).  */

SELECT fn_title_case_city('kathmandu');


create or replace function fn_title_case_city(p_city TEXT)
returns TEXT
language plpgsql
as $$

begin
return initcap(p_city);
end;
$$;


