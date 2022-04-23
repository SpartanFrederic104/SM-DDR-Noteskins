return Def.Sprite {
	Texture=NOTESKIN:GetPath('_down','hold active');
	Frames = Sprite.LinearFrames( 1, 1 );
	InitCommand=cmd(effectclock,'beat';);
	DrawTapNoteMessageCommand=function(self,parent)
		parent:spin();
	end;
};
