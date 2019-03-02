#DBI
library(DBI)
wdb <- dbConnect(RSQLite::SQLite(), "wdb.sqlite")
STATION <- data.frame(ID=c(13,44,66),
                      City = c("Phoenix","Denver","Caribou"),
                      State = c("AZ","CO","ME"),
                      Lat_N = c(33,40,47),
                      Long_W = c(112,105,68))
STATS <- data.frame(row = 1:6,
                    ID = c(13,13,44,44,66,66),
                    Month = c(1,7,1,7,1,7),
                    Temp_F = c(57.4,91.7,27.3,74.8,6.7,65.8),
                    Rain_I = c(0.31,5.15,0.18,2.11,2.1,4.52))
dbWriteTable(wdb,name='STATION', value = STATION, overwrite=TRUE) 
dbWriteTable(wdb,name='STATS', value = STATS, overwrite=TRUE)
dbListTables(wdb)
## [1] "STATION" "STATS"

#SQL
dbGetQuery(wdb, 'SELECT * from STATION WHERE State = "CO"')

#add new
vancouver = data.frame(ID = 77, City = "Vancouver", State = "BC", Lat_N = 49, Long_W = 123)
dbWriteTable(wdb, name = 'STATION', value = vancouver, append = TRUE)
dbGetQuery(wdb, 'SELECT * FROM STATION')

#or
insert = "INSERT INTO STATION  (ID, City, State, Lat_N, Long_W) VALUES ('77', 'Vancouver', 'BC', '49', '123')"
dbSendQuery(wdb, insert)

#inner join
qq = "SELECT STATION.City, STATION.State, STATS.Month, STATS.Temp_F FROM STATION INNER JOIN STATS ON STATION.ID = STATS.ID WHERE STATION.Lat_N >= 40"
dbGetQuery(wdb, qq)

#dplyr
filter(STATION, STATION$State =='CO')