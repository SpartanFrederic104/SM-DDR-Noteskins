local ret = ... or {}

local OldRedir = ret.Redir;
ret.Redir = function(sButton, sElement, sPlayer)
	-- To redirect files for Up to Down:
	-- if sButton == "Up" then sButton = "Down"; end

	if not (sElement == "Hold Body Active") and
	   not (sElement == "Hold Body Inactive") and
	   not (sElement == "Hold Bottomcap Active") and
	   not (sElement == "Hold Bottomcap Inactive")  and
	   not (sElement == "Hold Head Active") and
	   not (sElement == "Hold Head Inactive") and
	   not (sElement == "Roll Head Active") and
	   not (sElement == "Roll Head Inactive") and
	   not (sElement == "Roll Body Active") and
	   not (sElement == "Roll Body Inactive") and
	   not (sElement == "Roll Bottomcap Active") and
	   not (sElement == "Roll Bottomcap Inactive") and
	   not (sElement == "Tap Mine") and  
	   not (sElement == "Tap Fake") and 
	   not (sElement == "Receptor") 
	then
		if sButton == "Up" or
		   sButton == "Left" or
		   sButton == "Right"
		then
		   sButton = "Down"; 
		end 
		if sButton == "UpRight"
		then
		   sButton = "UpLeft"
		end
	end

	if GAMESTATE:PlayerIsUsingModifier( sPlayer, "reverse" ) then
		if (sElement == "Hold Body Active") or
		  (sElement == "Hold Body Inactive") or
		  (sElement == "Hold Bottomcap Active") or
		  (sElement == "Hold Bottomcap Inactive")  or
		  (sElement == "Roll Body Active") or
		  (sElement == "Roll Body Inactive") or
		  (sElement == "Roll Bottomcap Active") or
		  (sElement == "Roll Bottomcap Inactive")
		then
			if sButton == "Up" then
				sButton = "Down"
			elseif sButton == "Down" then
				sButton = "Up"
			end
		end
	end
	
	return sButton, sElement;
end

ret.Rotate =
{
	Up = 180,
	Down = 0,
	Left = 90,
	Right = -90,
	UpLeft = 0,
	UpRight = 90,
};

ret.RedirTable =
{
	Up = "Down",
	Down = "Down",
	Left = "Down",
	Right = "Down",
	UpLeft = "UpLeft",
	UpRight = "UpLeft",
};

ret.PartsToRotate =
{
	["Go Receptor"] = true,
	["Ready Receptor"] = true,
	["Tap Note"] = true,
	["Tap Mine"] = false,
	["Tap Lift"] = true,
	["Tap fake"] = true,
	["Explosion"] = true,
};

ret.Blank =
{
	["Tap Lift"] = true,
	["Hold Topcap Active"] = true,
	["Hold Topcap Inactive"] = true,
	["Roll Topcap Active"] = true,
	["Roll Topcap Inactive"] = true,
	["Hold Tail Active"] = true,
	["Hold Tail Inactive"] = true,
	["Roll Tail Active"] = true,
	["Roll Tail Inactive"] = true,
	["Tap Fake"] = false,
};

local function func()
	local sButton = Var "Button";
	local sElement = Var "Element";
	local sPlayer = Var "Player";
	
	if ret.Blank[sElement] then
		-- Return a blank element.  If SpriteOnly is set,
		-- we need to return a sprite; otherwise just return
		-- a dummy actor.
		local t;
		if Var "SpriteOnly" then
			t = LoadActor( "_blank" );
		else
			t = Def.Actor {};
		end
		return t .. {
			cmd(visible,false);
		};
	end

	local sButtonToLoad, sElementToLoad = ret.Redir(sButton, sElement, sPlayer);
	assert( sButtonToLoad );
	assert( sElementToLoad );

	local sPath = NOTESKIN:GetPath( sButtonToLoad, sElementToLoad );

	local t = LoadActor( sPath );

	if ret.PartsToRotate[sElement] then
		t.BaseRotationZ = ret.Rotate[sButton];
	end

	return t;
end

-- This is the only required function.
ret.Load = func;

-- Use this to override the game types' default Load() functions.
ret.CommonLoad = func;

return ret;
