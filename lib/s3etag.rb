#!/usr/bin/env ruby

require 'digest/md5'
require 'optparse'
require 'stringio'

module S3Etag

  def calc opt = {}
    threshold = opt[:threshold] || 16 * 1024 * 1024
    max_parts = opt[:max_parts] || 10000
    min_part_size = opt[:min_part_size] || 5 * 1024 * 1024

    if opt[:file]
      total_size = File.stat(opt[:file]).size
      io = open(opt[:file])
    elsif opt[:data]
      total_size = opt[:data].size
      io = StringIO.new opt[:data]
    else
      raise ':file or :data is required'
    end

    r = nil
    begin
      if total_size < threshold
        r = Digest::MD5.hexdigest(io.read)
      else
        part_size = [(total_size.to_f / max_parts).ceil, min_part_size].max.to_i
        md5s = []
        while !io.eof?
          md5s << Digest::MD5.digest(io.read(part_size))
        end
        r = Digest::MD5.hexdigest(md5s.join('')) + '-' + md5s.size.to_s
      end
    rescue Exception => e
      raise e
    ensure
      io.close
    end
  end

  module_function :calc
end
