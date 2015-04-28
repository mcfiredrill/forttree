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

Image Storage
=============
You can use local filesystem or S3 for storage. Set STORAGE to :s3 and enter your
S3 credentials in fortconfig.rb to use S3.
