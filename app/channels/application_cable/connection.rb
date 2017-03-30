module ApplicationCable
  class Connection < ActionCable::Connection::Base
  	
  	def connect
  		# self.current_user = find_current_user
  	end

  	def disconnect

  	end 

  	protected 

  		# def find_current_user
  		# 	(current_user = env['warden'].user) ? current_user : reject_unauthorized_connection
  		# end

  end
end
