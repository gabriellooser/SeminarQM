%
% gatter.mp
%
% (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
%
verbatimtex
\documentclass{book}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{txfonts}
\begin{document}
etex;

numeric unit;
unit := 10;
numeric linewidth;
linewidth := 0.7pt;

def negation(expr position) =
	pickup pencircle scaled linewidth;
	path p;
	p := ((0,0)..(unit/4,-unit/4)..(unit/2,0)..(unit/4,unit/4)
		..cycle) shifted position;
	fill p withcolor (1,1,1);
	draw p;
enddef;

def xorline(expr position) =
	path p;
	p = (((0,1.5 * unit){dir 0}..(0.9 * unit,0)..{dir 180}(0,-1.5 * unit))
		shifted (-unit/2,0)) shifted position;
	draw p;
enddef;

def orgate(expr position) =
	pickup pencircle scaled linewidth;
	draw ((-unit,unit)--(unit,unit)) shifted position;
	draw ((-unit,-unit)--(unit,-unit)) shifted position;
	path p;
	p = ((0,-1.5 * unit){dir 0}..{dir 60}(3.25 * unit,0){dir 120}
		..{dir 180}(0,1.5 * unit){dir 0}..(0.9 * unit,0)
		..{dir 180}(0,-1.5 * unit)..cycle) shifted position;
	fill p withcolor(1,1,1);
	draw ((3.25 * unit,0)--(4.25 * unit,0)) shifted position;
	draw p;
enddef;

def xorgate(expr position) =
	orgate(position);
	xorline(position);
enddef;

def norgate(expr position) =
	orgate(position);
	negation((3.25 * unit,0) shifted position);
enddef;

def xnorgate(expr position) =
	xorgate(position);
	negation((3.25 * unit,0) shifted position);
enddef;

def andgate(expr position) =
	pickup pencircle scaled linewidth;
	draw ((0,unit)--(unit,unit)) shifted position;
	draw ((0,-unit)--(unit,-unit)) shifted position;
	path p;
	p = ((unit,-1.5 * unit)
		--(1.75 * unit,-1.5 * unit){dir 0}
		..{dir 90}(3.25 * unit,0){dir 90}
		..{dir 180}(1.75 * unit, 1.5*unit)
		--(unit,1.5 * unit)--cycle) shifted position;
	draw ((3.25 * unit,0)--(4.25 * unit,0)) shifted position;
	draw p;
enddef;

def nandgate(expr position) =
	andgate(position);
	negation((3.25 * unit,0) shifted position);
enddef;

beginfig(1)
andgate((0,0));
endfig;

beginfig(2)
orgate((0,0));
endfig;

beginfig(3)
nandgate((0,0));
endfig;

beginfig(4)
norgate((0,0));
endfig;

beginfig(5)
xorgate((0,0));
endfig;

beginfig(6)
xnorgate((0,0));
endfig;

beginfig(7)
xorgate((0,unit));
xorgate((10.5 * unit,0));
draw (4.25 * unit,unit)--(9.5 * unit,unit);
andgate((0, -4 * unit));
draw (4.25 * unit,-4 * unit)--(7 * unit,-4 * unit);
draw (9.5 * unit,-1 * unit)--(7 * unit,-1 * unit)--(7 * unit,-7 * unit)
	--(9.5 * unit,-7 * unit);
andgate((0,-8 * unit));
andgate((0,-12 * unit));
orgate((5.25 * unit,-9 * unit));
orgate((10.5 * unit,-8 * unit));
draw (4.25 * unit,-12 * unit)--(4.25 * unit,-10 * unit);
label.rt(btex $\Sigma$ etex, (14.75 * unit,0));
label.rt(btex $C_{\text{out}}$ etex, (14.75 * unit,-8 * unit));
draw (-7 * unit,2 * unit)--(-unit,2 * unit);
draw (-7 * unit,0)--(-unit,0);
draw (-7 * unit,-2 * unit)--(-5 * unit, -2 * unit)--(-5 * unit, -1 * unit)
	--(7 * unit, -1 * unit);
draw (-5 * unit, -2 * unit)--(-5 * unit, -13 * unit)
	--(0 * unit, -13 * unit);
draw (-5 * unit, -9 * unit)--(0, -9 * unit);
draw (-3.5 * unit, 0)--(-3.5 * unit, -11 * unit)--(0, -11 * unit);
draw (-2 * unit, 2 * unit)--(-2 * unit, -3 * unit)--(0, -3 * unit);
draw (-2 * unit, -3 * unit)--(-2 * unit, -7 * unit)--(0, -7 * unit);
draw (-3.5 * unit, -5 * unit)--(0, -5 * unit);
pickup pencircle scaled 3pt;
draw (7 * unit, -1 * unit);
draw (7 * unit, -4 * unit);
draw (-5 * unit, -2 * unit);
draw (-5 * unit, -9 * unit);
draw (-3.5 * unit, 0);
draw (-3.5 * unit, -5 * unit);
draw (-2 * unit, 2 * unit);
draw (-2 * unit, -3 * unit);
label.lft(btex $A$ etex, (-7 * unit, 2 * unit));
label.lft(btex $B$ etex, (-7 * unit, 0 * unit));
label.lft(btex $C_\text{in}$ etex, (-7 * unit, -2 * unit));
endfig;

beginfig(8)
xorgate((0,0));
andgate((0,-4 * unit));
label.rt(btex $\Sigma$ etex, (4.25 * unit,0));
label.rt(btex $C_{\text{out}}$ etex, (4.25 * unit,-4 * unit));
draw (-4 * unit, unit)--(-1 * unit, unit);
draw (-4 * unit, -5 * unit)--(0, -5 * unit);
draw (-3 * unit, unit)--(-3 * unit, -3 * unit)--(0, -3 * unit);
draw (-1.5 * unit, -5 * unit)--(-1.5 * unit, -1 * unit)--(-1 * unit, -1 * unit);
pickup pencircle scaled 3pt;
draw (-3 * unit, unit);
draw (-1.5 * unit, -5 * unit);
label.lft(btex $A$ etex, (-4 * unit, unit));
label.lft(btex $B$ etex, (-4 * unit, -5 * unit));
endfig;

beginfig(9)
pickup pencircle scaled linewidth;
draw (-20,-15)--(20,-15)--(20,15)--(-20,15)--cycle;
draw (60,0)--(20,0);
label.rt(btex $|\psi\rangle$ etex, (60,0));
draw (-20,0)--(-40,0){dir 180}..{dir 180}(-60,10)--(-80,10);
draw (-20,0)--(-40,0){dir 180}..{dir 180}(-60,-10)--(-80,-10);
label.lft(btex $Y$ etex, (-80,10));
label.lft(btex $N$ etex, (-80,-10));
label(btex $Q$ etex, (0,0));
endfig;

end