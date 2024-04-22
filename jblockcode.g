#Requires nilporbits.g

#SET UP E6 ROOTS IN E7 AND E7 ROOTS IN E8

g:=SimpleLieAlgebra("E",8,Rationals);
h:=SimpleLieAlgebra("E",7,Rationals);
k:=SimpleLieAlgebra("E",6,Rationals);
l:=SimpleLieAlgebra("F",4,Rationals);
m:=SimpleLieAlgebra("G",2,Rationals);

B:=Basis(g);
Bh:=Basis(h);
Bk:=Basis(k);
Bl:=Basis(l);
Bm:=Basis(m);

Rg:=RootSystem(g);
Rh:=RootSystem(h);
Rk:=RootSystem(k);
Rl:=RootSystem(l);
Rm:=RootSystem(m);

posRg:=PositiveRoots(Rg);
posRh:=PositiveRoots(Rh);
posRk:=PositiveRoots(Rk);
posRl:=PositiveRoots(Rl);
posRm:=PositiveRoots(Rm);

Sg := SimpleSystem(Rg);
Sh := SimpleSystem(Rh);
Sk := SimpleSystem(Rk);
Sl := SimpleSystem(Rl);
Sm := SimpleSystem(Rm);

rCg := [];# define a matrix with coefficients of roots
for i in [1..Length(posRg)] do
  rCg[i] := SolutionMat(Sg,posRg[i]);
od;

rCh := [];
for i in [1..Length(posRh)] do
  rCh[i] := SolutionMat(Sh,posRh[i]);
od;

rCk := [];
for i in [1..Length(posRk)] do
  rCk[i] := SolutionMat(Sk,posRk[i]);
od;

rCl := [];# define a matrix with coefficients of roots
for i in [1..Length(posRl)] do
  rCl[i] := SolutionMat(Sl,posRl[i]);
od;

rCm := [];# define a matrix with coefficients of roots
for i in [1..Length(posRm)] do
  rCm[i] := SolutionMat(Sm,posRm[i]);
od;

rChing:=List(rCh,i->Position(rCg,Concatenation(i,[0])));    

rCkinh:=List(rCk,i->Position(rCh,Concatenation(i,[0])));    


#Find the V_56 in E_8 and V_27 in E7 and V8 in E7

list:=[];
count:=0;
for coeff in rCg do
  if coeff[8]=1 then
    count := count+1;
    list[count] := coeff;
  fi;
od;

Blist:=List(list,i->Position(rCg,i));
BV:=B{Blist};

list:=[];
count:=0;
for coeff in rCh do
  if coeff[7]=1 then
    count := count+1;
    list[count] := coeff;
  fi;
od;

Blisth:=List(list,i->Position(rCh,i));
BVh:=Bh{Blisth};

list:=[];
count:=0;
for coeff in rCh do
  if coeff[7]=0 and coeff[6]=0 and coeff[1]=1 then
    count := count+1;
    list[count] := coeff;
  fi;
od;

Blistj:=List(list,i->Position(rCh,i));
BVj:=Bh{Blistj};

#List of nilpotent orbits reps of E7 as members of E8 and E6 of E7

orbs:=OrbitsE7_0(B{rChing});

orbs2:=OrbitsE7_2(B{rChing});
#orbs2:=OrbitsE7(B{rChing});

orbsh:=OrbitsE6(Bh{rCkinh});


#List of Positive root elements of F4 as coefficients of E7

F4rootcoeffsE7:=
[ [ 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 1, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, -1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] ];

Bkl:=F4rootcoeffsE7*Bh;

#Vector stabilised by F4
v:=BVh[13]+BVh[14]+BVh[15];

#Orbits of F4 in E6 Levi of E7
orbsf:=OrbitsF4_0(Bkl);
orbsf2:=OrbitsF4_2(Bkl);

#... as 27x27 matrices
f4mats:=List(orbsf,i->List(BVh,j->Coefficients(Bh,i*j){Blisth}));
f4mats2:=List(orbsf2,i->List(BVh,j->Coefficients(Bh,i*j){Blisth}));

#... as 26x26 matrices
qumat:=function(mat)
local temp,i;
temp:=mat{Concatenation([1..14],[16..27])};
for i in [1..26] do
temp[i][13]:=temp[i][13]-temp[i][15];
temp[i][14]:=temp[i][14]-temp[i][15];
Remove(temp[i],15);
od;
return temp;
end;;


