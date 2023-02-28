local dbi = require('DBI')

-- Create a connection
local dbh = assert(dbi.Connect('PostgreSQL', 'postgres', 'postgres', 'secret', 'localhost', 5432))

-- set the autocommit flag
-- this is turned off by default
dbh:autocommit(true)

-- check status of the connection
local alive = dbh:ping()

-- prepare a connection
local sth = assert(dbh:prepare('SELECT 1;'))

-- commit the transaction
dbh:commit()

-- finish up
local ok = dbh:close()
