return Def.Sprite {
	Texture=NOTESKIN:GetPath('_Tap','Note1');
	Frames = Sprite.LinearFrames( 16, 2 );
	InitCommand=cmd(effectclock,'beat';);
	DrawTapNoteMessageCommand=function(self,parent)
		parent:spin();
	end;
};