f4matsq:=List(ShallowCopy(f4mats),qumat);
f4matsq2:=List(ShallowCopy(f4mats2),qumat);  



#List of Positive root elements of G2 as coefficients of D4 in E7
G2rootcoeffsE7:=
[ [ 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] ];

Bkm:=G2rootcoeffsE7*Bh;

#Vector stabilised by G2
v:=BVj[4]+BVj[5];

orbsg:=OrbitsG2_0(Bkm);
orbsg2:=OrbitsG2_2(Bkm);
orbsg3:=OrbitsG2_3(Bkm);

#... as 8x8 matrices
g2mats:=List(orbsg,i->List(BVj,j->Coefficients(Bh,i*j){Blistj}));
g2mats2:=List(orbsg2,i->List(BVj,j->Coefficients(Bh,i*j){Blistj}));
g2mats3:=List(orbsg3,i->List(BVj,j->Coefficients(Bh,i*j){Blistj}));

#... as 7x7 matrices
qumat2:=function(mat)
local temp,i;
temp:=mat{Concatenation([1..4],[6..8])};
for i in [1..7] do
temp[i][4]:=temp[i][4]-temp[i][5];
Remove(temp[i],5);
od;
return temp;
end;;


g2matsq:=List(ShallowCopy(g2mats),qumat2);
g2matsq2:=List(ShallowCopy(g2mats2),qumat2);  
g2matsq3:=List(ShallowCopy(g2mats3),qumat2);  

#JBlockmat

PrimeDivisorsOfList:=function(list)
    local i,j,primelist;
    primelist:=[];
    for i in list do
        if i<>0 then UniteSet(primelist,FactorsInt(i));fi;
    od;
    return primelist;
end;;


jblockmat:=function(eMat)

local mat,i,j,r,k;

mat:=eMat;;
i:=1;
j:=[Length(eMat)];

while (i>0) do

r:=RankMat(mat);
if r>0 then
Append(j,[r]);
mat:=mat*eMat;
else
i:=0;
fi;
od;

k:=[];
while Length(j)>0 do
if j[Length(j)]>0 then
Append(k,[[Length(j), j[Length(j)] ]] );
fi;
for i in [1..Length(j)] do
j[i]:=j[i]-(Length(j)-i+1)*j[Length(j)];
od;
Remove(j);
od;

return k;
end;;

jblockexmat:=function(eMat)

local mat,i,j,r,k,primes,ps;

    primes:=[];

    #mat:=List(eMat,i->ShallowCopy(List(ShallowCopy(i))));;
    mat:=eMat;
    i:=1;
    j:=[Length(eMat)];

    while (i>0) do
        UniteSet(primes,PrimeDivisorsOfList(ElementaryDivisorsMat(mat)));
        r:=RankMat(mat);
        
        if r>0 then
            Append(j,[r]);
            mat:=mat*eMat;
        else
            i:=0;
        fi;
    od;

    k:=[];
    while Length(j)>0 do
        if j[Length(j)]>0 then
            Append(k,[[Length(j), j[Length(j)] ]] );
        fi;
        for i in [1..Length(j)] do
            j[i]:=j[i]-(Length(j)-i+1)*j[Length(j)];
        od;
        Remove(j);
    od;

    return [k,primes];
end;;


jblockpmat:=function(eMatIn,p)

local eMat,mat,i,j,r,k,d;

eMat:=NullMat(Length(eMatIn),Length(eMatIn),GF(p))+eMatIn;

mat:=eMat;;
i:=1;
j:=[Length(eMat)];

while (i>0) do

r:=RankMat(mat);
if r>0 then
Append(j,[r]);
mat:=mat*eMat;
else
i:=0;
fi;
od;

k:=[];
while Length(j)>0 do
if j[Length(j)]>0 then
Append(k,[[Length(j), j[Length(j)] ]] );
fi;
for i in [1..Length(j)] do
j[i]:=j[i]-(Length(j)-i+1)*j[Length(j)];
od;
Remove(j);
od;

return k;
end;;



#Modified Jblock code for when e acts on a subset BV of basis vectors B, where BV[i] is B[Blist[i]].

jblockb:=function(B,BV,Blist,e)

local eMat,mat,i,j,r,k;

eMat:=List(BV,i->Coefficients(B,i*e){Blist});

mat:=eMat;;
i:=1;
j:=[Length(eMat)];

while (i>0) do

