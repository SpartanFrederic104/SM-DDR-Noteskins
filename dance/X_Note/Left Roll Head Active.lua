return Def.Sprite {
	Texture=NOTESKIN:GetPath('_left','roll active');
	Frames = Sprite.LinearFrames( 1, 1 );
	InitCommand=cmd(effectclock,'beat';);
	DrawTapNoteMessageCommand=function(self,parent)
		parent:spin();
	end;
};
