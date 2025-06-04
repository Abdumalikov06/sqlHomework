declare @tr varchar(max);
with cte as (
	select t.name as table_name, 
	i.name as Index_Name,
	i.type_desc as index_type,
	c.name as column_type
	from 
	sys.indexes i
	JOIN sys.tables t ON i.object_id = t.object_id
	JOIN sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
	JOIN sys.columns c ON ic.object_id = c.object_id AND ic.column_id = c.column_id
)

select @tr=cast(
(select
table_name as td,'',
Index_Name as td,'',
index_type as td,'',
column_type as td,''
from cte
for xml path('tr')) as varchar(max))

declare @html_body varchar(max) = '
		<style>
			#customers {
			  font-family: Arial, Helvetica, sans-serif;
			  border-collapse: collapse;
			  width: 100%;
			}

			#customers td, #customers th {
			  border: 1px solid #ddd;
			  padding: 8px;
			}

			#customers tr:nth-child(even){background-color: #f2f2f2;}

			#customers tr:hover {background-color: #ddd;}

			#customers th {
			  padding-top: 12px;
			  padding-bottom: 12px;
			  text-align: left;
			  background-color: #04AA6D;
			  color: white;
			}
			</style>
			</head>
			<body>

			<h1>A Fancy Table</h1>

			<table id="customers">
			  <tr>
				<th>Table Name</th>
				<th>Rows</th>
			  </tr>
			  ' +@tr +
			  '
			</table>

			</body>
'




exec msdb.dbo.sp_send_dbmail
	@profile_name = 'GmailProfile',
	@recipients = 'a.abdumalikov@newuu.uz',
	@subject = 'This is test from sql server',
	@body = @html_body,
	@body_format = 'HTML'

select sent_status,* from msdb.dbo.sysmail_allitems	
order by send_request_date desc 

select * from msdb.dbo.sysmail_event_log
order by log_date desc


