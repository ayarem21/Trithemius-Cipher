require 'sinatra'

class Tritemius

  def s(p)
    a = 2*p+15
    return a
  end

  def encrypting_text(alphabet, word_to_encrypt)
  tmp_size = alphabet.size.to_i
  str = word_to_encrypt
  str = str.split('')
  temp = str.size.to_i - 1
  str2 = ''
  str.index(str.first).upto(temp) do |i|
      alphabet.each do |elem|
        if (elem == str[i])
          indx = ((alphabet.find_index(elem) + s(i)) % tmp_size)
          str2 +=alphabet[indx]
        end
      end
    end
      return str2
  end
end

get '/' do
  erb :index
end

post '/encrypt/' do
  alphabet = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
  code = Tritemius.new
  @encrp = code.encrypting_text(alphabet, params[:word])
  erb :encrypt
end
