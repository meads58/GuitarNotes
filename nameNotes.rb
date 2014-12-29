#what note is on the fret x, of string x?

class GuitarNotes
def initialize
    @noteHash = Hash.new
    @noteArray = ['A', 'A#', 'B', 'C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#']
    @strings = (1..6).to_a
    @frets = (1..12).to_a
    @stringFret = Array.new
end



def createFretBoard #
@strings.each do |s| 
    @frets.each do |f|
        @stringFret << s.to_s + f.to_s
        end
    end 
    return @stringFret
end   
    

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

def noteRotate(rotateAmount,fret)#arrange the notes per string
  note = @noteArray.rotate(rotateAmount)
  fret_s = fret.to_s
  pos = (fret_s.slice(1,fret_s.length)).to_i
  @noteHash[fret] = note[pos-1]
  
end


end

#selects a random string and fret combination
def randomPosition
 string = 6 #rand(6) + 1
 fret = rand(3) + 1
 postion = (string.to_s + fret.to_s).to_i
 
 #puts "What is the note on the #{fret} fret of the #{string} string?"
 
 return postion
 
end

def checkAnswer ans

    if @noteHash.has_key?(ans) then
        puts @noteHash[ans]
    end

end

gat = GuitarNotes.new
#gat.createFretBoard
puts gat.labelNotes


#string = ["E","A","D","G","B"].sample #sample chooses a random string from the array.
#puts string

#noteQuestion = randomPosition()
#checkAnswer(noteQuestion)