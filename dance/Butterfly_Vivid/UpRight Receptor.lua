return Def.ActorFrame {
	LoadActor( "_Tap Receptor", NOTESKIN:LoadActor("", "Receptor Ready2") ) .. {
		Frames = {};
		InitCommand=cmd(baserotationz,180;playcommand, "Set");
		GameplayLeadInChangedMessageCommand=cmd(playcommand,"Set");
		SetCommand=cmd(visible,GAMESTATE:GetGameplayLeadIn());
	};

	LoadActor( "_Tap Receptor", NOTESKIN:LoadActor("", "Receptor Go2") ) .. {
		Frames = {
			{ Frame = 0; Delay = 0.1; };
			{ Frame = 1; Delay = 0.8; };
			{ Frame = 0; Delay = 0.1; };
		};
	
		InitCommand=cmd(baserotationz,180;playcommand, "Set";effectclock,'beat';);
		GameplayLeadInChangedMessageCommand=cmd(playcommand,"Set");
		SetCommand=cmd(visible,not GAMESTATE:GetGameplayLeadIn());
	};
}
