# utl-remove-nulls-while-retaining-the-most-data-possible
Remove nulls while retaining the most data possible 
    Given a 20 x 10 matrix with many nulls iteratively remove
    columns and rows mainting the maximum number of cells

    Remove nulls while retaining the most data possible

      Three solutions

         a. Proc optmodel (optimum solution has more data. Simple and elegant!!)
            Rob Pratt
            Rob.Pratt@sas.com

         b. Bse SAS solution by
            Paul Dorfman
            sashole@bellsouth.net

         c. R solution by
            Calum You profile
            https://stackoverflow.com/users/7028459/calum-you

    github
    https://tinyurl.com/yxs56kff
    https://github.com/rogerjdeangelis/utl-remove-nulls-while-retaining-the-most-data-possible

    SAS-L
    https://listserv.uga.edu/cgi-bin/wa?A2=SAS-L;662f8b1c.1907c

    Calum You profile
    https://stackoverflow.com/users/7028459/calum-you

    StackOverflow
    https://tinyurl.com/y486e4vm
    https://stackoverflow.com/questions/56917043/removing-all-nas-while-retaining-the-most-data-possible

    SOAPBOX On
      Bobs solution is whay I prefer SAS for MathStat
    SOAPBOX OFF

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

    *            _               _
      ___  _   _| |_ _ __  _   _| |_ ___
     / _ \| | | | __| '_ \| | | | __/ __|
    | (_) | |_| | |_| |_) | |_| | |_\__ \
     \___/ \__,_|\__| .__/ \__,_|\__|___/
                    |_|
    ;

    *                       _                       _      _
      __ _       ___  _ __ | |_ _ __ ___   ___   __| | ___| |
     / _` |     / _ \| '_ \| __| '_ ` _ \ / _ \ / _` |/ _ \ |
    | (_| |_   | (_) | |_) | |_| | | | | | (_) | (_| |  __/ |
     \__,_(_)   \___/| .__/ \__|_| |_| |_|\___/ \__,_|\___|_|
                     |_|
    ;

    Solver                             MILP
    Algorithm                Branch and Cut
    Objective Function       SurvivingCells
    Solution Status                 Optimal
    Objective Value                      72

    Relative Gap                          0
    Absolute Gap                          0
    Primal Infeasibility                  0
    Bound Infeasibility                   0
    Integer Infeasibility                 0

    Best Bound                           72
    Nodes                                 1
    Solutions Found                       3
    Iterations                          155
    Presolve Time                      0.01
    Solution Time                      0.02


                   a
          1    2    5    7    8    9

     2    5    3    8    6    7    9
     3    7    8    9    6    3    5
     4    9    2    4    2    3    9
     5    1    2    9    9    9    9
     6    9    5    3    5    5    5
     8    8    5    2    3    9    4
    10    1    4    2    7    9    4
    11    3    6    3    7    7    7
    12    2    7    1    1    7    9
    14    5    3    9    8    5    5
    17    8    9    6    7    6    8
    19    5    8    9    0    4    7

    *_         _
    | |__     | |__   __ _ ___  ___   ___  __ _ ___
    | '_ \    | '_ \ / _` / __|/ _ \ / __|/ _` / __|
    | |_) |   | |_) | (_| \__ \  __/ \__ \ (_| \__ \
    |_.__(_)  |_.__/ \__,_|___/\___| |___/\__,_|___/

    ;

       | 1 2 3 5 7 8 9
    ---+--------------
     4 | 9 2 7 4 2 3 9
     5 | 1 2 3 9 9 9 9
     6 | 9 5 9 3 5 5 5
     8 | 8 5 6 2 3 9 4
    11 | 3 6 6 3 7 7 7
    12 | 2 7 9 1 1 7 9
    14 | 5 3 3 9 8 5 5
    17 | 8 9 4 6 7 6 8
    19 | 5 8 8 9 0 4 7

    *          ____
      ___     |  _ \
     / __|    | |_) |
    | (__ _   |  _ <
     \___(_)  |_| \_\

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
     ___  ___ | |_   _| |_(_) ___  _ __  ___
    / __|/ _ \| | | | | __| |/ _ \| '_ \/ __|
    \__ \ (_) | | |_| | |_| | (_) | | | \__ \
    |___/\___/|_|\__,_|\__|_|\___/|_| |_|___/

               ____       _        ___        _                       _      _
      __ _    |  _ \ ___ | |__    / _ \ _ __ | |_ _ __ ___   ___   __| | ___| |
     / _` |   | |_) / _ \| '_ \  | | | | '_ \| __| '_ ` _ \ / _ \ / _` |/ _ \ |
    | (_| |_  |  _ < (_) | |_) | | |_| | |_) | |_| | | | | | (_) | (_| |  __/ |
     \__,_(_) |_| \_\___/|_.__/   \___/| .__/ \__|_| |_| |_|\___/ \__,_|\___|_|
                                       |_|
    ;

    You can solve the problem optimally as an integer linear programming problem:

    %let ncols = 10;

    data indata;
       input c1-c&ncols;
    cards4;
    . . . . 2 . 0 8 4 .
    5 3 . . 8 . 6 7 9 .
    7 8 . . 9 . 6 3 5 .
    9 2 7 4 4 . 2 3 9 .
    1 2 3 4 9 3 9 9 9 1
    9 5 9 3 3 . 5 5 5 .
    . . . 6 8 . 6 2 1 1
    8 5 6 9 2 . 3 9 4 .
    . . . 1 3 . . . . .
    1 4 8 . 2 5 7 9 4 9
    3 6 6 4 3 . 7 7 7 .
    2 7 9 9 1 . 1 7 9 .
    . . . . 4 . 1 4 9 .
    5 3 3 4 9 . 8 5 5 .
    . . 0 0 9 . . . . .
    6 8 . . 9 . 7 . 9 .
    8 9 4 9 6 . 7 6 8 .
    . . . . 5 . 6 1 9 .
    5 8 8 9 9 . 0 4 7 .
    . . 5 0 7 . 6 3 9 .

    ;;;;
    run;quit;


    proc optmodel;
       set ROWS;
       set COLS = 1..&ncols;
       set CELLS = ROWS cross COLS;
       num a {CELLS};
       read data indata into ROWS=[_N_] {j in COLS} <a[_N_,j]=col('c'||j)>;
       set NULLS = {<i,j> in CELLS: a[i,j] = .};
       set NONNULLS = CELLS diff NULLS;

       var DeleteRow {ROWS} binary;
       var DeleteCol {COLS} binary;
       var RemoveNonNull {NONNULLS} binary;

       max SurvivingCells = card(NONNULLS) - sum {<i,j> in NONNULLS} RemoveNonNull[i,j];

       con RemoveEveryNull {<i,j> in NULLS}:
          DeleteRow[i] + DeleteCol[j] >= 1;
       con DeleteWholeRow {<i,j> in NONNULLS}:
          DeleteRow[i] <= RemoveNonNull[i,j];
       con DeleteWholeCol {<i,j> in NONNULLS}:
          DeleteCol[j] <= RemoveNonNull[i,j];
       solve;

       print {<i,j> in NONNULLS: RemoveNonNull[i,j].sol < 0.5} a;

    quit;

    *_         _
    | |__     | |__   __ _ ___  ___   ___  __ _ ___
    | '_ \    | '_ \ / _` / __|/ _ \ / __|/ _` / __|
    | |_) |   | |_) | (_| \__ \  __/ \__ \ (_| \__ \
    |_.__(_)  |_.__/ \__,_|___/\___| |___/\__,_|___/

    ;


    Just encountered this curious puzzle from your R domain while going over
    my SAS-L backlog. To recap: There's a 20x10 matrix with nulls in some rows and some columns:

    . . . . 2 . 0 8 4 .
    5 3 . . 8 . 6 7 9 .
    7 8 . . 9 . 6 3 5 .
    9 2 7 4 4 . 2 3 9 .
    1 2 3 4 9 3 9 9 9 1
    9 5 9 3 3 . 5 5 5 .
    . . . 6 8 . 6 2 1 1
    8 5 6 9 2 . 3 9 4 .
    . . . 1 3 . . . . .
    1 4 8 . 2 5 7 9 4 9
    3 6 6 4 3 . 7 7 7 .
    2 7 9 9 1 . 1 7 9 .
    . . . . 4 . 1 4 9 .
    5 3 3 4 9 . 8 5 5 .
    . . 0 0 9 . . . . .
    6 8 . . 9 . 7 . 9 .
    8 9 4 9 6 . 7 6 8 .
    . . . . 5 . 6 1 9 .
    5 8 8 9 9 . 0 4 7 .
    . . 5 0 7 . 6 3 9 .

    The goal: Find such a sequence of deleting a number of whole
    rows/columns containing at least one null that in the end:

    - the resulting matrix has no nulls
    - the number of the remaining non-null values is maximally possible

    Naturally, it's interesting how this optimization task can be approached
    using the SAS language. However, this is a secondary challenge - and, as
    you will see below, not hard at all. The primary challenge is to decide
    on the algorithm, whose difficulty lies in the fact that every act of
    deleting a row or a column with one or more nulls affects the next selection of a row/column to
    be deleted. Obviously, exploring every possible path and comparing the
    final results is something like a O(2**(2N)) run time job - pretty much
    a dead end even for a modest-size matrix like in your 20x10 sample. Hence,
    using some sort of heuristic approach is unavoidable. Below, I'm trying the simplest one:

    1. Compute the aggregate Nmiss and N for every row, skipping the row
    numbers marked as "deleted" in key-indexed table RX[R].
    2. Compute the aggregate Nmiss and N for every col, skipping the col
    numbers marked as "deleted" in key-indexed table CX[C].
    3. Find the row RM with the highest Nmiss/N ratio RQ.
    4. Find the col CM with the highest Nmiss/N ration CQ.
    5. Compare RQ with CQ. If RQ > CQ, mark row # RM as deleted; otherwise, mark col # CM as deleted.
    6. If no nulls have been detected in steps 1 and 2, stop.
    7. Otherwise, go to 1.

    In the SAS language:

    %let r = 20 ;
    %let c = 10 ;

    data _null_ ;
      array rc [&r,&c] _temporary_
    (
    . . . . 2 . 0 8 4 .
    5 3 . . 8 . 6 7 9 .
    7 8 . . 9 . 6 3 5 .
    9 2 7 4 4 . 2 3 9 .
    1 2 3 4 9 3 9 9 9 1
    9 5 9 3 3 . 5 5 5 .
    . . . 6 8 . 6 2 1 1
    8 5 6 9 2 . 3 9 4 .
    . . . 1 3 . . . . .
    1 4 8 . 2 5 7 9 4 9
    3 6 6 4 3 . 7 7 7 .
    2 7 9 9 1 . 1 7 9 .
    . . . . 4 . 1 4 9 .
    5 3 3 4 9 . 8 5 5 .
    . . 0 0 9 . . . . .
    6 8 . . 9 . 7 . 9 .
    8 9 4 9 6 . 7 6 8 .
    . . . . 5 . 6 1 9 .
    5 8 8 9 9 . 0 4 7 .
    . . 5 0 7 . 6 3 9 .
    ) ;
      array rv [2,&r] _temporary_ ; /* First index: 1 = row N, 2 = row Nmiss */
      array cv [2,&c] _temporary_ ; /* First index: 1 = col N, 2 = col Nmiss */
      array rx [  &r] _temporary_ ; /* rx[r]=1 marks row # r as deleted */
      array cx [  &c] _temporary_ ; /* cx[c]=1 marks col # c as deleted */

      do until (nomiss) ;
        nomiss = 1 ;
        /* Compute row and col aggregate N and Nmiss */
        /* If rx[r]=1 / cx[c]=1, skip row=r / col=c  */
        call missing (of rv[*], of cv[*], rq, cq) ;
        do r = 1 to &r ;
          if not rx[r] then do c = 1 to &c ;
            if cx[c] then continue ;
            if N (rc[r,c]) then do ;
              rv[1,r] + 1 ;
              cv[1,c] + 1 ;
            end ;
            else do ;
              rv[2,r] + 1 ;
              cv[2,c] + 1 ;
              nomiss = 0 ;
            end ;
          end ;
        end ;
        /* Find row with greatest Nmiss/N ratio */
        do r = 1 to &r ;
          if rx[r] then continue ;
          q = divide (rv[2,r], rv[1,r]) ;
          if q <= rq then continue ;
          rq = q ;
          rm = r ;
        end ;
        /* Find col with greatest Nmiss/N ratio */
        do c = 1 to &c ;
          if cx[c] then continue ;
          q = divide (cv[2,c], cv[1,c]) ;
          if q <= cq then continue ;
          cq = q ;
          cm = c ;
        end ;
        /* Mark row/col number to skip based on rq/cq */
        if rq > cq then rx[rm] = 1 ;
        else            cx[cm] = 1 ;
      end ;
      /* For rx[r]=1 / cx[c]=1, r/c are final rows/cols to be deleted  */
      /* Print the matrix in the log skipping all rx[r]=1 / cx[c]=1 */
      put @4 "|" @ ;
      do c = 1 to &c ;
        if cx[c] then continue ;
        put c 2.-r @ ;
      end ;
      put / 18*"-" @4 "+" ;
      do r = 1 to &r ;
        if rx[r] then continue ;
        put r 2.-r " |" @ ;
        do c = 1 to &c ;
          if cx[c] then continue ;
          put rc[r,c] 2.-r @ ;
        end ;
        put ;
      end ;
    run ;

    The program prints the following in the log (the leftmost/topmost figures are the remaining row/col numbers):

       | 1 2 3 5 7 8 9
    ---+--------------
     4 | 9 2 7 4 2 3 9
     5 | 1 2 3 9 9 9 9
     6 | 9 5 9 3 5 5 5
     8 | 8 5 6 2 3 9 4
    11 | 3 6 6 3 7 7 7
    12 | 2 7 9 1 1 7 9
    14 | 5 3 3 9 8 5 5
    17 | 8 9 4 6 7 6 8
    19 | 5 8 8 9 0 4 7

    Of course, this approach doesn't guarantee that the optimal solution is found. However, heuristically speaking, it should be close eno

    Best regards
    Paul


    *          ____
      ___     |  _ \
     / __|    | |_) |
    | (__ _   |  _ <
     \___(_)  |_| \_\

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


