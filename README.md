# UnitfulCorrelations

[![Build Status](https://github.com/aefarrell/UnitfulCorrelations.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/aefarrell/UnitfulCorrelations.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/aefarrell/UnitfulCorrelations.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/aefarrell/UnitfulCorrelations.jl)


A simple macro for working with empirical correlations and `Unitful`.

## Installation

UnitfulCorrelationsjl can be installed using Julia's built-in package manager. 
In a Julia session, enter the package manager mode by hitting `]`, then run the
command

```julia
pkg> add https://github.com/aefarrell/UnitfulCorrelations.jl
```


## Examples
Suppose you have an empirical correlation $ f(x) = 0.92 x^{0.2} $, where it is 
given that $x$ is in meters and $f$ is in seconds. You could figure out the 
units that the constants must have to make everything work out, or write a
function that uses `ustrip()` to manage units, but that can get tedious if there
are a lot of these. 

The macro `@ucorrel` does this for you, adding another method for the case
where the function is called with units. The arguments are: function (or 
function block), input units, output units.

```julia

f(x) = 0.92*x^0.2
@ucorrel f u"m" u"s"

# f(2) == 1.0568024865972723
# f(2 u"m") == 1.0568024865972723 u"s"
```

this can also be done with a function block

```julia

@ucorrel function f(x)
    return 0.92*x^0.2
end u"m" u"s"

# f(2) == 1.0568024865972723
# f(2 u"m") == 1.0568024865972723 u"s"
```

So far it only supports one dimensional correlations, because I have basically
just copied over a macro that I use frequently and have not added anything to
its funtionality.