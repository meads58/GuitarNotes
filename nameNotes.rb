#what note is on the fret x, of string x?

noteHash = Hash.new

@noteHash = {61 =>"F", 62 =>"F#", 63 =>"G"}




#selects and random string and fret combination
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

string = ["E","A","D","G","B"].sample #sample chooses a random string from the array.
puts string

#noteQuestion = randomPosition()
#checkAnswer(noteQuestion)