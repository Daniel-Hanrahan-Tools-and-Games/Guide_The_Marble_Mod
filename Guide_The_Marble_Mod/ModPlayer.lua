local ModPlayer = {
	extends = CharacterBody2D,
	
	-- Physics variables
	dblSpeed = 200,
	dblGravity = 500,
	
	-- Runtime state
	velocity = Vector2.ZERO,
}

function ModPlayer:_ready()
	-- Initialization logic here if needed
end

function ModPlayer:_physics_process(delta)
	-- initializes animation
	local sprite = self:get_node("AnimatedSprite2D")

	-- Gravity
	self.velocity = Vector2(self.velocity.x, self.velocity.y + self.dblGravity * delta)

	-- Horizontal Movement
	if Input:is_action_pressed("Right") then
		self.velocity = Vector2(self.dblSpeed, self.velocity.y)
	elseif Input:is_action_pressed("Left") then
		self.velocity = Vector2(-self.dblSpeed, self.velocity.y)
	end

	-- Move player
	self:move_and_slide()
	
end

return ModPlayer
