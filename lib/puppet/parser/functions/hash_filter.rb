module Puppet::Parser::Functions
  newfunction(:hash_filter, :type => :rvalue, :doc => <<-EOS
      Returns a new hash consisting of elements which have specific value of specific attribute
    EOS
  ) do |args|
    raise(Puppet::ArgumentError, "absents(): Wrong number of arguments given") if args.size != 3
    raise(Puppet::ArgumentError, "absents(): First parameter must be a hash") if args[0].class != Hash
    raise(Puppet::ArgumentError, "absents(): Second parameter must be a String") if args[1].class != String
    raise(Puppet::ArgumentError, "absents(): Third parameter must be a Array") if args[2].class != Array

    hash   = args[0]
    name   = args[1]
    values = args[2]

    hash.select { |k,i| values.include?(i[name]) }
  end
end
