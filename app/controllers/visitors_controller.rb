class VisitorsController < ApplicationController

	def index
		@users = User.all
		@new_account = Account.new
	end

end