r:=RankMat(mat);
if r>0 then
Append(j,[r]);
mat:=mat*eMat;
else
i:=0;
fi;
od;

k:=[];
while Length(j)>0 do
if j[Length(j)]>0 then
Append(k,[[Length(j), j[Length(j)] ]] );
fi;
for i in [1..Length(j)] do
j[i]:=j[i]-(Length(j)-i+1)*j[Length(j)];
od;
Remove(j);
od;

return k;
end;;



#FINDS THE JBLOCKS OF A NILPOTENT ELEMENT DEFINED OVER Z AND A LIST OF ANY EXCEPTIONAL PRIMES

jblockbex:=function(B,BV,Blist,e)

local eMat,mat,i,j,r,k,primes,ps;

primes:=[];


eMat:=List(BV,i->Coefficients(B,i*e){Blist});

mat:=eMat;;
i:=1;
j:=[Length(eMat)];

while (i>0) do

UniteSet(primes,PrimeDivisorsOfList(ElementaryDivisorsMat(mat)));
r:=RankMat(mat);
if r>0 then
Append(j,[r]);
mat:=mat*eMat;
else
i:=0;
fi;
od;

k:=[];
while Length(j)>0 do
if j[Length(j)]>0 then
Append(k,[[Length(j), j[Length(j)] ]] );
fi;
for i in [1..Length(j)] do
j[i]:=j[i]-(Length(j)-i+1)*j[Length(j)];
od;
Remove(j);
od;

return [k,primes];
end;;


#FINDS THE JBLOCKS OF A NILPOTENT ELEMENT OVER F_p

jblockbp:=function(B,BV,Blist,e,p)

local eMat,mat,i,j,r,k,d;

d:=Length(BV);

eMat:=NullMat(d,d,GF(p))+List(BV,i->Coefficients(B,i*e){Blist});

mat:=eMat;;
i:=1;
j:=[d];

while (i>0) do

    r:=RankMat(mat);
        if r>0 then
        Append(j,[r]);
        mat:=mat*eMat;
        else
        i:=0;
        fi;
    od;

k:=[];
while Length(j)>0 do
if j[Length(j)]>0 then
Append(k,[[Length(j), j[Length(j)] ]] );
fi;
for i in [1..Length(j)] do
j[i]:=j[i]-(Length(j)-i+1)*j[Length(j)];
od;
Remove(j);
od;

return k;
end;;



##TURN A JBLOCK INTO LATEX

latexify:=function (jbl)
local list,lists,i;

list:="";

for i in jbl do
if i[2]=1 then
Append(list,Concatenation(String(i[1]),","));
else
Append(list,Concatenation(String(i[1]),"^{",String(i[2]),"},"));
fi;
od;


return list{[1..Length(list)-1]};
end;;


## PRINT THE JBLOCKS AS A TABLE

# In order we should have, table 2, minimals, E7, E6, F4, G2

name:=Filename(DirectoryCurrent(),"jbs-min.tex");
output:=OutputTextFile(name,false);
SetPrintFormattingStatus(output,false);

#E7 Minimal

#AppendTo(output,"\\begin{table}");
AppendTo(output,"\\begin{multicols}{2}");
AppendTo(output,"\\setbox\\ltmcbox\\vbox{\\makeatletter\\col@number\\@ne");
AppendTo(output,"\\tiny\\begin{longtable}{l l l}");

for i in [1..Length(orbs2)] do
	r:=Position(OrbitLabelsE7_0,OrbitLabelsE7_2[i]);
	if r<>fail then
        e:=orbs[r];
        e2:=orbs2[i];
        jex:=jblockbex(B,BV,Blist,e);
        AppendTo(output,"$",OrbitLabelsE7_0[r],"$");
        for p in jex[2] do
            if p=2 then AppendTo(output," & $" , p , "$ & $", latexify(jblockbp(B,BV,Blist,e2,p)),"$\\\\\n"); fi;
            if p>2 then AppendTo(output," & $" , p , "$ & $", latexify(jblockbp(B,BV,Blist,e,p)),"$\\\\\n"); fi;
        od;
        AppendTo(output," & others & $", latexify(jblockb(B,BV,Blist,e)),"$\n");
	else
        e2:=orbs2[i];
		AppendTo(output,"$",OrbitLabelsE7_2[i],"$ & 2 & $", latexify(jblockbp(B,BV,Blist,e2,2)),"$\n");
	fi;
	AppendTo(output,"\\\\\\hline\n");
