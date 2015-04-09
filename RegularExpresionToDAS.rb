require "/home/przemyslaw/RubyProjects/RegularExpresion/TransitionTable.rb"

class RegularExpresionToDAS
	
	def initialize states, transitionTable, text, actualState
		@states, @transitionTable, @text, @state = states, transitionTable, text, actualState
		@chars = []
		@a = @text.join
	end

	def  regularExpChanger
		a = 0 
		@text.each_with_index do |char, i|

			if @state == "R"
				changeText ("<DATA>")
			elsif @state == "G"
				changeText ("<KWOTA>")		
			end

			@pos = @states.index(@state) 

			if char =~ /[0-9]/
				findTransition 0, @text[i]
				next
			elsif char == ','
				findTransition 1, @text[i]
				next
			elsif char == ' '
				findTransition 2, @text[i]
				next
			elsif char == '-'
				findTransition 3, @text[i]
				next
			elsif char == '/'
				findTransition 4, @text[i]
				next
			elsif char == 'z' and @text[i+1] == 'l'
				findTransition 5, @text[i], @text[i+1]
				next
			elsif char == 't' and @text[i+1] == 'y' and @text[i+2] == 's'
				findTransition 6, @text[i], @text[i+1], @text[i+2]
				next
			else
				@state = "A"
				@chars = [] 
			end
		end
		showOutput()
	end

	private 

		def changeText (chaText)
			@a.sub! @chars.join, chaText
			@chars = []
			@state = "A"
		end

		def findTransition tablePosition, *characters
			if @transitionTable[@pos][tablePosition] != 0
				@state = @transitionTable[@pos][tablePosition]
				@chars << characters.each {|c| c}
				@kr = 0
			end
		end

		def showOutput
			p @text.join
			p "-----------------------------------------------------------"
			p @a
		end
end

text = "Do 2015-04-09. A do 2044/11/31 oddam  12,41 zl i dlatego dam Ci 6 tys.".split(//)

regChan = RegularExpresionToDAS.new TransitionTable::STATES, TransitionTable::TRANTABLE, text, "A"
regChan.regularExpChanger