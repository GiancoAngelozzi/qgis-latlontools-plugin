PLUGINNAME = latlontools
PLUGINS = "$(HOME)"/AppData/Roaming/QGIS/QGIS3/profiles/default/python/plugins/$(PLUGINNAME)
PY_FILES = latLonTools.py __init__.py copyLatLonTool.py zoomToLatLon.py settings.py LatLon.py multizoom.py mgrs.py showOnMapTool.py mapProviders.py tomgrs.py mgrstogeom.py digitizer.py util.py geom2field.py olc.py provider.py pluscodes.py
EXTRAS = metadata.txt

deploy:
	mkdir -p $(PLUGINS)
	cp -vf $(PY_FILES) $(PLUGINS)
	cp -vf $(EXTRAS) $(PLUGINS)
	cp -vfr images $(PLUGINS)
	cp -vfr ui $(PLUGINS)
	cp -vfr doc $(PLUGINS)
	cp -vf helphead.html $(PLUGINS)/index.html
	python -m markdown -x markdown.extensions.headerid readme.md >> $(PLUGINS)/index.html
	echo '</body>' >> $(PLUGINS)/index.html

