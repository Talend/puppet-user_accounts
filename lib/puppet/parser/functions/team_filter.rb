module Puppet::Parser::Functions
  newfunction(:team_filter, :type => :rvalue, :doc => <<-EOS
      Returns a hash of the elements that have specified groups
    EOS
  ) do |args|
    raise(Puppet::ArgumentError, "absents(): Wrong number of arguments given") if args.size != 3
    raise(Puppet::ArgumentError, "absents(): First parameter must be a hash") if args[0].class != Hash
    raise(Puppet::ArgumentError, "absents(): Second parameter must be a hash") if args[1].class != Hash
    raise(Puppet::ArgumentError, "absents(): Third parameter must be a Array") if args[2].class != Array

    accounts = args[0]
    users    = args[1]
    groups   = args[2]

    # Set account's ensure to absent if:
    #  * the user has some groups
    #  * but the user doesn't belong to any of the groups specified
    accounts.each do |name, account|
      next unless users.has_key?(name)
      next unless users[name].has_key?('groups')

      account['ensure'] = 'absent' unless (users[name]['groups'] & groups).any?
    end
  end
end
