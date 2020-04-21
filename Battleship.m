clc
clear
warning('off','all');

% Initialize scene
my_scene = simpleGameEngine('Battleship.png',84,84);
% Set up variables to name the various sprites
blank_sprite = 1;
water_sprite = 2;
left_ship_sprite = 3;
horiz_ship_sprite = 4;
right_ship_sprite = 5;
top_ship_sprite = 6;
vert_ship_sprite = 7;
bot_ship_sprite = 8;
hit_sprite = 9;
miss_sprite = 10;

% Display empty board
board_display = water_sprite * ones(10,21);
board_display(:,11) = blank_sprite;
drawScene(my_scene,board_display)

% Create location vector
player_location = zeros(10);

%Loop runs five times to place all five ships
fprintf('Place your ships!\n\n');
for i = 1:5
    if i == 1
        fprintf('Ship length: 2\n\n');
    elseif i == 2 || i == 3
        fprintf('Ship length: 3\n\n');
    elseif i == 4
        fprintf('Ship length: 4\n\n');
    else
        fprintf('Ship length: 5\n\n');
    end
    %Loop runs until valid ship placement is found
    validShip = false;
    while ~validShip
        [r, c] = getMouseInput(my_scene);
        %If a valid empty grid location is clicked, direction is chosen next
        if c < 11 && player_location(r,c) == 0
            direction = getValidDirection(my_scene);
            %Ships are placed from shortest to longest, first checking to
            %see if the location/direction is valid and then placing them
            if i == 1 %length of ship is 2
                validShip = validPlacement(r, c, 2, direction, player_location);
                if validShip
                    [board_display, player_location] = updateShips(board_display, player_location, r, c, i, 2, direction);
                end
            elseif i == 2 || i == 3 %length of ship is three
                validShip = validPlacement(r, c, 3, direction, player_location);
                if validShip
                    [board_display, player_location] = updateShips(board_display, player_location, r, c, i, 3, direction);
                end
            elseif i == 4 %length of ship is four
                validShip = validPlacement(r, c, 4, direction, player_location);
                if validShip
                    [board_display, player_location] = updateShips(board_display, player_location, r, c, i, 4, direction);
                end
            else %length of ship is five
                validShip = validPlacement(r, c, 5, direction, player_location);
                if validShip
                    [board_display, player_location] = updateShips(board_display, player_location, r, c, i, 5, direction);
                end
            end
        else
            fprintf('Select a valid ship placement spot!\n\n');
        end
    end
    drawScene(my_scene,board_display)
end

%Set up the AI ships
ai_location = Setup();
player_hits = 0;
ai_hits = 0;

%Attacking starts
hitsToWin = 17;
fprintf('Start attacking the other side!\n\n');
while player_hits < hitsToWin && ai_hits < hitsToWin
    %Player attacks first
    [ai_location, board_display, player_hits] = playerAttack(ai_location, board_display, my_scene, player_hits);
    drawScene(my_scene,board_display)
    
    %Can comment this line out for a quick game
    pause(0.5); %Pause for half a second to make the game more enjoyable
    
    %AI attacks after player and only attacks if player has not won
    if ~(player_hits == hitsToWin)
        [player_location, board_display, ai_hits] = aiRandomAttack(player_location, board_display, ai_hits);
        drawScene(my_scene,board_display)
    end
end

%Prints which player won
if player_hits > ai_hits
    fprintf('You won!\n');
else
    fprintf('You lost!\n');
end

%Checks the number of ships sunk by AI and player
playerNumSunk = checkSunkShips(ai_location);
aiNumSunk = checkSunkShips(player_location);
fprintf('You sank %i ship', playerNumSunk);
if playerNumSunk == 1
    fprintf('!\n');
else
    fprintf('s!\n');
end
fprintf('AI sank %i ship', aiNumSunk);
if aiNumSunk == 1
    fprintf('!\n');
else
    fprintf('s!\n');
end