od;

AppendTo(output,"\\end{longtable}\\unskip\\unpenalty\\unpenalty}\\unvbox\\ltmcbox");
AppendTo(output,"\\end{multicols}\n\\smallskip");
AppendTo(output,"\\begin{table}[!h]\\caption{Jordan Blocks of nilpotent elements on the module $V_{56}$ for $E_7$\\label{t2}}\\end{table}");
#"\\end{table}\\newpage");


#E6 Minimal

AppendTo(output,"\\begin{multicols}{3}\\tiny\\begin{tabular}{l l l}");

for i in [1..Length(orbsh)] do
	e:=orbsh[i];
	jex:=jblockbex(Bh,BVh,Blisth,e);
	AppendTo(output,"$",OrbitLabelsE6[i],"$");
	for p in jex[2] do
		if p>1 then AppendTo(output," & $" , p , "$ & $", latexify(jblockbp(Bh,BVh,Blisth,e,p)),"$\\\\\n");fi;
	od;
	AppendTo(output," & others & $", latexify(jblockb(Bh,BVh,Blisth,e)),"$\n");
	AppendTo(output,"\\\\\\hline\n");
od;

AppendTo(output,"\\end{tabular}\\\\\\newcolumn\\\\ \n");

#F4 minimal

AppendTo(output,"\\begin{tabular}{l l l}\n");

for i in [1..Length(orbsf2)] do
	r:=Position(OrbitLabelsF4_0,OrbitLabelsF4_2[i]);
	if r<>fail then
		jex:=jblockexmat(f4matsq[r]);
		AppendTo(output,"$",OrbitLabelsF4_0[r],"$");
		for p in jex[2] do
			if p=2 then AppendTo(output," & $" , p , "$ & $", latexify(jblockpmat(f4matsq2[i],p)),"$\\\\\n"); fi;
			if p>2 then AppendTo(output," & $" , p , "$ & $", latexify(jblockpmat(TransposedMat(f4matsq[r]),p)),"$\\\\\n"); fi;
		od;
		AppendTo(output," & others & $", latexify(jex[1]),"$\n");
	else
		AppendTo(output,"$",OrbitLabelsF4_2[i],"$ & 2 & $", latexify(jblockpmat(f4matsq2[i],2)),"$\n");
	fi;
	AppendTo(output,"\\\\\\hline\n");
od;
AppendTo(output,"\\end{tabular}\\\\\\newcolumn\\\\ \n");

#G2 minimal

AppendTo(output,"\\begin{tabular}{l l l}\n");

for i in [1..Length(orbsg3)] do
	r:=Position(OrbitLabelsG2_0,OrbitLabelsG2_3[i]);
	if r<>fail then
		jex:=jblockexmat(g2matsq[r]);
		AppendTo(output,"$",OrbitLabelsG2_0[r],"$");
		for p in jex[2] do
			if p=2 then AppendTo(output," & $" , p , "$ & $", latexify(jblockpmat(g2matsq2[r],p)),"$\\\\\n"); fi;
			if p=3 then AppendTo(output," & $" , p , "$ & $", latexify(jblockpmat(g2matsq3[i],p)),"$\\\\\n"); fi;
			if p>3 then AppendTo(output," & $" , p , "$ & $", latexify(jblockpmat(g2matsq[r],p)),"$\\\\\n"); fi;
		od;
		AppendTo(output," & others & $", latexify(jex[1]),"$\n");
	else
		AppendTo(output,"$",OrbitLabelsG2_3[i],"$ & 3 & $", latexify(jblockpmat(g2matsq3[i],3)),"$\n");
	fi;
	AppendTo(output,"\\\\\\hline\n");
od;

AppendTo(output,"\\end{tabular}");
AppendTo(output,"\\end{multicols}\n\\smallskip");
AppendTo(output,"\\begin{table}[!h]\\caption{Jordan Blocks of nilpotent elements on the module $V_{27}$ for $E_6$, $V_{26}$ for $F_4$ and $V_7$ for $G_2$\\label{t3}}","\\end{table}");

CloseStream(output);

#Adjoints

name:=Filename(DirectoryCurrent(),"jbs-ads.tex");
output:=OutputTextFile(name,false);
SetPrintFormattingStatus(output,false);


# # E8 Adjoint

