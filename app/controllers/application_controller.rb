class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  require 'date'
end
