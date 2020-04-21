function [direction] = getValidDirection(my_scene)
%Given my_scene, loops runs until either down arrow or right arrow is
%pressed

valid = false;
while ~valid
    direction = getKeyboardInput(my_scene);
    %If direction pressed is down or right arrow, loop terminates and the
    %direction is returned
    if isequal(direction, 'downarrow') || isequal(direction, 'rightarrow')
        valid = true;
    else
        fprintf('Direction must be down or right!\n\n');
    end
end

end

