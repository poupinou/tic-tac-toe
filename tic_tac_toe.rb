require 'pry'
	class Player
#les attribus dont j'ai besoin
		attr_accessor :nom, :etat, :figure

		def initialize(nom, figure)
		@nom = nom
		@etat = true
		@figure = figure
		end
	end

class Board
#lle tableau du morpion
	def initialize

		@ca = [[' ', ' ', ' '],[' ', ' ', ' '],[' ', ' ', ' ']]
	end
	def show
#le tbleau graphique avec les correspondances de l'array
		puts "  0  | 1 |  2 ".center(200)
		puts "----------------".center(200)
		puts "0  #{@ca[0][0]} |  #{@ca[0][1]} | #{@ca[0][2]} ".center(200)
		puts "----------------".center(200)
		puts "1  #{@ca[1][0]} |  #{@ca[1][1]} | #{@ca[1][2]} ".center(200)
		puts "----------------".center(200)
		puts "2  #{@ca[2][0]} |  #{@ca[2][1]} | #{@ca[2][2]} ".center(200)
		puts "----------------".center(200)
	end
#le p;acement des figures si l'emplacement n'est pas vide
	def play(figure, box)
		
		if @ca[box.byteslice(0).to_i][box.byteslice(1).to_i] == " "
			@ca[box.byteslice(0).to_i][box.byteslice(1).to_i] = figure 
				else
					puts "rentre une case vide!!!!!".center(200)
		end
#les combinaisons gagnantes
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
#le GAME	
class Game

	attr_accessor :players, :board

	def initialize
		#nouveau tableau
		@players = []
		@board = Board.new			
#nom premier joueur
		puts "nom premier joueur?".center(200)
		nomj1 = gets.chomp
	#choix de la figure
		puts "X ou O?".center(200)
		@players << Player.new(nomj1, gets.chomp.upcase )
#nom du deuxiem joueur
		puts "nom second joueur?".center(200)
#si le piermier joueur a choisi la croix le deuxieme prend l'autre ou le contraire
		if @players[0].figure == "X" then choix2 = "O" else choix2 = "X" end
			@players << Player.new(gets.chomp, choix2)
			puts "_____CONSIGNES_____".center(200)
			puts "le tableau est compsé de 9 cases, 3*3. vous devez d'abord entrer le numéro de la ligne, et ensuite celle de la colone.BON MATCH!!!!!!!!!!!! ".center(200)
			puts "_______________________________________________________________________________________________________________________________________________".center(200)
				tour
		end

	def tour
#le tour de jeux 
		while @players[0].etat && @players[1].etat 	
			@players.each do |gus|
				@board.show
				puts "#{gus.nom}!!! A TOI DE JOUER!!!!".center(200)
				#le win s'enclanche si 'play' return true et intromp la partie
				win = board.play(gus.figure, gets.chomp)
					if win
						puts "les #{gus.figure} ont gagnés!!!! Bien joué #{gus.nom}".center(200) 
						return
					end
				end
			end
	end				
end

partie = Game.new









