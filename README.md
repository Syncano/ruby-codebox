# ruby-codebox


This repository contains Dockerfile for Ruby 2.2 image with built-in support for Syncano and selected Ruby gems.

You can build the image yourself:

```
$ docker build -t quay.io/syncano/ruby-codebox .
```

or pull it from Docker registry:

```
$ docker pull quay.io/syncano/ruby-codebox
```

Then you can run Docker container:


```
$ docker run -it quay.io/syncano/ruby-codebox
irb(main):001:0>
```

In a container you can use Syncano's Ruby Library:

```
irb(main):001:0> require 'syncano'
=> true
```

More info about the library can be found [here](https://github.com/Syncano/syncano-ruby/tree/release/4.0).
