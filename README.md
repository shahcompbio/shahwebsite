# shah lab research website

The shah lab website is be a jekyll website based on the bedford lab's website: http://bedford.io/.  The bedford jekyll website contains a few nice features including a front page summarizing recent blog posts, papers, and project.  Projects are auto populated using a ruby script from meta data extracted from github repos, and are thus referring to software projects specifically.

The new website will lives on github pages.  Because the bedford lab website uses some preprocessing and plugins not supported by github pages, we will not use the feature provided by github pages to automatically generate a jekyll website from jekyll source.  Instead, the jekyll source will be here: https://github.com/shahcompbio/shahwebsite, and the built website here: https://github.com/shahcompbio/shahcompbio.github.io.

## Build site

To build the website locally, clone the repo with:

```
git clone --recursive https://github.com/shahcompbio/shahwebsite.git
```

Then install necessary Ruby dependencies by running `bundle install` from within the `shahwebsite` directory.  After this, the site can be be built with:

```
bundle exec jekyll build
```

(If you are getting errors at this stage, it may be due to your version of `bundle`. Try `gem uninstall bundler` + `gem install bundler -v 1.13.1`.)

To view the site, run `bundle exec jekyll serve` and point a browser to `http://localhost:4000/`.  More information on Jekyll can be found [here](http://jekyllrb.com/).

To include projects, preprocessing scripts are necessary to clone project repos and update Jekyll metadata. This can be accomplished with:

```
bundle exec ruby _scripts/update-and-preprocess.rb
```

> Note that you need to create a .netrc file to allow the ruby script to pull data using the github api.

Then `bundle exec jekyll build` works as normal.

## Updating

The built website repo is included as a submodule in the jekyll source repo in the `_site` subdirectory.  This means that after building the website, and checking it renders correctly you simply have to commit the submodule and push.

```
cd _site
git add -u *
git commit -m "new blog" .
cd ..
git commit -m "new blog" _site
```

## Contribute

Blog posts just require YAML top matter that looks something like:

```
---
layout: post
title: Newton Institute presentation
author: Trevor Bedford
link: http://www.newton.ac.uk/programmes/IDD/seminars/2013082213301.html
image: /images/blog/transmission.png
---
```

The `layout`, `title` and `author` tags are required, while `link` and `image` are optional.  Just save a Markdown file with this top matter as something like `blog/_posts/2013-08-27-newton-institute.md`, where `2013-08-27` is the date of the post and `newton-institute` is the short title.  This short title is used in the URL of the post, so this becomes `blog/newton-institute/`, so the short title should be long enough and unique enough not to cause conflicts with other posts.

## For more information

* Look over the [metadata format guide](http://bedford.io/guide/format/)
* Look over the [Markdown style guide](http://bedford.io/guide/style/)

## License

All source code in this repository, consisting of files with extensions `.html`, `.css`, `.less`, `.rb` or `.js`, is freely available under an MIT license, unless otherwise noted within a file. You're welcome to borrow / repurpose code to build your own site, but I would very much appreciate attribution and a link back to [bedford.io](http://bedford.io) from your `about` page.

**The MIT License (MIT)**

Copyright (c) 2013-2016 Trevor Bedford

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
