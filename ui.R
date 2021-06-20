################################################################################
################################# Fluidpage ####################################

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Deploy_Directory_Trial"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      radioButtons("Column_Number",
                   label = "Column #:",
                   choices = list('1'=1,'2'=2),
                   selected = 1),
      radioButtons("Row_Number",
                   label = "Row #:",
                   choices = list('1'=1,'2'=2),
                   selected = 1)
    ),
    mainPanel(
      verbatimTextOutput("Zero_Entry"),
      verbatimTextOutput("First_Entry"),
      verbatimTextOutput("Third_Entry"),
      verbatimTextOutput("Fourth_Entry"),
      verbatimTextOutput("Fifth_Entry")
    )
  )
)) # shiny::runApp()

################################################################################
################################################################################
