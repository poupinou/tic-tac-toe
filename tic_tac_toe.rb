require 'pry'
	class Player

		attr_accessor :nom, :etat, :figure

		def initialize(nom, figure)
		@nom = nom
		@etat = true
		@figure = figure
		end
	end

class Board

	def initialize

		@ca = [[' ', ' ', ' '],[' ', ' ', ' '],[' ', ' ', ' ']]
	end
	def show

		puts "  0 | 1 | 2 "
		puts "______________"
		puts "0 #{@ca[0][0]} | #{@ca[0][1]} | #{@ca[0][2]} "
		puts "______________"
		puts "1 #{@ca[1][0]} | #{@ca[1][1]} | #{@ca[1][2]} "
		puts "______________"
		puts "2 #{@ca[2][0]} | #{@ca[2][1]} | #{@ca[2][2]} "
		puts "______________"
	end

	def play(figure, box)
		
		if @ca[box.byteslice(0).to_i][box.byteslice(1).to_i] == " "
			@ca[box.byteslice(0).to_i][box.byteslice(1).to_i] = figure 
				else
					puts "rentre une case vide!!!!!"
		end

		if (@ca[0][0].include?(figure) &&  @ca[0][0] == @ca[0][1] && @ca[0][1] == @ca[0][2]) ||
			 (@ca[1][0].include?(figure) &&  @ca[1][0] == @ca[1][1] && @ca[1][1] == @ca[1][2]) ||
			 (@ca[2][0].include?(figure) &&  @ca[2][0] == @ca[2][1] && @ca[2][1] == @ca[2][2]) ||
			 (@ca[0][0].include?(figure) &&  @ca[0][0] == @ca[0][1] && @ca[0][1] == @ca[0][2]) ||
			 (@ca[1][0].include?(figure) &&  @ca[1][0] == @ca[1][1] && @ca[1][1] == @ca[1][2]) ||
			 (@ca[2][0].include?(figure) &&  @ca[2][0] == @ca[2][1] && @ca[2][1] == @ca[2][2]) ||
			 (@ca[0][0].include?(figure) &&  @ca[0][0] == @ca[1][1] && @ca[1][1] == @ca[2][2]) ||
			 (@ca[2][0].include?(figure) &&  @ca[2][0] == @ca[1][1] && @ca[1][1] == @ca[0][2])
			 then
			 return true
				else
				return false
		end
	end
end
	
class Game

	attr_accessor :players, :board

	def initialize
		@players = []
		@board = Board.new			

		puts "nom premier joueur?"
		nomj1 = gets.chomp
	
		puts "X ou O?"
		@players << Player.new(nomj1, gets.chomp.upcase )

		puts "nom second joueur?"

		if @players[0].figure == "X" then choix2 = "O" else choix2 = "X" end
			@players << Player.new(gets.chomp, choix2)
		
				tour
	end

	def tour

		while @players[0].etat && @players[1].etat 	
			@players.each do |gus|
				@board.show
				puts "#{gus.nom}!!! A TOI DE JOUER!!!!"
				win = board.play(gus.figure, gets.chomp)
					if win
						puts "les #{gus.figure} ont gagnés!!!! Bien joué #{gus.nom}"
						return
					end
				end
			end
	end				
end

partie = Game.new









