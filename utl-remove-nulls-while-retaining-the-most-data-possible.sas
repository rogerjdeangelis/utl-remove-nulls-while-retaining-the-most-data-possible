Remove nulls while retaining the most data possible                                                                                    
                                                                                                                                       
Given a 20 x 10 matrix with many nulls iteratively remove                                                                              
columns and rows mainting the maximum number of cells                                                                                  
                                                                                                                                       
github                                                                                                                                 
https://tinyurl.com/yxs56kff                                                                                                           
https://github.com/rogerjdeangelis/utl-remove-nulls-while-retaining-the-most-data-possible                                             
                                                                                                                                       
Calum You profile                                                                                                                      
https://stackoverflow.com/users/7028459/calum-you                                                                                      
                                                                                                                                       
StackOverflow                                                                                                                          
https://tinyurl.com/y486e4vm                                                                                                           
https://stackoverflow.com/questions/56917043/removing-all-nas-while-retaining-the-most-data-possible                                   
                                                                                                                                       
*_                   _                                                                                                                 
(_)_ __  _ __  _   _| |_                                                                                                               
| | '_ \| '_ \| | | | __|                                                                                                              
| | | | | |_) | |_| | |_                                                                                                               
|_|_| |_| .__/ \__,_|\__|                                                                                                              
        |_|                                                                                                                            
;                                                                                                                                      
                                                                                                                                       
options validvarname=upcase;                                                                                                           
libname sd1 "d:/sd1";                                                                                                                  
data sd1.have;                                                                                                                         
 input x1-x10 ;                                                                                                                        
cards4;                                                                                                                                
 . . . . . . 0 8 4 .                                                                                                                   
 5 3 . . 8 . 6 7 9 .                                                                                                                   
 7 8 . . . . 6 3 5 .                                                                                                                   
 9 2 7 4 4 . 2 3 9 .                                                                                                                   
 1 2 3 4 9 3 9 9 9 1                                                                                                                   
 9 5 9 3 3 . 5 5 5 .                                                                                                                   
 . . . 6 8 . 6 2 1 .                                                                                                                   
 8 5 6 9 2 . 3 9 4 .                                                                                                                   
 . . . 1 3 . . . . .                                                                                                                   
 1 4 8 9 2 5 7 9 4 9                                                                                                                   
 3 6 6 4 3 . 7 7 7 .                                                                                                                   
 2 7 9 9 1 . 1 7 9 .                                                                                                                   
 . . . . . . 1 4 9 .                                                                                                                   
 5 3 3 4 9 . 8 5 5 .                                                                                                                   
 . . 0 0 9 . . . . .                                                                                                                   
 6 8 . . 9 . 7 . 9 .                                                                                                                   
 8 9 4 9 6 . 7 6 8 .                                                                                                                   
 . . . . 5 . 6 1 9 .                                                                                                                   
 5 8 8 9 9 . 0 4 7 .                                                                                                                   
 . . 5 0 7 . 6 3 9 .                                                                                                                   
;;;;                                                                                                                                   
run;quit;                                                                                                                              
                                                                                                                                       
                                                                                                                                       
                                                                                                                                       
                                               | RULES (made up data for easy explanation)                                             
SD1.HAVE total obs=20                          | If we removed all rows with a null we would only have two rows                        
                                               |                                                                                       
