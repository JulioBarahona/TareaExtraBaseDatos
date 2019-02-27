library(RSQLite)

filename <- "ontime.db"
sqlite <- dbDriver("SQLite")
db <- dbConnect (sqlite,dbname= filename)
dbListTables(db)


dbReadTable(db,"Cancellation" )


dbListTables(db,"ontime")


dbGetQuery(db, "SELECT * from ontime limit 10 ")

dbGetQuery(db, "Select a.Description, COUNT(*) from ontime o INNER JOIN cancellation c ON o.Cancellationcode = c.code INNER JOIN airline_id a ON o.DOT_ID_Reporting_Airline = a.Code WHERE c.Description = 'Security'  GROUP BY o.DOT_ID_Reporting_Airline " )


dbGetQuery(db, "Select a.Description, COUNT(*) from ontime o INNER JOIN airline_id a ON  o.DOT_ID_Reporting_Airline = a.Code WHERE Diverted = 1 GROUP BY DOT_ID_Reporting_Airline" )

dbGetQuery(db, "Select a.Description, COUNT(*), odl.Description from ontime o INNER JOIN ontime_delay_groups odl ON o.DepDelay = odl.Code INNER JOIN airline_id a ON  o.DOT_ID_Reporting_Airline = a.Code WHERE odl.code in (-1,-2) GROUP BY DOT_ID_Reporting_Airline " )
dbGetQuery(db, "Select a.Description, COUNT(*), odl.Description from ontime o INNER JOIN ontime_delay_groups odl ON o.ArrDelay = odl.Code INNER JOIN airline_id a ON  o.DOT_ID_Reporting_Airline = a.Code WHERE odl.code in (-1,-2) GROUP BY DOT_ID_Reporting_Airline " )

dbGetQuery(db, "Select a.Description, COUNT(*), from ontime O INNER JOIN airline_id a ON  o.DOT_ID_Reporting_Airline = a.Code where SecurityDelay is not NULL GROUP BY ontime ;")

dbGetQuery(db, "Select a.Description, COUNT(*), odl.Description from ontime o INNER JOIN ontime_delay_groups odl ON o. = odl.Code INNER JOIN airline_id a ON  o.DOT_ID_Reporting_Airline = a.Code WHERE odl.code in (-1,-2) GROUP BY DOT_ID_Reporting_Airline " )

