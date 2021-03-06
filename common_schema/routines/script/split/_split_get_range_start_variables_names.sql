-- 
-- 
DELIMITER $$

DROP function IF EXISTS _split_get_range_start_variables_names $$
CREATE function _split_get_range_start_variables_names() 
  returns TEXT CHARSET utf8
DETERMINISTIC
READS SQL DATA
SQL SECURITY INVOKER
COMMENT ''

BEGIN	
  declare return_value TEXT CHARSET utf8;
  
  select 
      group_concat(range_start_variable_name order by column_order separator ', ')
    from
      _split_column_names_table
    into return_value
    ;
  return return_value;
END $$

DELIMITER ;
