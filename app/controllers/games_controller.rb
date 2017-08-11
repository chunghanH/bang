class GamesController < ApplicationController

	def index
		@games = Game.all
	end

	def clear
		@games = Game.all
		@games.destroy_all
		redirect_to games_path
	end

	def play
		game = Games.new
		@result = game.rps(params[:user_input])
		@game = Game.create(result: @result)
		if @game.save
			redirect_to games_path
		else
			render :index
		end
	end
end

class Games
	def rps(user_input)
	  com_input = ['R', 'P', 'S'].sample
  	  regex = /RS|SP|PR/  #符合勝利的正規表示法
 	  choice = "#{user_input}#{com_input}"

	  if choice =~ regex
	    result =  'Result:You win'  
	  elsif choice.reverse =~ regex
	    result =  'Result:You lose'  
	  else
	    result =  'Result:Draw'  
	  end
	  result
	end
end
