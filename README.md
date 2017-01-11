[![Build Status](https://img.shields.io/travis/mcfiredrill/forttree.svg?style=flat)](http://travis-ci.org/mcfiredrill/forttree)
[![Code Climate](https://img.shields.io/codeclimate/github/mcfiredrill/forttree.svg?style=flat)](https://codeclimate.com/github/mcfiredrill/forttree)
[![Dependency Status](https://img.shields.io/gemnasium/mcfiredrill/forttree.svg?style=flat)](https://gemnasium.com/mcfiredrill/forttree)

Forttree
=======

A wakaba/kareha imageboard clone.

Install
=======
You will need to create an admin record with a password to delete posts. Run
the rake task `setup` to do this.

```
$ RAILS_ENV=production rake setup
Enter admin password for your board:
f0ibles
Admin created.
```

Configuration
=============
Edit the file config/initializers/fortconfig.rb to configure various options.

Go to `/boards/new` to make a new board in your tree.

Image Storage
=============
You can use local filesystem or S3 for storage. Set STORAGE to :s3 and enter your
S3 credentials in fortconfig.rb to use S3.

---

A ruby translation project managed on [Locale](http://www.localeapp.com/) that's open to all!

## Contributing to forttree

- Edit the translations directly on the [forttree](http://www.localeapp.com/projects/public?search=forttree) project on Locale.
- **That's it!**
- The maintainer will then pull translations from the Locale project and push to Github.

Happy translating!
