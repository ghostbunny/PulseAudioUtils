
help:
	echo "usage: make [ install | uninstall ]"
		      

install:
	RECTRANS=$(ls translations/PulseAudioRecorder*.po)
	for i in $RECTRANS; do
		LANGTARGET=$(echo "$i" | sed -e 's/PulseAudioRecorder_//g' | sed -e 's/\.po//g')
		mkdir -p $(DESTDIR)$(PREFIX)/locale/$LANGTARGET/LC_MESSAGES
		msgfmt translations/$i -o $(DESTDIR)$(PREFIX)/locale/$LANGTARGET/LC_MESSAGES/PulseAudioRecorder.mo
	done

	PANELTRANS=$(ls translations/PulseAudioControlPanel*.po)
	for i in $PANELTRANS; do
		LANGTARGET=$(echo "$i" | sed -e 's/PulseAudioControlPanel_//g' | sed -e 's/\.po//g')
		mkdir -p $(DESTDIR)$(PREFIX)/locale/$LANGTARGET/LC_MESSAGES
		msgfmt translations/$i -o $(DESTDIR)$(PREFIX)/locale/$LANGTARGET/LC_MESSAGES/PulseAudioControlPanel.mo
	done

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
	rm $(DESTDIR)$(PREFIX)/locale/*/LC_MESSAGES/PulseAudioRecorder.mo
	rm $(DESTDIR)$(PREFIX)/locale/*/LC_MESSAGES/PulseAudioControlPanel.mo
	rm -rf $(DESTDIR)$(PREFIX)/share/icons/PulseAudioUtils/
