# Sourcing

ActiveWrite fork of https://github.com/ckeditor/ckeditor5-build-classic.

Periodically, this can be synched from the CKEditor master to pick up fixes.


# Context

**MANY BAD THINGS HAPPEN IF THE EDITOR VERSION ISN'T CONTROLLED.**

To use some CKEditor features (server-side storage, others) you must have an
editor bundle registered into your CKE environment with a unique version tag.
CKE uses that editor build in the background to load and save the document.

When you open a doc from the app, you must pass in the editor bundle ID to use
in the editor instance. If the editor hasn't been registered, that's an error.

[] what happens if you create a doc with bundle 1 then later re-open the same
doc using bundle 2? Which one is used? Is there an error message from CKE?

**WE MAY NEED THE SAME EDITOR BUNDLE VERSION LATER** to look at older docs.
So we also have to keep a version history of any bundles actually used.


# Building

Do whatever you need to change the plugins, menu config and so on.

Local build: `npm run preversion`. This will perform a build and make a git
commit flagged as "internal". Manually bump the version in package.json, run
`npm run build` to create a minified editor bundle and test the editor build
on the local machine (path-based yarn install in AW or use "publishing" step
below / push to npm for package delivery). Version bump is mandatory for any
build that leaves your machine for any reason including just being registered
via the CKEditor management API, even if not used for any documents.

Both the preversion and the build step run a hashing protocol to determine a
unique but not too-changeable bundle ID. The hash will changes if a relevant
section of several files changes (including package.json, package-lock.json,
webpack.config.js, the editor source ckeditor.js, and the hash utility file
itself get-sha1sum.sh). The hash ignores change in the parts of package.json
that don't affect a compile, like version number or package name. This means
the hash will not change before and after you bump the version number.

**BE CAREFUL ABOUT CHANGING THE CONTENTS OF THOSE FILE**. Actual, meaningful
changes are fine. Comment and whitespace changes that don't affect operation
will change the hash for no good reason. That causes unnecessary complexity.

Publishing: make sure the `npm run build` step completed above and that you
bumped the version number in package.json, and have done a local commit and
also push to remote. Push to public npm via `npm publish . --access public`
then see https://www.npmjs.com/package/@activewrite/ckeditor5-build-classic.
This needs to be a public npm repo for now to make Netlify builds simple.

Uploading: to use CKEditor server-side storage, our custom editor needs to
be uploaded as a bundle to their servers (and the same bundle version must
then be used in our site -- must coordinate timing per instance). Use the
utility functions in the "aw-ckeditor5-apicontrol" project to do that. See
that repo for examples of how to upload the editor bundle with version.


# License

Carrying forward the original CKEditor license.

Licensed under the terms of [GNU General Public License Version 2 or later](http://www.gnu.org/licenses/gpl.html). For full details about the license, please check the `LICENSE.md` file or [https://ckeditor.com/legal/ckeditor-oss-license](https://ckeditor.com/legal/ckeditor-oss-license).





@@todo add npms: -engine, -ui

@@todo discuss overall workflow incl commits
