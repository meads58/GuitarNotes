#GuitarNotes creates a guitar fretboard for 1 octave.
class GuitarNotes
    def initialize
        @noteHash = Hash.new
        @noteArray = ['A', 'A#', 'B', 'C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#']
        @strings = (1..6).to_a
        @frets = (1..12).to_a
        @stringFret = Array.new
    end


#numbers each string with a fret from 1 to 12.
    def createFretBoard 
        @strings.each do |s| 
            @frets.each do |f|
                @stringFret << s.to_s + f.to_s
            end
        end 
        return @stringFret
    end   
    
#labels each stringFret number with its note.
    def labelNotes
        createFretBoard.each do |n|
            case n.to_s[0]
                when '1' then noteRotate(-4,n)
                when '2' then noteRotate(1,n)
                when '3' then noteRotate(-6,n)
                when '4' then noteRotate(-1,n)
                when '5' then noteRotate(3,n)
                when '6' then noteRotate(-4,n)
            end
        end
        return @noteHash
    end

#orders the noteArray to start on the correct note per string e.g. EADGBE
    def noteRotate(rotateAmount,fret)
        note = @noteArray.rotate(rotateAmount)
        fret_s = fret.to_s
        pos = (fret_s.slice(1,fret_s.length)).to_i
        @noteHash[fret] = note[pos-1]
    end


end

#Game which uses the fretboard to test you note knowledge.
class NoteGame < GuitarNotes
    def initialize
        super
        @gameBoard = labelNotes
        @ans = 'play'
        @pos = String.new
        @score = 0
        
    end

#Generates a random fret string position
    def randomPosition
        #@gameBoard = labelNotes
        randHash =  rand(1..6).to_s + rand(1..12).to_s
        return randHash
    end

    def ordinalize(n)
    n.to_s+%w{th st nd rd}[n/10%10==1||n%10>3?0:n%10]
    end    

#Formats the string note selected into a question format.    
    def formatFretString(strFrt)
        @pos = randomPosition.to_s
        #puts @gameBoard[@pos] #uncomment to see the answers
        string = ordinalize(@pos.slice(0).to_i)
        fret = ordinalize(@pos.slice(1..-1).to_i)
        
        return "What is the note on the #{fret} fret of the #{string} string? "
     end
 
    def checkAnswer(userResponse)   
        if userResponse.upcase ==  @gameBoard[@pos]
            @score += 1
            return "Correct"
        else
            return "Incorrect, that note is #{@gameBoard[@pos]}" 
        end    
    end 

#How to run the game.     
    def main
        x = nil
        counter = 0
        welcome = 'Play the game or type exit to quit' 
        puts welcome
        until @ans == 'exit'
            puts welcome if x == 0  
            puts formatFretString(randomPosition) 
            @ans = gets.chomp
            x = rand(3)
            puts checkAnswer(@ans)
            counter += 1
             
        end
        puts "you got #{@score} correct from #{counter - 1} questions attempted"
    end


end

gat = NoteGame.new
puts gat.main