AppendTo(output,"\\begin{multicols}{2}");
AppendTo(output,"\\setbox\\ltmcbox\\vbox{\\makeatletter\\col@number\\@ne");
AppendTo(output,"\\tiny\\begin{longtable}{l l l}");

orbse8_2:=OrbitsE8_2(B);
orbse8_3:=OrbitsE8_3(B);
orbse8_0:=OrbitsE8_0(B);

e8adjmats_2:=List(orbse8_2,i->AdjointMatrix(B,i));
e8adjmats_3:=List(orbse8_3,i->AdjointMatrix(B,i));
e8adjmats_0:=List(orbse8_0,i->AdjointMatrix(B,i));

OrbitLabelsE8_all:=ShallowCopy(OrbitLabelsE8_2);
Add(OrbitLabelsE8_all,"(A_{7})^{(3)}",21);

for i in OrbitLabelsE8_all do
    Print(i,"\n");
    AppendTo(output,"$",i,"$");
    r2:=Position(OrbitLabelsE8_2,i);
    r3:=Position(OrbitLabelsE8_3,i);
    r0:=Position(OrbitLabelsE8_0,i);

    if r0<>fail then
        jex:=jblockexmat(e8adjmats_0[r0]);
        for p in jex[2] do
            if p=2 then AppendTo(output," & $" , 2 , "$ & $", latexify(jblockpmat(e8adjmats_2[r2],2)),"$\\\\\n"); fi;
            if p=3 then AppendTo(output," & $" , 3 , "$ & $", latexify(jblockpmat(e8adjmats_3[r3],3)),"$\\\\\n"); fi;
            if p>3 then AppendTo(output," & $" , p , "$ & $", latexify(jblockpmat(e8adjmats_0[r0],p)),"$\\\\\n"); fi;
        od;
        AppendTo(output," & others & $", latexify(jex[1]),"$\\\\\n");
    elif r3<>fail then
        AppendTo(output," & $" , 3 , "$ & $", latexify(jblockpmat(e8adjmats_3[r3],3)),"$\\\\\n");
    else
        AppendTo(output," & $" , 2 , "$ & $", latexify(jblockpmat(e8adjmats_2[r2],2)),"$\\\\\n");
    fi;
    AppendTo(output,"\\hline\n");
od;

AppendTo(output,"\\end{longtable}\\unskip\\unpenalty\\unpenalty}\\unvbox\\ltmcbox");
AppendTo(output,"\\end{multicols}\n\\smallskip");
AppendTo(output,"\\begin{table}[!h]\\caption{Jordan Blocks of nilpotent elements on the adjoint module for $E_8$\\label{e8a}}\\end{table}");


#E7 Adjoint

AppendTo(output,"\\newpage\n\n\\begin{multicols}{2}");
AppendTo(output,"\\setbox\\ltmcbox\\vbox{\\makeatletter\\col@number\\@ne");
AppendTo(output,"\\tiny\\begin{longtable}{l l l}");

horbse7:=OrbitsE7_2(Bh);

e7adjmats:=List(horbse7,i->AdjointMatrix(Bh,i));

for i in [1..Length(orbs2)] do
	r:=Position(OrbitLabelsE7_0,OrbitLabelsE7_2[i]);
	if r<>fail then
        jex:=jblockexmat(e7adjmats[i]);
        AppendTo(output,"$",OrbitLabelsE7_0[r],"$");
        for p in jex[2] do
            #if p=2 then AppendTo(output," & $" , p , "$ & $", latexify(jblockpmat(e7adjmats[i],p)),"$\\\\\n"); fi;
            #if p>2 then AppendTo(output," & $" , p , "$ & $", latexify(jblockpmat(e7adjmats[r],p)),"$\\\\\n"); fi;
            if p>1 then AppendTo(output," & $" , p , "$ & $", latexify(jblockpmat(e7adjmats[i],p)),"$\\\\\n"); fi;
        od;
        AppendTo(output," & others & $", latexify(jex[1]),"$\\\\\n");
	else
		AppendTo(output,"$",OrbitLabelsE7_2[i],"$ & 2 & $", latexify(jblockpmat(e7adjmats[i],2)),"$\\\\\n");
	fi;
	AppendTo(output,"\\hline\n");
od;

AppendTo(output,"\\end{longtable}\\unskip\\unpenalty\\unpenalty}\\unvbox\\ltmcbox");
AppendTo(output,"\\end{multicols}\n\\smallskip");
AppendTo(output,"\\begin{table}[!h]\\caption{Jordan Blocks of nilpotent elements on the adjoint module for $E_7$\\label{e7a}}\\end{table}");


