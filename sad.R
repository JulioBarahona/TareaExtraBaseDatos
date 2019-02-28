library(RSQLite)

filename <- "ontime.db"
sqlite <- dbDriver("SQLite")
db <- dbConnect (sqlite,dbname= filename)
dbListTables(db)


dbReadTable(db,"Cancellation" )


dbListTables(db,"ontime")


#este query me muesta todas las tablas de 10 en 10

dbGetQuery(db, "SELECT * from ontime limit 10 ")


#query que responde la pregunta no.1 

dbGetQuery(db, "Select a.Description, COUNT(*) 
           from ontime o 
           INNER JOIN cancellation c ON o.Cancellationcode = c.code 
           INNER JOIN airline_id a ON o.DOT_ID_Reporting_Airline = a.Code 
           WHERE c.Description = 'Security'  GROUP BY o.DOT_ID_Reporting_Airline ORDER BY COUNT(*) " )


 


dbGetQuery(db, "Select a.Description, COUNT(*) 
           from ontime o 
           INNER JOIN airline_id a ON o.DOT_ID_Reporting_Airline = a.Code 
             GROUP BY o.DOT_ID_Reporting_Airline ORDER BY COUNT(*) " )


#query que responde a la pregunta no.2 


dbGetQuery(db, "Select a.Description, COUNT(*) 
           from ontime o INNER JOIN airline_id a ON  o.DOT_ID_Reporting_Airline = a.Code 
           WHERE Diverted = 1 GROUP BY DOT_ID_Reporting_Airline ORDER BY COUNT(*)" )


#query que le da respuesta a la pregunta no.3 

dbGetQuery(db, "Select a.Description, COUNT(*), odl.Description 
           from ontime o INNER JOIN ontime_delay_groups odl ON o.DepDelay = odl.Code 
           INNER JOIN airline_id a ON  o.DOT_ID_Reporting_Airline = a.Code WHERE odl.code in (-1,-2) 
           GROUP BY DOT_ID_Reporting_Airline  ORDER BY COUNT(*)" )


#query que le da respuesta ala pregunta no.3

dbGetQuery(db, "Select a.Description, COUNT(*), odl.Description 
           from ontime o INNER JOIN ontime_delay_groups odl ON o.ArrDelay = odl.Code 
           INNER JOIN airline_id a ON  o.DOT_ID_Reporting_Airline = a.Code 
           WHERE odl.code in (-1,-2) GROUP BY DOT_ID_Reporting_Airline ORDER BY COUNT(*) " )



dbGetQuery(db, "Select a.Description, Convert(SecurityDelay, varchar(10)) from ontime o INNER JOIN airline_id a ON  o.DOT_ID_Reporting_Airline = a.Code GROUP BY a.code")


#pregunta que le da respuesta a la no 4
dbGetQuery(db, "Select a.Description, Count(DISTINCT OriginCityName ) 
           from ontime o 
            INNER JOIN airline_id a 
           ON o.DOT_ID_Reporting_Airline = a.Code 
           group by a.code ORDER BY COUNT(DISTINCT OriginCityNa)")
