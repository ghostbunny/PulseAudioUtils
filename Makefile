
help:
	echo "usage: make [ install | uninstall ]"
		      

install:
	mkdir -p $(DESTDIR)$(PREFIX)/share/icons/PulseAudioUtils/
	cp icons/* $(DESTDIR)$(PREFIX)/share/icons/PulseAudioUtils/
	mkdir -p $(DESTDIR)$(PREFIX)/bin/
	mkdir -p $(DESTDIR)$(PREFIX)/share/applications/
	cp scripts/* $(DESTDIR)$(PREFIX)/bin/
	cp desktop-files/* $(DESTDIR)$(PREFIX)/share/applications/

uninstall:
	rm $(DESTDIR)$(PREFIX)/share/applications/PulseAudioControlPanel.desktop*
	rm $(DESTDIR)$(PREFIX)/share/applications/PulseAudioEqualizer.desktop*
	rm $(DESTDIR)$(PREFIX)/share/applications/PulseAudioRecorder.desktop*
	rm $(DESTDIR)$(PREFIX)/bin/PulseAudioControlPanel
	rm $(DESTDIR)$(PREFIX)/bin/PulseAudioMixer
	rm $(DESTDIR)$(PREFIX)/bin/PulseAudioRecorder
	rm -rf $(DESTDIR)$(PREFIX)/share/icons/PulseAudioUtils/
