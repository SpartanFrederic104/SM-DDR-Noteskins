return Def.Sprite {
	Texture=NOTESKIN:GetPath('_Down','Hold Explosion');
	Frames = Sprite.LinearFrames( 4, 0.1 );
	--[[InitCommand=cmd(effectclock,'beat';);--]]
	DrawTapNoteMessageCommand=function(self,parent)
		parent:spin();
	end;
};
