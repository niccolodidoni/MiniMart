# SETS
param n; 
set HOUSES := 1..n; 
set MANY_HOUSES within {HOUSES,HOUSES} default {HOUSES,HOUSES};

# PARAMETERS
param range; 
param Cx{HOUSES}; 
param Cy{HOUSES}; 
param Dc{HOUSES}; 
param usable{HOUSES}; 
param distance{(i,j) in MANY_HOUSES} := sqrt( (Cx[i] - Cx[j])**2 + (Cy[i] - Cy[j])**2 );

# (i,j) in range if house i is in range of house j
set RANGE := setof{i in HOUSES, j in HOUSES: distance[i,j] <= range} (i,j);

# VARIABLES
var x{HOUSES}, binary; # if a market is build at i
var y{(i,j) in MANY_HOUSES}, binary; # if i is in range of j
var z{(i,j) in MANY_HOUSES}, binary; # if i is in range of market j


# OBJECTIVE FUNCTION
minimize obj: 
	sum {house in HOUSES} (Dc[house] * x[house]); 

# CONSTRAINTS
s.t. is_market{(house,market) in MANY_HOUSES}: 
	x[market] >= z[house,market]; 
	
s.t. is_range{(house,market) in MANY_HOUSES}: 
	y[house,market] >= z[house,market]; 

s.t. at_least{house in HOUSES}: 
	sum {market in HOUSES} z[house,market] >= 1; 
	
s.t. market_place{house in HOUSES}: 
	x[house] <= usable[house]; 
	
s.t. in_range{(i,j) in MANY_HOUSES}: 
	( y[i,j] * distance[i, j] ) - ( range * y[i,j] ) <= 0; 