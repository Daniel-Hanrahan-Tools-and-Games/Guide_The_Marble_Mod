local ModWallCollision = {
	extends = Area2D,
}

function ModWallCollision:_ready()
	-- Correctly connect body_entered to the Collision method
	self:connect("body_entered", function(body) self:Collision(body) end)
end

-- collision code
function ModWallCollision:Collision(body)
	if body:get_name() == "ModPlayer" then
		-- loads main menu
		local ResourceLoader = Engine:get_singleton("ResourceLoader")
		local scene_resource = ResourceLoader:load("res://MainMenu.tscn")
		if scene_resource then
			local scene = scene_resource:instantiate()
			local root = self:get_tree():get_root()
			root:add_child(scene)

			local current = self:get_tree().current_scene
			if current then current:queue_free() end
		else
			print("Error: Failed to load scene!")
		end
	end
end



return ModWallCollision
