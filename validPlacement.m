function [validShip] = validPlacement(r, c, length, direction, player_location)
%Given the row/column clicked on, the length of the ship being placed, and
%the direction of the ship placement, returns whether the ship can be 
%placed at that location or not

%Checks to see if the ship will fit on the grid without going out of the
%borders
%The r/c position of the click must be at 11-length for it to fit
if isequal(direction, 'downarrow')
    if r <= (11-length)
        validShip = true;
    else
        validShip = false;
        fprintf('Ship is too long to fit here!\n\n');
    end
else
    if c <= (11-length)
        validShip = true;
    else
        validShip = false;
        fprintf('Ship is too long to fit here!\n\n');
    end
end

%Checks to see if the ship will overlap any existing ships
if validShip
    for i = 0:(length-1)
        if isequal(direction, 'downarrow')
            if player_location(r + i, c) ~= 0
                validShip = false;
                fprintf('Ship will overlap another ship!\n\n');
                break;
            end
        else
            if player_location(r, c + i) ~= 0
                validShip = false;
                fprintf('Ship will overlap another ship!\n\n');
                break;
            end
        end
    end
end

end