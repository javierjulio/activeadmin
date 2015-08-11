module ActiveAdmin
  class Component < Arbre::Component

    # Override default Arbre behavior and use - instead of _
    # By default, add a css class named after the ruby class
    def default_class_name
      self.class.name.demodulize.underscore.dasherize
    end
  end
end
