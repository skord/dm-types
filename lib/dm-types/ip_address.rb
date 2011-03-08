require 'ip'
require 'dm-core'

module DataMapper
  class Property
    class IPAddress < String
<<<<<<< HEAD
      length 39
=======

      # Way too much, but without a lot of legwork, knowing what's right is a PITA.
      length 128
>>>>>>> 9b77560... using ruby-ip

      def primitive?(value)
        value.kind_of?(IP)
      end

      def valid?(value, negated = false)
        super || dump(value).kind_of?(::String)
      end

      def load(value)
        if value.nil?
          nil
<<<<<<< HEAD
        elsif value.is_a?(::String) && !value.empty?
          IPAddr.new(value)
        elsif value.is_a?(::String) && value.empty?
          IPAddr.new("0.0.0.0")
=======
        elsif value.is_a?(::String)
          unless value.empty?
            IP.new(value)
          else
            IP.new("0.0.0.0")
          end
>>>>>>> 9b77560... using ruby-ip
        else
          raise ArgumentError.new("+value+ must be nil or a String")
        end
      end

      def dump(value)
        return nil if value.nil?
        value.to_s
      end

      def typecast_to_primitive(value)
        load(value)
      end
    end # class IPAddress
  end # module Property
end # module DataMapper
