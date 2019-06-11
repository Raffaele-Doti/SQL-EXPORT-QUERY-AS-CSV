begin 
  for r as c1 cursor with hold for 
    select tabschema, tabname from syscat.tables 
    where tabschema = 'SCHEMA' AND TABNAME='TABNAME'  
  do 
    call admin_cmd(
      'export to /some/path/'||rtrim(r.tabname)||
      '.csv of del select * from '||rtrim(r.tabschema)||'.'||rtrim(tabname)); 
  end for; 
end
