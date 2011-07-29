# encoding: utf-8
require File.join(File.dirname(__FILE__), "lib", "simple_captcha")

config.before_initialize do
  ActiveSupport.on_load :active_record do
    ActiveRecord::Base.send(:include, SimpleCaptcha::ModelHelpers)
  end
end

config.after_initialize do
  ActionView::Base.send(:include, SimpleCaptcha::ViewHelper)
  ActionView::Helpers::FormBuilder.send(:include, SimpleCaptcha::FormBuilder)
  
  if Object.const_defined?("Formtastic")
    Formtastic::SemanticFormHelper.builder = SimpleCaptcha::CustomFormBuilder
  end
end
