# MiniMart
This AMPL project has been issued as part of the Foundation of Operation Research course (a.y. 2021) at Politecnico di Milano. 

## Problem description
A company is planning on installing a series of unstaffed mini-markets in a rural area. This way, citizens that live far from conventional stores may buy their groceries without needing the car. Specifically, the company wants to serve a set of n houses whose coordinates in kilometers are described by parameters `Cx` and `Cy`. Some, but not all of the houses, gave permission to the company to build a mini-marked on their property in exchange for a small compensation. Whether or not it is possible to build a mini-market at house `i` is described by parameter `usable[i]`. All considered, the cost of building a mini-market at house `i` is `Dc[i]`. The company wants to plan the construction of mini-markets so that each house is at most range kilometers away (euclidean distance) from a mini-market and, the total construction cost is minimized.
Formulate the problem through a MILP formulation and implement it in the AMPL modeling language.
