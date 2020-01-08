class ConverterController < ApplicationController
    def index
    end

    def create
        @answers = []
        params[:form][:body].split("\n").each do |line|
            sign_char = line.include?("+") ? "+" : "-" 
            ra, dec = line.split(sign_char)
            raH, raM,raS = ra.split(" ")
            decD, decM, decS = dec.split(" ")
            @answers << to_decimal_degrees(raH.to_f, raM.to_f, raS.to_f, (sign_char + decD).to_f, decM.to_f, decS.to_f)
        end
    end

  private
  def to_decimal_degrees(raH, raM, raS, decD, decM, decS)
      raDD = (raH) * 15 + (raM/4 + raS/240)
      decDD = (decD.abs + decM/60 + decS/3600 ) * (decD >= 0 ? 1.0 : -1.0)
    return raDD, decDD
  end
end
