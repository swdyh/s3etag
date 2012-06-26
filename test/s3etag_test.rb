require 'test/unit'
require 'digest/md5'
require 'fileutils'
require 'pathname'
require Pathname.new(__FILE__).realpath.join('..', '..', 'lib', 's3etag').to_s

class S3EtagTest < Test::Unit::TestCase

  def test_calc
    d1 = '0'
    d2 = '0' * 1024 * 1024 * 16
    d3 = '0' * (1024 * 1024 * 16 + 1)

    tmp_dir = '_tmp'
    FileUtils.mkdir_p tmp_dir
    open(File.join(tmp_dir, 'd1.txt'), 'w') { |f| f.write(d1) }
    open(File.join(tmp_dir,'d2.txt'), 'w') { |f| f.write(d2) }
    open(File.join(tmp_dir,'d3.txt'), 'w') { |f| f.write(d3) }


    assert_equal Digest::MD5.hexdigest(d1), S3Etag.calc(:data => d1)
    assert_equal '50838bbf29aec4c6e62bee320d5c9138', S3Etag.calc(:data => d2)
    assert_equal 'f41a8bb2924e4dccba846428d5ccd921-4', S3Etag.calc(:data => d3)
    assert_equal Digest::MD5.hexdigest(d1), S3Etag.calc(:file => File.join(tmp_dir, 'd1.txt'))
    assert_equal '50838bbf29aec4c6e62bee320d5c9138', S3Etag.calc(:file => File.join(tmp_dir, 'd2.txt'))
    assert_equal 'f41a8bb2924e4dccba846428d5ccd921-4', S3Etag.calc(:file => File.join(tmp_dir,  'd3.txt'))

    FileUtils.rm_rf tmp_dir
  end
end
