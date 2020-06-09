G = LOAD '$G' USING PigStorage(',') AS ( x:long, y:long );
grp_g = GROUP G BY $1;
R = FOREACH grp_g GENERATE $0 AS a, COUNT($1) AS b;
X = ORDER R BY b DESC;
STORE X INTO '$O' USING PigStorage(',');