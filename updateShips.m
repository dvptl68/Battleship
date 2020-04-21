function [board_display, player_location] = updateShips(board_display, player_location, r, c, i, length, direction)
%Given board_display, locations, r, c, i, length of ship, and direction, this function updates the two matrices to add the ships 

%Loops runs until the length of the ship is reached
for j = 0:(length-1)
    if isequal(direction, 'downarrow')
        %Location and display matrices are updated to reflect the position
        %of the ships based on the direction
        player_location(r + j, c) = i;
        if j == 0
            board_display(r + j, c) = 6; %Top ship sprite
        elseif j == (length-1)
            board_display(r + j, c) = 8; %Vertical ship sprite
        else
            board_display(r + j, c) = 7; %Bottom ship sprite
        end
    else
        player_location(r, c + j) = i;
        if j == 0
            board_display(r, c + j) = 3; %Left ship sprite
        elseif j == (length-1)
            board_display(r, c + j) = 5; %Horizontal ship sprite
        else
            board_display(r, c + j) = 4; %Right ship sprite
        end
    end
end

end

