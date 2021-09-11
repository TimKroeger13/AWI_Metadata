library(shiny)

ui = fluidPage(

  tableOutput(outputId = "Metadata")

)

server = function(input,output){

  output$Metadata = renderTable({

    
    #Set Working directory

    
    data=read.csv("data/Metadata.csv",sep=";",header = FALSE)
    
    
    Row_Name=data[,1]
    Col_Name=data[1,2:dim(data)[2]]

    rownames(data)=Row_Name
    data=data[,-1]
    colnames(data)=Col_Name

    return(data)

  },rownames = TRUE, colnames = F)

}

shinyApp(ui = ui, server = server)

