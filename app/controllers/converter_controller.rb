class ConverterController < ApplicationController
    def index
    end

    def create
        @answers = []
        send("format_#{params[:data].downcase}")
    end

  def format_sexigesimal
    params[:form][:body].split("\n").each do |line|
        ra, dec = line.split(" ")
        @answers << to_sexigesimal(ra, dec)
    end
  end

  private
  def format_decimal
    params[:form][:body].split("\n").each do |line|
        sign_char = line.include?("+") ? "+" : "-" 
        ra, dec = line.split(sign_char)
        raH, raM,raS = ra.split(" ")
        decD, decM, decS = dec.split(" ")
        @answers << to_decimal_degrees(raH.to_f, raM.to_f, raS.to_f, (sign_char + decD).to_f, decM.to_f, decS.to_f)
    end
  end

  def to_decimal_degrees(raH, raM, raS, decD, decM, decS)
      raDD = (raH) * 15 + (raM/4 + raS/240)
      decDD = (decD.abs + decM/60 + decS/3600 ) * (decD >= 0 ? 1.0 : -1.0)
    return raDD, decDD
  end


  def to_sexigesimal(raDec, decDec)
      numbs = raDec.split('.')
      raH = numbs[0].to_f/15.0
      raM = numbs[1].to_f/60.0
      raS = raM.to_s.split('.')[-1].to_f / 60.0

      numbs = decDec.split('.')
      decD = numbs[0].to_f
      decM = numbs[1].to_f/60.0
      decS = decM.to_s.split('.')[-1].to_f / 60.0
      return "#{raH}:#{raM}:#{raS} #{decD > 0 ? "+" : "-"}#{decD}:#{decM}:#{decS}"
  end
end
