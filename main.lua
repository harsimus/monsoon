function _init()
	cls()
    player_position_x = 64
	player_position_y = 64
    player_speed_x = 0
    player_speed_y = 0
    projectile_position_x = 64
    projectile_position_y = 40
    projectile_speed = 3
    normalize = 0.7
end

function _update()
    -- Player Character Controls - Movement
    player_speed_x = 0
    player_speed_y = 0
    if (btn(0)) then player_speed_x = -2 end
    if (btn(1)) then player_speed_x = 2 end
    if (btn(2)) then player_speed_y = -2 end
    if (btn(3)) then player_speed_y = 2 end
    player_position_x = player_position_x + player_speed_x
    player_position_y = player_position_y + player_speed_y
    
    -- Player Character Controls - Shooting
    -- if (btn(4)) then player_position_x = player_position_x - 1 end
    projectile_position_y = projectile_position_y - projectile_speed
    if (btnp(5)) then 
        projectile_position_x = player_position_x
        projectile_position_y = player_position_y - 3
        sfx(0)
    end
    projectile_position_y = projectile_position_y - projectile_speed
    
    -- Out Of Bounds (OOB) Prevention
    if player_position_x < 0 then player_position_x = 0 end
    if player_position_x > 120 then player_position_x = 120 end 
    if player_position_y < 0 then player_position_y = 0 end
    if player_position_y > 120 then player_position_y = 120 end
end

function _draw()
	cls()
	spr(1,player_position_x,player_position_y)
    spr(3, projectile_position_x, projectile_position_y)
end