#E6 Adjoint

AppendTo(output,"\\newpage\n\n\\begin{multicols}{2}");
AppendTo(output,"\\setbox\\ltmcbox\\vbox{\\makeatletter\\col@number\\@ne");
AppendTo(output,"\\tiny\\begin{longtable}{l l l}");

korbse6:=OrbitsE6(Bk);

e6adjmats:=List(korbse6,i->AdjointMatrix(Bk,i));

for i in [1..Length(orbsh)] do
	jex:=jblockexmat(e6adjmats[i]);
	AppendTo(output,"$",OrbitLabelsE6[i],"$");
	for p in jex[2] do
		if p>1 then AppendTo(output," & $" , p , "$ & $", latexify(jblockpmat(e6adjmats[i],p)),"$\\\\\n");fi;
	od;
	AppendTo(output," & others & $", latexify(jex[1]),"$\\\\\n");
	AppendTo(output,"\\hline\n");
od;

AppendTo(output,"\\end{longtable}\\unskip\\unpenalty\\unpenalty}\\unvbox\\ltmcbox");
AppendTo(output,"\\end{multicols}\n\\smallskip");
AppendTo(output,"\\begin{table}[!h]\\caption{Jordan Blocks of nilpotent elements on the adjoint module for $E_6$\\label{e6a}}\\end{table}");


#F4 adjoint

AppendTo(output,"\\newpage\n\n\\begin{multicols}{3}\n");
AppendTo(output,"\\setbox\\ltmcbox\\vbox{\\makeatletter\\col@number\\@ne\n");
AppendTo(output,"\\tiny\\begin{longtable}{l l l}");

lorbsf2:=OrbitsF4_2(Bl);

f4adjmats:=List(lorbsf2,i->AdjointMatrix(Bl,i));

for i in [1..Length(orbsf2)] do
	r:=Position(OrbitLabelsF4_0,OrbitLabelsF4_2[i]);
	if r<>fail then
		jex:=jblockexmat(f4adjmats[i]);
        # AppendTo(output,"\n",jex,"\n","\n i=",i," r=",r,"\n");
		AppendTo(output,"$",OrbitLabelsF4_0[r],"$");
		for p in jex[2] do
			if p=2 then AppendTo(output," & $" , p , "$ & $", latexify(jblockpmat(f4adjmats[i],p)),"$\\\\\n"); fi;
            if p>2 then AppendTo(output," & $" , p , "$ & $", latexify(jblockpmat(f4adjmats[i],p)),"$\\\\\n"); fi;
		od;
		AppendTo(output," & others & $", latexify(jex[1]),"$\\\\\n");
	else
		AppendTo(output,"$",OrbitLabelsF4_2[i],"$ & 2 & $", latexify(jblockpmat(f4adjmats[i],2)),"$\\\\\n");
	fi;
	AppendTo(output,"\\hline\n");
od;
AppendTo(output,"\\end{longtable}\\unskip\\unpenalty\\unpenalty}\\unvbox\\ltmcbox\\newcolumn\\ \n");


#G2 adjoint

AppendTo(output,"\\tiny\\begin{tabular}{l l l}");

morbsg3:=OrbitsG2_3(Bm);

g2adjmats:=List(morbsg3,i->AdjointMatrix(Bm,i));

for i in [1..Length(orbsg3)] do
	r:=Position(OrbitLabelsG2_0,OrbitLabelsG2_3[i]);
	if r<>fail then
		jex:=jblockexmat(g2adjmats[r]);
		AppendTo(output,"$",OrbitLabelsG2_0[r],"$");
		for p in jex[2] do
			if p=2 then AppendTo(output," & $" , p , "$ & $", latexify(jblockpmat(g2adjmats[r],p)),"$\\\\\n"); fi;
			if p=3 then AppendTo(output," & $" , p , "$ & $", latexify(jblockpmat(g2adjmats[i],p)),"$\\\\\n"); fi;
			if p>3 then AppendTo(output," & $" , p , "$ & $", latexify(jblockpmat(g2adjmats[r],p)),"$\\\\\n"); fi;
		od;
		AppendTo(output," & others & $", latexify(jex[1]),"$\\\\\n");
	else
		AppendTo(output,"$",OrbitLabelsG2_3[i],"$ & 3 & $", latexify(jblockpmat(g2adjmats[i],3)),"$\\\\\n");
	fi;
	AppendTo(output,"\\hline\n");
