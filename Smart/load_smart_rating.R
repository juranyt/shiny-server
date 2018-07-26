load_smart_rating <- function(filePath){
  library("xlsx")
  icos <- unlist(read.xlsx(filePath,sheetName = "master", startRow = 4, colIndex = 1, colClasses = "character", as.data.frame = FALSE))
  
  df <- read.xlsx(filePath,sheetName = "master",header = FALSE, startRow = 4, colIndex = c(12:20), colClasses = c(rep("numeric",8),"character"))
  df <- df[apply(df, 1, function(df) !all(is.na(df))),] # Delete trailing NA rows
  df <- cbind(icos,df)
  colnames(df) <- c("ICO","IcoDrops","OhHeyMatty","CryptoBriefing","CruishCrypto","Hacked","ICOPantera","Bulk","SmartAvg","SmartRating")
  return(df)
}