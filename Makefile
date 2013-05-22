bdist_egg :
	python ./setup.py bdist_egg

sdist :
	python ./setup.py sdist

sphinx-doc :
	cp README.rst sphinxdoc/source/
	cp CHANGELOG.rst sphinxdoc/source/
	make -C sphinxdoc html
	cd sphinxdoc/build/html; zip -r tayrakit.sphinxdoc.zip ./

upload :
	python ./setup.py sdist register -r http://www.python.org/pypi upload -r http://www.python.org/pypi
	
pushcode: push-googlecode push-bitbucket push-github 

push-googlecode:
	hg push https://prataprc@code.google.com/p/tayrakit/

push-bitbucket:
	hg push https://prataprc@bitbucket.org/prataprc/tayrakit

push-github:
	hg bookmark -f -r default master
	hg push https://git@github.com:prataprc/tayrakit.git

clean :
	rm -rf build;
	rm -rf dist;
	rm -rf tayrakit.egg-info/;
	rm -rf `find ./ -name parsetyrtab.py`;
	rm -rf `find ./ -name lextyrtab.py`;
	rm -rf `find ./ -name "*.pyc"`;
	rm -rf `find ./ -name "yacctab.py"`;
	rm -rf `find ./ -name "lextab.py"`;
	rm -rf tayrakit/plugins/*.ttl.py
