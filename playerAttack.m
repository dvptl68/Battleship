function [ai_location, board_display, player_hits] = playerAttack(ai_location, board_display, my_scene, player_hits)
%Given the AI ship locations, the function updates ai_location and display
%based on the player's attack, and increment the player's hits if needed

[r, c] = getMouseInput(my_scene);
%First checks to see if click is a valid attack, then updates board_display
%accordingly
if c > 11 %Attack is in valid territory
    if ai_location(r,c - 11) ~= -1 && ai_location(r,c - 11) ~= -2
        if ai_location(r,c - 11) == 0
            ai_location(r,c - 11) = -2;
            board_display(r,c) = 10;
        else
            ai_location(r,c - 11) = -1;
            board_display(r,c) = 9;
            player_hits = player_hits + 1;
        end
    else
        fprintf('Why would you attack the same spot twice?\n\n');
    end
elseif c < 11 %Attack is on own board
    fprintf('Why would you attack yourself?\n\n');
else %Attack is on middle black line
    fprintf('What are you even trying to attack?\n\n');
end

end