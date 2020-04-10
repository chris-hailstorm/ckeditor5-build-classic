# Sourcing

This is the AW fork of https://github.com/ckeditor/ckeditor5-build-classic.

This should be pushed to the ActiveWrite private repository. Periodically
it should be synched from the CKEditor master to pick up bug fixes.


# Building

If needed: `npm install`

Local build: `npm run preversion`. This will perform a build and make a git
commit flagged as "internal". Manually bump the version in package.json,
and test the build on the local machine. Those commit can remain local.

Publishing: when ready for broader use, push to the AW private repository.
More build processes (CI-CD cycle) can be triggered by that commit.


# License

Licensed under the terms of [GNU General Public License Version 2 or later](http://www.gnu.org/licenses/gpl.html). For full details about the license, please check the `LICENSE.md` file or [https://ckeditor.com/legal/ckeditor-oss-license](https://ckeditor.com/legal/ckeditor-oss-license).
