
help:
	echo "usage: make [ install | uninstall ]"
		      

install:
	## Translations
	# German 
	mkdir -p $(DESTDIR)$(PREFIX)/share/locale/de/LC_MESSAGES
	msgfmt translations/PulseAudioRecorder_de_DE.po -o $(DESTDIR)$(PREFIX)/share/locale/de/LC_MESSAGES/PulseAudioRecorder.mo
	msgfmt translations/PulseAudioControlPanel_de_DE.po -o $(DESTDIR)$(PREFIX)/share/locale/de/LC_MESSAGES/PulseAudioControlPanel.mo

	# Greek
	mkdir -p $(DESTDIR)$(PREFIX)/share/locale/el_GR/LC_MESSAGES
	msgfmt translations/PulseAudioRecorder_el_GR.po -o $(DESTDIR)$(PREFIX)/share/locale/el_GR/LC_MESSAGES/PulseAudioRecorder.mo
	msgfmt translations/PulseAudioControlPanel_el_GR.po -o $(DESTDIR)$(PREFIX)/share/locale/el_GR/LC_MESSAGES/PulseAudioControlPanel.mo

	# Dutch	
	mkdir -p $(DESTDIR)$(PREFIX)/share/locale/nl/LC_MESSAGES
	msgfmt translations/PulseAudioRecorder_nl.po -o $(DESTDIR)$(PREFIX)/share/locale/nl/LC_MESSAGES/PulseAudioRecorder.mo
	msgfmt translations/PulseAudioControlPanel_nl.po -o $(DESTDIR)$(PREFIX)/share/locale/nl/LC_MESSAGES/PulseAudioControlPanel.mo

	# icons
	mkdir -p $(DESTDIR)$(PREFIX)/share/icons/PulseAudioUtils/
	mkdir -p $(DESTDIR)$(PREFIX)/share/PulseAudioUtils/
	cp -R icons/* $(DESTDIR)$(PREFIX)/share/PulseAudioUtils/
	# link this in post section of the spec
	# ln -s /usr/share/PulseAudioUtils/icons#1 /usr/share/icons/PulseAudioUtils/icons
		
	# scripts + desktop files
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
	rm $(DESTDIR)$(PREFIX)/locale/*/LC_MESSAGES/PulseAudioRecorder.mo
	rm $(DESTDIR)$(PREFIX)/locale/*/LC_MESSAGES/PulseAudioControlPanel.mo
	rm -rf $(DESTDIR)$(PREFIX)/share/icons/PulseAudioUtils/
