# Sourcing

This is the ActiveWrite fork of https://github.com/ckeditor/ckeditor5-build-classic.

Periodically, this can be synched from the CKEditor master to pick up fixes.


# Building

Local build: `npm run preversion`. This will perform a build and make a git
commit flagged as "internal". Manually bump the version in package.json,
and test the build on the local machine. Those commit can remain local.

Publishing: push to the public npm repo via `npm publish . --access public`
then see https://www.npmjs.com/package/@activewrite/ckeditor5-build-classic.
This needs to be public for now to make Netlify builds simple.

Uploading: to use CKEditor server-side storage, our custom editor needs to
be uploaded as a bundle to their servers (and the same bundle version must
then be used in our site -- must coordinate timing per instance).


# License

Carrying forward the original CKEditor license.

Licensed under the terms of [GNU General Public License Version 2 or later](http://www.gnu.org/licenses/gpl.html). For full details about the license, please check the `LICENSE.md` file or [https://ckeditor.com/legal/ckeditor-oss-license](https://ckeditor.com/legal/ckeditor-oss-license).
