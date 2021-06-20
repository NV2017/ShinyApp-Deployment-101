# Deploy

library(rsconnect)

rsconnect::setAccountInfo(name='account name with shiny app website',
                          token='Enter you token here',
                          secret='Enter you secret key here')

rsconnect::deployApp("Directory containing ui server and other data files")

rsconnect::showLogs() -> temp_logs
