all: assets/audio/panumoon_-_sidebyside_2.ogg

assets/audio/panumoon_-_sidebyside_2.mp3:
	wget -O $@ http://ccmixter.org/content/panumoon/panumoon_-_sidebyside_2.mp3

assets/audio/panumoon_-_sidebyside_2.ogg: assets/audio/panumoon_-_sidebyside_2.mp3
	ffmpeg -i $< -acodec libvorbis $@