od;
AppendTo(output,"\n");
AppendTo(output,"\\end{tabular}");
AppendTo(output,"\\end{multicols}\\begin{table}[!h]\\caption{Jordan Blocks of nilpotent elements on the adjoint module for $F_4$ and $G_2$\\label{f4g2a}}\\end{table}");


CloseStream(output);




#FINDS THE ADJOINT JBLOCKS OF A NILPOTENT ELEMENT DEFINED OVER Z

jblock:=function(B,e)

local eMat,mat,i,j,r,k;

eMat:=AdjointMatrix(B,e);

mat:=eMat;;
i:=1;
j:=[Dimension(g)];

while (i>0) do

r:=RankMat(mat);
if r>0 then
Append(j,[r]);
mat:=mat*eMat;
else
i:=0;
fi;
od;

k:=[];
while Length(j)>0 do
if j[Length(j)]>0 then
Append(k,[[Length(j), j[Length(j)] ]] );
fi;
for i in [1..Length(j)] do
j[i]:=j[i]-(Length(j)-i+1)*j[Length(j)];
od;
Remove(j);
od;

return k;
end;;


#FINDS THE JBLOCKS OF A NILPOTENT ELEMENT DEFINED OVER Z AND A LIST OF ANY EXCEPTIONAL PRIMES

jblockex:=function(B,e)

local eMat,mat,i,j,r,k,primes,ps;

primes:=[];

eMat:=AdjointMatrix(B,e);

mat:=eMat;;
i:=1;
j:=[Dimension(g)];

while (i>0) do

UniteSet(primes,PrimeDivisorsOfList(ElementaryDivisorsMat(mat)));
r:=RankMat(mat);
if r>0 then
Append(j,[r]);
mat:=mat*eMat;
else
i:=0;
fi;
od;

k:=[];
while Length(j)>0 do
if j[Length(j)]>0 then
Append(k,[[Length(j), j[Length(j)] ]] );
fi;
for i in [1..Length(j)] do
j[i]:=j[i]-(Length(j)-i+1)*j[Length(j)];
od;
Remove(j);
od;

return [k,primes];
end;;


#FINDS THE JBLOCKS OF A NILPOTENT ELEMENT OVER F_p

jblockp:=function(B,e,p)

local eMat,mat,i,j,r,k,d;

d:=Length(B);

eMat:=NullMat(d,d,GF(p))+AdjointMatrix(B,e);

mat:=eMat;;
i:=1;
j:=[d];

while (i>0) do
    r:=RankMat(mat);
    if r>0 then
        Append(j,[r]);
        mat:=mat*eMat;
    else
        i:=0;
    fi;
od;

k:=[];
while Length(j)>0 do
    if j[Length(j)]>0 then
        Append(k,[[Length(j), j[Length(j)] ]] ); #
    fi;
    for i in [1..Length(j)] do
        j[i]:=j[i]-(Length(j)-i+1)*j[Length(j)];
    od;
    Remove(j);
od;

return k;
end;;



# SMOOTHNESS CALCS

#The F4 as a subalgebra of E6<E7:

f4s:=Subalgebra(h,[Bh[1]+Bh[6],Bh[2],Bh[3]+Bh[5],Bh[4],Bh[64]+Bh[69],Bh[65],Bh[66]+Bh[68],Bh[67]]);
Bf:=Basis(f4s);

#Find 26x26 matrices of vectors of f4

fmats:=List(Bf,i->List(BVh,j->Coefficients(Bh,i*j){Blisth}));
fmatsq:=List(fmats,qumat);



#The G2 as a subalgebra of E_6<E_7

g2s:=Subalgebra(h,[Bh[2]+Bh[3]+Bh[5],Bh[4],Bh[65]+Bh[66]+Bh[68],Bh[67]]);
Bg:=Basis(g2s);

#Find 7x7 matrices of vectors of g2

gmats:=List(Bg,i->List(BVj,j->Coefficients(Bh,i*j){Blistj}));
gmatsq:=List(gmats,qumat2);

#exponentiate root elements.



#The E7 and subalgebra of E8

e7s:=Subalgebra(g,[B[1],B[2],B[3],B[4],B[5],B[6],B[7],B[121],B[122],B[123],B[124],B[125],B[126],B[127]]);
Be7:=Basis(e7s);

