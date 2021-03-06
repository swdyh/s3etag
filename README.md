# S3etag

[![Build Status](https://secure.travis-ci.org/swdyh/s3etag.png?branch=master)](http://travis-ci.org/swdyh/s3etag)

calculate AWS S3 etag

> Generally the ETAG is the MD5 of the object. If the object was uploaded using multipart upload then this is the MD5 all of the upload-part-md5s.

http://docs.amazonwebservices.com/AWSRubySDK/latest/AWS/S3/S3Object.html#etag-instance_method

# Install

    % gem install s3etag

# Gem

    require 's3etag'

    p S3Etag.calc(:data => 'a' * 1000)
    p S3Etag.calc(:data => 'a' * 1000, :threshold => 100, :min_part_size => 100)
    p S3Etag.calc(:file => 'test.txt')
    p S3Etag.calc(:file => '.text.text', :threshold => 100, :min_part_size => 100)

# Command line

    % s3etag
    s3etag file
        -t, --threshold threshold
        -p, --max-parts max-parts
        -s, --min_part_size min_part_size

    % s3etag text.txt
    91fdac689d4861c9ae7a0afa21a1f6b8-18

    % s3etag -s 10000000 text.text
    32aafcd9748824e559b4dbd6b908f6fa-10


# Etc

https://github.com/swdyh/s3etag
The MIT License
