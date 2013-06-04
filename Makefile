# Generate binary egg distribution
bdist_egg :
	python ./setup.py bdist_egg

# Generate source distribution. This is the command used to generate the
# public distribution package.
sdist :
	python ./setup.py sdist

# Generate sphinx documentation
sphinx-compile :
	mkdir -p docs/_build
	pa -w confdoc -p tayrakit -o docs/configuration.rst
	cp CHANGELOG.rst docs/
	cp README.rst docs/index.rst
	cat docs/index.rst.inc >> docs/index.rst
	rm -rf docs/_build/html/
	make -C docs html

# generate sphinx documentation and zip the same for package upload.
sphinx : sphinx-compile
	cd docs/_build/html; zip -r tayrakit.sphinxdoc.zip ./

# Upload package to python cheese shop (pypi)
upload :
	python ./setup.py sdist register -r http://www.python.org/pypi upload -r http://www.python.org/pypi
	
pushcode: push-github 

push-googlecode:
	hg push https://prataprc@code.google.com/p/tayrakit/

push-bitbucket:
	hg push https://prataprc@bitbucket.org/prataprc/tayrakit

push-github:
	hg bookmark -f -r default master
	hg push git+ssh://git@github.com:prataprc/tayrakit.git

clean :
	rm -rf docs/_build;
	rm -rf dist;
	rm -rf tayrakit.egg-info/;
	rm -rf `find ./ -name parsetyrtab.py`;
	rm -rf `find ./ -name lextyrtab.py`;
	rm -rf `find ./ -name "*.pyc"`;
	rm -rf `find ./ -name "yacctab.py"`;
	rm -rf `find ./ -name "lextab.py"`;
	rm -rf tayrakit/plugins/*.ttl.py