#Representatives for v in V56

v1:=B[8]; #E6 parab
v2:=B[8]+B[119]; #E_6.2
v3:=B[113]+B[114]; #B_5T_1.k^1+32
v4:=B[104]+B[105]+B[106]; # F4T_1.k^26

#ElementaryDivisorsMat(List(Be7,i->Coefficients(B,v1*i)));

#The E6 and subalgebra of E7

e6s:=Subalgebra(h,[Bh[1],Bh[2],Bh[3],Bh[4],Bh[5],Bh[6],Bh[64],Bh[65],Bh[66],Bh[67],Bh[68],Bh[69]]);
Be6:=Basis(e6s);

#Representatives for v in V27

w1:=Bh[7]; #D5 parab
w2:=Bh[7]+Bh[63]; #B_4T_1.k^16
w3:=Bh[47]+Bh[49]+Bh[48]; #F4

#Representatives for v in V26

#u1:=Bh[7]+B[48]; #B_4
#u2:=Bh[7]; #B_3T_1.k^14
#u3:=Bh[7]+Bh[62]; #G_2T_1k^14
#u4:=Bh[13]+Bh[49]+Bh[62]; #Doesn't work

u1:=[ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
u2:=[ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
u3:=[ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0 ];
u4:=[ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0 ];
u5:=[ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ];

#stuff for doing D4 calc
#R:=PolynomialRing(Rationals,1);
#fmatsq:=NullMat(26,26,R)+fmatsq;
#v:=NullMat(1,26,R)[1];
#v[13]:=1;
#v[14]:=x[1];
#vres:=List(fmatsq,i->v*i);


#ElementaryDivisorsMat(List(fmatsq,i->v*i));

#h2:=SimpleLieAlgebra("E",7,GF(2));
#Bh2:=Basis(h2);
#f4s2:=Subalgebra(h2,[Bh2[1]+Bh2[6],Bh2[2],Bh2[3]+Bh2[5],Bh2[4],Bh2[64]+Bh2[69],Bh2[65],Bh2[66]+Bh2[68],Bh2[67],Bh2[127]+Bh2[133],Bh]);
#Bf2:=Basis(f4s2);


#CONVERTS A GAP EXPRESSION INTO A LATEX EXPRESSION

  perm := PermutationMat((1,2,4),4); #perm takes Bourbaki coeffs to Gap coeffs

GAPEltToLatex:=function(B,e,TYPE,rootcoeffs)
local c,str,i,j,rc,zero,k,rk,d;
c:=Coefficients(B,e);

rk:=EvalString([TYPE[2]]);
d:=Dimension(SimpleLieAlgebra([TYPE[1]],rk,Rationals));

zero:=Coefficients(B,0*B[1])[1];

str:="$";

for i in [1..(d-rk)] do

	if c[i]<>zero then

	if c[i]=zero+1 then 
		j:="";
	else
		j:=Concatenation(String(c[i]),"\\cdot ");
	fi;

Append(str,j);

Append(str,"e_{\\Small\\\begin{array}{c c c c c c c c}");

if i > ((d-rk)/2) then 
	rc:=-rootcoeffs[i];
	Append(str,"-");
else
	rc:=rootcoeffs[i];
fi;

if TYPE="G2" then

for j in rc do
Append(str,Concatenation(String(j),"&"));
od;
Remove(str);

elif TYPE="F4" then
rc:=perm*rc;


for j in rc do
Append(str,Concatenation(String(j),"&"));
od;
Remove(str);

else

for j in [1..Length(rc)] do
if j<>2 then
Append(str, Concatenation(String(rc[j]),"&"));
fi;
od;

Remove(str);
Append(str, Concatenation("\\\\&&",String(rc[2])));

fi;
Append(str,"\\end{array}}+\n");
fi;

od;

for i in [(d-rk+1)..d] do

	if TYPE="F4" then
		k:=(i-(d)+rk)^(1,4,2);
	else;
		k:=i-(d)+rk;
	fi;

	if c[i]<>zero then

	if c[i]=zero+1 then 
		j:="";
	else
		j:=Concatenation(String(c[i]),"\\cdot ");
	fi;

Append(str,j);

Append(str,"h_{\\alpha_");
Append(str,String(k));
Append(str,"}+\n");

fi;
od;

Remove(str);Remove(str);


Append(str,"$");


return str;
end;;
