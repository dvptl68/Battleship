function [player_location, board_display, ai_hits] = aiRandomAttack(player_location, board_display, ai_hits)
% Performs a random AI attack

%Generates a random r and c value
r = 1;
c = 1;
while player_location(r,c) == -1 || player_location(r,c) == -2
    r = randperm(10,1);
    c = randperm(10,1);
end


%Changes board_display and number of ai hits if necessary
if player_location(r,c) == 0
    player_location(r,c) = -2;
    board_display(r,c) = 10;
else
    player_location(r,c) = -1;
    board_display(r,c) = 9;
    ai_hits = ai_hits + 1;
end

end