Obs   X1  X2  X3  X4  X5  X6  X7  X8  X9  X10  |  First remove X6 and X10 Columns                                                      
                                               |                                                                                       
  1   .   .   .   .   .   .   0   8   4   .    |  #1  Remove                                                                           
  2   5   3   .   .   8   .   6   7   9   .    |  #2  Remove                                                                           
  3   7   8   .   .   .   .   6   3   5   .    |  #3  Remove                                                                           
  4   9   2   7   4   4   .   2   3   9   .    |                                                                                       
  5   1   2   3   4   9   3   9   9   9   1    |                                                                                       
  6   9   5   9   3   3   .   5   5   5   .    |                                                                                       
  7   .   .   .   6   8   .   6   2   1   .    |  #7  Remove                                                                           
  8   8   5   6   9   2   .   3   9   4   .    |               TOTAL OF `0 USABLE ROWS AFTER X6 and X10 ARE OUT                        
  9   .   .   .   1   3   .   .   .   .   .    |  #9  Remove                                                                           
 10   1   4   8   9   2   5   7   9   4   9    |                                                                                       
 11   3   6   6   4   3   .   7   7   7   .    |                                                                                       
 12   2   7   9   9   1   .   1   7   9   .    |                                                                                       
 13   .   .   .   .   .   .   1   4   9   .    |  #13 Remove                                                                           
 14   5   3   3   4   9   .   8   5   5   .    |                                                                                       
 15   .   .   0   0   9   .   .   .   .   .    |  #15 Remove                                                                           
 16   6   8   .   .   9   .   7   .   9   .    |  #16 Remove                                                                           
 17   8   9   4   9   6   .   7   6   8   .    |                                                                                       
 18   .   .   .   .   5   .   6   1   9   .    |  #18 Remove                                                                           
 19   5   8   8   9   9   .   0   4   7   .    |                                                                                       
 20   .   .   5   0   7   .   6   3   9   .    |  #30 Remove                                                                           
                                                                                                                                       
                                                                                                                                       
 *           _               _                                                                                                         
  ___  _   _| |_ _ __  _   _| |_                                                                                                       
 / _ \| | | | __| '_ \| | | | __|                                                                                                      
| (_) | |_| | |_| |_) | |_| | |_                                                                                                       
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                                      
                |_|                                                                                                                    
;                                                                                                                                      
                                                                                                                                       
Up to 40 obs from WANT total obs=10                                                                                                    
                                                                                                                                       
                          X6              X10                                                                                          
                          OUT             out                                                                                          
Obs   X1  X2  X3  X4  X5      X7  X8  X9                                                                                               
                                                                                                                                       
  1   9   2   7   4   4       2   3   9                                                                                                
  2   1   2   3   4   9       9   9   9                                                                                                
  3   9   5   9   3   3       5   5   5                                                                                                
  4   8   5   6   9   2       3   9   4                                                                                                
  5   1   4   8   9   2       7   9   4                                                                                                
  6   3   6   6   4   3       7   7   7                                                                                                
  7   2   7   9   9   1       1   7   9                                                                                                
  8   5   3   3   4   9       8   5   5                                                                                                
  9   8   9   4   9   6       7   6   8                                                                                                
 10   5   8   8   9   9       0   4   7                                                                                                
                                                                                                                                       
                                                                                                                                       
*          _       _   _                                                                                                               
 ___  ___ | |_   _| |_(_) ___  _ __                                                                                                    
/ __|/ _ \| | | | | __| |/ _ \| '_ \                                                                                                   
\__ \ (_) | | |_| | |_| | (_) | | | |                                                                                                  
|___/\___/|_|\__,_|\__|_|\___/|_| |_|                                                                                                  
                                                                                                                                       
;                                                                                                                                      
                                                                                                                                       
%utlfkil(d:/xpt/want.xpt);                                                                                                             
                                                                                                                                       
%utl_submit_r64('                                                                                                                      
library(haven);                                                                                                                        
library(SASxport);                                                                                                                     
mat<-as.matrix(read_sas("d:/sd1/have.sas7bdat"));                                                                                      
mat;                                                                                                                                   
prod(dim(mat[apply(mat, 1, function(x) all(!is.na(x))), ]));                                                                           
prod(dim(mat[, apply(mat, 2, function(x) all(!is.na(x)))]));                                                                           
                                                                                                                                       
delete_row_col <- function(m) {                                                                                                        
  to_delete <- rbind(                                                                                                                  
    data.frame(                                                                                                                        
      dim = "row",                                                                                                                     
      index = seq_len(nrow(m)),                                                                                                        
      nas = rowSums(is.na(m)),                                                                                                         
      non_nas = rowSums(!is.na(m)),                                                                                                    
      stringsAsFactors = FALSE                                                                                                         
    ),                                                                                                                                 
    data.frame(                                                                                                                        
      dim = "col",                                                                                                                     
      index = seq_len(ncol(m)),                                                                                                        
      nas = colSums(is.na(m)),                                                                                                         
      non_nas = colSums(!is.na(m)),                                                                                                    
      stringsAsFactors = FALSE                                                                                                         
    )                                                                                                                                  
  );                                                                                                                                   
  to_delete <- to_delete[to_delete$nas > 0, ];                                                                                         
  to_delete <- to_delete[to_delete$non_nas == min(to_delete$non_nas), ];                                                               
  if (nrow(to_delete) == 0) {                                                                                                          
    return(m);                                                                                                                         
  }                                                                                                                                    
  else if (to_delete$dim[1] == "row") {;                                                                                               
    m <- m[-to_delete$index[1], ];                                                                                                     
  } else { ;                                                                                                                           
    m <- m[, -to_delete$index[1]];                                                                                                     
  };                                                                                                                                   
  return(m);                                                                                                                           
};                                                                                                                                     
remove_matrix_na <- function(m) {;                                                                                                     
  while (any(is.na(m))) {;                                                                                                             
    m <- delete_row_col(m);                                                                                                            
  };                                                                                                                                   
  return(m);                                                                                                                           
};                                                                                                                                     
want<-as.data.frame(remove_matrix_na(mat));                                                                                            
want;                                                                                                                                  
write.xport(want,file="d:/xpt/want.xpt");                                                                                              
');                                                                                                                                    
                                                                                                                                       
libname xpt xport "d:/xpt/want.xpt";                                                                                                   
data want;                                                                                                                             
  set xpt.want;                                                                                                                        
run;quit;                                                                                                                              
libname xpt clear;                                                                                                                     
                                                                                                                                       
                                                                                                                                       
*_                                                                                                                                     
| | ___   __ _                                                                                                                         
| |/ _ \ / _` |                                                                                                                        
| | (_) | (_| |                                                                                                                        
|_|\___/ \__, |                                                                                                                        
         |___/                                                                                                                         
;                                                                                                                                      
                                                                                                                                       
      X1 X2 X3 X4 X5 X6 X7 X8 X9 X10                                                                                                   
 [1,] NA NA NA NA NA NA  0  8  4  NA                                                                                                   
 [2,]  5  3 NA NA  8 NA  6  7  9  NA                                                                                                   
 [3,]  7  8 NA NA NA NA  6  3  5  NA                                                                                                   
 [4,]  9  2  7  4  4 NA  2  3  9  NA                                                                                                   
 [5,]  1  2  3  4  9  3  9  9  9   1                                                                                                   
 [6,]  9  5  9  3  3 NA  5  5  5  NA                                                                                                   
 [7,] NA NA NA  6  8 NA  6  2  1  NA                                                                                                   
 [8,]  8  5  6  9  2 NA  3  9  4  NA                                                                                                   
 [9,] NA NA NA  1  3 NA NA NA NA  NA                                                                                                   
[10,]  1  4  8  9  2  5  7  9  4   9                                                                                                   
[11,]  3  6  6  4  3 NA  7  7  7  NA                                                                                                   
[12,]  2  7  9  9  1 NA  1  7  9  NA                                                                                                   
[13,] NA NA NA NA NA NA  1  4  9  NA                                                                                                   
[14,]  5  3  3  4  9 NA  8  5  5  NA                                                                                                   
[15,] NA NA  0  0  9 NA NA NA NA  NA                                                                                                   
[16,]  6  8 NA NA  9 NA  7 NA  9  NA                                                                                                   
[17,]  8  9  4  9  6 NA  7  6  8  NA                                                                                                   
[18,] NA NA NA NA  5 NA  6  1  9  NA                                                                                                   
[19,]  5  8  8  9  9 NA  0  4  7  NA                                                                                                   
[20,] NA NA  5  0  7 NA  6  3  9  NA                                                                                                   
                                                                                                                                       
                                                                                                                                       
   X1 X2 X3 X4 X5 X7 X8 X9                                                                                                             
1   9  2  7  4  4  2  3  9                                                                                                             
2   1  2  3  4  9  9  9  9                                                                                                             
3   9  5  9  3  3  5  5  5                                                                                                             
4   8  5  6  9  2  3  9  4                                                                                                             
5   1  4  8  9  2  7  9  4                                                                                                             
6   3  6  6  4  3  7  7  7                                                                                                             
7   2  7  9  9  1  1  7  9                                                                                                             
8   5  3  3  4  9  8  5  5                                                                                                             
9   8  9  4  9  6  7  6  8                                                                                                             
10  5  8  8  9  9  0  4  7                                                                                                             
                                                                                                                                       
                                                                                                                                       
                                                                                                                                       
