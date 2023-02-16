function _init()
	cls()
    player_position_x = 64
	player_position_y = 64
    player_speed_x = 0
    player_speed_y = 0
    player_sprite = 2
    exhaust_sprite = 5
    projectile_position_x = 64
    projectile_position_y = -10
    projectile_speed = 3
    muzzle = 0
    normalize = 0.7
end

function _update()
    -- Reset To Default State
    player_speed_x = 0
    player_speed_y = 0
    player_sprite = 2

    -- Player Character Controls - Movement
    if (btn(0)) then 
        player_speed_x = -2 
        player_sprite = 1
    end
    if (btn(1)) then 
        player_speed_x = 2 
        player_sprite = 3
    end
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
        muzzle = 5
    end
    
    projectile_position_y = projectile_position_y - projectile_speed
    
    -- Exhaust Animation
    exhaust_sprite = exhaust_sprite + 1
    if (exhaust_sprite > 9) then exhaust_sprite = 5 end

    -- Muzzle Flash Animation
    if (muzzle > 0) then
        muzzle = muzzle - 1
    end

    -- Out Of Bounds (OOB) Prevention
    if player_position_x < 0 then player_position_x = 0 end
    if player_position_x > 120 then player_position_x = 120 end 
    if player_position_y < 0 then player_position_y = 0 end
    if player_position_y > 120 then player_position_y = 120 end
end

function _draw()
	cls()
    -- Player Sprite
	spr(player_sprite,player_position_x,player_position_y)
    -- Exhaust Sprite
    spr(exhaust_sprite,player_position_x,player_position_y+8)
    -- Projectile Sprite
    spr(16, projectile_position_x, projectile_position_y-5)
    -- Muzzle Flare
    if (muzzle) > 0 then
        circfill(player_position_x+3, player_position_y-2, muzzle, 7)
    end
end