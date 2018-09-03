module Admin
  module ApplicationHelper

    def present(object, klass = 'index')
      klass = "Admin::#{klass.camelize}Presenter".constantize
      presenter = klass.new(object, self)
      yield presenter if block_given?
      presenter
    end

    def ren_fld(presenter, field, locals = {})
      locals.merge!(field: field, presenter: presenter)
      puts "****************************************"
      puts locals
      render locals: locals, partial: field.to_partial_path
    end
  end
end
