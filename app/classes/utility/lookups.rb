module Lookups

  # Allows the definition of lookup values in a class.
  def define_lookup(klass_name, lookup_codes)

    # Ensure the classname conforms to convention
    klass_name = klass_name.to_s.classify

    # Build the new class to hold the lookup
    self.const_set(klass_name, Class.new)
    klass = eval("#{self.name}::#{klass_name}")

    # Add class methods
    klass.instance_eval do

      cattr_accessor :codes

      # Allow access using LookupClass.code(the_code)
      def code(code)
        send(code.to_s)
      end

      # Get the translation for the code
      def human_name(code)
        class_names = name.gsub('::','.').underscore
        I18n.t("lookups.#{class_names}.#{code}")
      end

      # All of the types for use in a form select list
      def select_list
        codes.map { |code| [human_name(code), code] }
      end
      
      # Check that the given type exists
      def valid_type?(code)
        codes.include?(code.to_s)
      end

      # Allow the use of EntityType.production (for example)
      def method_missing(method, *args, &block)
        return method.to_s if valid_type?(method)
        super
      end

      # Always have a respond_to with a method missing!
      def respond_to?(method)
        return true if valid_type?(method)
        super
      end

    end

    # Set the codes
    klass.codes = lookup_codes

  end

end
