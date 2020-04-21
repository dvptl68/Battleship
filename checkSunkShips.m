function [numSunk] = checkSunkShips(locations)
%Checks how many ships have been sunk

oneSunk = true;
twoSunk = true;
threeSunk = true;
fourSunk = true;
fiveSunk = true;

%Iterates through all locatiosn and sets value of sunk to false if
%locations has any ship values in it
for r = 1:10
    for c = 1:10
        if locations(r, c) == 1
            oneSunk = false;
        elseif locations(r, c) == 2
            twoSunk = false;
        elseif locations(r, c) == 3
            threeSunk = false;
        elseif locations(r, c) == 4
            fourSunk = false;
        elseif locations(r, c) == 5
            fiveSunk = false;
        end
    end
end

numSunk = oneSunk + twoSunk + threeSunk + fourSunk + fiveSunk;

end

