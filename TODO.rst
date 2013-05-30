A roadmap of things to do
-------------------------


Release check-list 
-----------------

- Sphinx doc quick-start, one time activity.
        sphinx-quickstart   # And follow the prompts.
        sphinx-apidoc -f -d 2 -T -o  docs/ tayrakit $(APIDOC_EXCLUDE_PATH)

- Change the release version in ./CHANGELOG.rst, ./tayrakit/__init__.py

- Update TODO.rst if any, because both CHANGELOG.rst and TODO.rst are referred
  by README.rst.

- Check whether release changelogs in CHANGELOG.rst have their release-timeline
  logged, atleast uptill the previous release.

- Update setup.py and MANIFEST.in for release

- Make sure that sphinxdoc/modules/ has all the modules that need to be
  documented. Update docs/glossary.rst based on tayra/docs/glossary.rst

- Enter virtual environment and upload the source into pypi.
        make upload

- Upload documentation zip.

- After making the release, taging the branch, increment the version number.

- Create a tag and push the tagged branch to 
    github.com

