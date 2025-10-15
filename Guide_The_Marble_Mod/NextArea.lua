local NextArea = {
	extends = Area2D,
}

function NextArea:_ready()
	-- Correctly connect body_entered to the Collision method
	self:connect("body_entered", function(body) self:Collision(body) end)
end

function NextArea:_physics_process(delta)
end

-- collision code
function NextArea:Collision(body)
	if body:get_name() == "ModPlayer" then
		local intResult = math.random(1, 3);
		if intResult == 1 then
			-- loads mod room 1
			local ResourceLoader = Engine:get_singleton("ResourceLoader")
			local scene_resource = ResourceLoader:load("res://Guide_The_Marble_Mod/ModRoom1.tscn")
			if scene_resource then
				local scene = scene_resource:instantiate()
				local root = self:get_tree():get_root()
				root:add_child(scene)

				local current = self:get_tree().current_scene
				if current then current:queue_free() end
			else
				print("Error: Failed to load scene!")
			end
		elseif intResult == 2 then
			-- loads mod room 2
			local ResourceLoader = Engine:get_singleton("ResourceLoader")
			local scene_resource = ResourceLoader:load("res://Guide_The_Marble_Mod/ModRoom2.tscn")
			if scene_resource then
				local scene = scene_resource:instantiate()
				local root = self:get_tree():get_root()
				root:add_child(scene)

				local current = self:get_tree().current_scene
				if current then current:queue_free() end
			else
				print("Error: Failed to load scene!")
			end
		elseif intResult == 3 then
			-- loads mod room 3
			local ResourceLoader = Engine:get_singleton("ResourceLoader")
			local scene_resource = ResourceLoader:load("res://Guide_The_Marble_Mod/ModRoom3.tscn")
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
end

return NextArea
