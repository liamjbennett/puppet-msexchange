#
# hostname.rb
#

module Puppet::Parser::Functions
  newfunction(:hostname, :type => :rvalue, :doc => <<-EOS
Returns the hostname for a given string
    EOS
  ) do |arguments|

    if (arguments.size != 1) then
      raise(Puppet::ParseError, "hostname(): Wrong number of arguments "+
        "given #{arguments.size} for 1")
    end
    
    hostname = "--"
    begin
      
      arg0 = %Q|#{arguments[0]}|
      arg0.sub!(/^\\\\/, '')

      arg0 = arg0.split("\\")[0]

      uri = arg0.split(".")
      hostname = uri.shift
      domain = uri.join(".")
      
    rescue ArgumentError
      raise(Puppet::ParseError, "hostname(#{arguments[0]}): is not a valid uri")
    end
    
    return hostname
  end
end