all: html qhp

html:
	doxygen Doxyfile

qhp:
	cp -vf Doxyfile Doxyfile.qhp
	sed -i "s/GENERATE_QHP           = NO/GENERATE_QHP           = YES/g" Doxyfile.qhp
	sed -i "s/OUTPUT_DIRECTORY       = Docs_html/OUTPUT_DIRECTORY       = Docs_qhp/g" Doxyfile.qhp
	sed -i "s/qtgui.tags=https:\/\/doc.qt.io\/qt-5\//qtgui.tags=qthelp:\/\/org.qt-project.qtgui\/qtgui\//g" Doxyfile.qhp
	sed -i "s/qtcore.tags=https:\/\/doc.qt.io\/qt-5\//qtcore.tags=qthelp:\/\/org.qt-project.qtcore\/qtcore\//g" Doxyfile.qhp
	sed -i "s/qtwidgets.tags=https:\/\/doc.qt.io\/qt-5\//qtwidgets.tags=qthelp:\/\/org.qt-project.qtwidgets\/qtwidgets\//g" Doxyfile.qhp
	doxygen Doxyfile.qhp
install:
	mkdir -p $(DESTDIR)/usr/share/qt5/doc
	cp -r  Docs_qhp/dtk.qch $(DESTDIR)/usr/share/qt5/doc/
clean:
	rm -rf Docs_*
	rm -f Doxyfile.qhp 
