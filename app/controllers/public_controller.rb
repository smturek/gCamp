class PublicController < ApplicationController

  skip_before_action :logged_in?

end
