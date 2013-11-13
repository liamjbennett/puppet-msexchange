#
# domain.rb
#

module Puppet::Parser::Functions
  newfunction(:domain, :type => :rvalue, :doc => <<-EOS
Returns the domain name for a given string
    EOS
  ) do |arguments|

    if (arguments.size != 1) then
      raise(Puppet::ParseError, "domain(): Wrong number of arguments "+
        "given #{arguments.size} for 1")
    end
  
    domain = "--"
    begin
      
      arg0 = %Q|#{arguments[0]}|
      arg0.sub!(/^\\\\/, '')

      arg0 = arg0.split("\\")[0]

      uri = arg0.split(".")
      hostname = uri.shift
      domain = uri.join(".")
      
    rescue ArgumentError
      raise(Puppet::ParseError, "domain(#{arguments[0]}): is not a valid uri")
    end
    
    return domain
  end
end