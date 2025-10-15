local ModBumper = {
	extends = "StaticBody2D",
	
	bounce_strength = 800.0, 
}

function ModBumper:_ready()
	self:connect("body_entered", self, "_on_body_entered")
end

function ModBumper:_on_body_entered(body)
	if body:is_class("RigidBody2D") then
		local direction = (body.global_position - self.global_position):normalized()
		body:apply_impulse(direction * bounce_strength)
	end
end

return ModBumper
