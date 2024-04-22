### nilpotent_orbits_GAP
GAP functions to work with nilpotent orbits for exceptional type simple Lie algebras in all characteristics, including Jordan block calculations.

## Introduction

Let $\mathfrak{g}$ be the Lie algebra of a simply connected simple algebraic group over a field $k$ and let $B$ be a Chevalley basis for $\mathfrak{g}$. 
One can compute with these objects in GAP; for example, the following constructs $\mathfrak{sl}_5(\mathbb{Q})$.
```
gap> g:=SimpleLieAlgebra("A",4,Rationals);
<Lie algebra of dimension 24 over Rationals>
gap> B:=Basis(g);
CanonicalBasis( <Lie algebra of dimension 24 over Rationals> )
```
If $\Phi^+$ is a system of postive roots then the Chevalley basis `B` is ordered so that its first $|\Phi^+|$ elements are corresponding positive root elements; 
its next $|\Phi^+|=|\Phi^-|$ are corresponding negative root elements; and the remaining $\mathrm{rk}(\mathfrak g)$ span a Cartan subalgebra.

## nilporbs.g (Representatives etc.)

If $k$ is algebraically closed, there are finitely many orbits of $G$ on the nilpotent elements of $\mathfrak g$ and they have been classified. 
This is complicated when $\mathfrak{g}$ is exceptional and depends heavily on the characteristic of $k$.

On loading

[nilporbs.g](nilporbs.g) 

one can access representatives these orbits expressed in terms of `B'.

# Liebeck--Seitz orbit representatives 

 For example:

```
gap> Read("nilporbits.g");
gap> g:=SimpleLieAlgebra("E",8,Rationals);
<Lie algebra of dimension 248 over Rationals>
gap> B:=Basis(g);
CanonicalBasis( <Lie algebra of dimension 248 over Rationals> )
gap> O:=OrbitsE8_0(B);
[ v.1+v.2+v.3+v.4+v.5+v.6+v.7+v.8, v.1+v.2+v.5+v.6+v.7+v.8+v.10+v.11,
...
  v.1+v.4+v.6, v.1+v.4, v.1 ]
gap> Length(O);
69
gap> OL:=OrbitLabelsE8_0;
[ "E_{8}", "E_{8}(a_{1})", "E_{8}(a_{2})", "E_{8}(a_{3})", "E_{8}(a_{4})",
...
  "A_{2}", "3A_{1}", "2A_{1}", "A_{1}" ]
gap> Length(OL);
69
```

Bear in mind you need to use the appropriate function from the following list, matching your characteristic.

OrbitsE6

OrbitsE7_0

OrbitsE7_2

OrbitsE8_0

OrbitsE8_2

OrbitsE8_3

OrbitsF4_0

OrbitsF4_2 

OrbitsG2_0 

OrbitsG2_2 

OrbitsG2_3 

# Lawther--Testerman representatives 

Taken from their Centers of Centralisers Memoir of the AMS. Usable in good characteristic and they come with the associated cocharacters as well.

# Vigre orbits

Taken from a Vigre paper. These do not work except possibly in good characteristic.

# Group centraliser dimensions

It is often useful to know $\mathrm{dim}_k C_G(e)$ for $e$ a nilpotent element. These are recorded as lists of the form `GrpCentG2_0'.

# Standard sl2 triples

The Jacobson--Morozov theorem implies that each $e$ can be extended to a subalgebra $\langle e,h,f\rangle\cong \mathfrak{sl}_2$. (Except one orbit in $G_2$ in characteristic 3.) The `SL2TriplesE8' function, for example, will match each orbit up with some obvious choices of $h$ and $f$. These will work in good characteristic.

# Induction data

There is also some induction data recorded from the Elashvili--de Graaf paper.

## Jordan Blocks gap
