load_smart_rating <- function(filePath){
  library(xlsx)
  icos <- unlist(read.xlsx(filePath,sheetName = "master", startRow = 4, colIndex = 1, colClasses = "character", as.data.frame = FALSE))
  
  df <- read.xlsx(filePath,sheetName = "master",header = FALSE, startRow = 4, colIndex = c(12:20), colClasses = c(rep("numeric",8),"character"))
  df <- df[apply(df, 1, function(df) !all(is.na(df))),] # Delete trailing NA rows
  df <- cbind(icos,df)
  colnames(df) <- c("ICO","IcoDrops","OhHeyMatty","CryptoBriefing","CruishCrypto","Hacked","ICOPantera","Bulk","SmartAvg","SmartRating")
  mapping <- data.frame(SmartRating = c("A+","A","A-","B+","B","B-","C+","C","C-","F"), value = c(0:9))
  df <- merge(x = df, y = mapping, by = "SmartRating", all.y = TRUE)
  df <- df[,c(2:10,11)]
  colnames(df) <- c("ICO","IcoDrops","OhHeyMatty","CryptoBriefing","CruishCrypto","Hacked","ICOPantera","Bulk","SmartAvg","SmartRating")
  return(df)
}