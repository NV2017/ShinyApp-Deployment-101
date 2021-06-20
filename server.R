################################################################################
############################### Back End Server ################################

library(dplyr)
"Deploy_Directory_Trial_csv.csv" -> Input_Filename
getwd() -> Parent_Directory
Parent_Directory %>% paste0(.,"/",Input_Filename,sep="") -> Input_Filepath

shinyServer(function(input, output) {
  
  observe({
    list.files() -> Parent_Directory_Files
    
    renderPrint({Parent_Directory}) -> output$Zero_Entry
    
    Parent_Directory_Files %>% paste0(.,collapse=",") %>% 
      {renderPrint({.})} -> output$First_Entry
    
    Parent_Directory_Files %>% {renderPrint({.})} -> output$Second_Entry
    
    if(Input_Filename %in% Parent_Directory_Files)
    {
      temp_Column_Number <- reactive({input$Column_Number})
      temp_Column_Number() %>% as.numeric -> temp_col
      temp_Row_Number <- reactive({input$Row_Number})
      temp_Row_Number() %>% as.numeric -> temp_row
      
      temp_row %>% paste0("Row #: ",.,", Col #: ",sep="") %>%
        paste0(.,temp_col,sep="") %>%
        {renderPrint({.})} -> output$Third_Entry
      
      Input_Filename %>% read.csv -> temp_df
      
      temp_df %>% colnames %>% paste0(.,collapse=",") %>% 
        {renderPrint({.})} -> output$Fourth_Entry

      temp_df[temp_row,temp_col] -> temp_element
      
      renderPrint({as.character(temp_element)}) -> output$Fifth_Entry
    }else{
      {renderPrint({"No File Found"})} -> output$Third_Entry
      {renderPrint({"NA"})} -> output$Fourth_Entry
    } # End of 'if(Input_Filename %in% Parent_Directory_Files)'
  })
})

################################################################################
################################################################################
