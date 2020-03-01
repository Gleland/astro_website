class ConverterController < ApplicationController
    def index
    end

    def create
        input_to_format = {"Decimal" => "convert_to_sexagesimal", "Sexigesimal" => "convert_to_decimal"}
        @answers = []
        send(input_to_format[params[:data]])
    end

  private

  def convert_to_sexagesimal
    params[:form][:body].split("\n").each do |line|
        ra, dec = line.split(" ")
        @answers << to_sexagesimal(ra, dec)
    end
  end

  def convert_to_decimal
    params[:form][:body].split("\n").each do |line|
        sign_char = line.include?("+") ? "+" : "-" 
        ra, dec = line.split(sign_char)
        raH, raM, raS = ra.split(" ")
        decD, decM, decS = dec.split(" ")
        @answers << to_decimal(raH.to_f, raM.to_f, raS.to_f, (sign_char + decD).to_f, decM.to_f, decS.to_f)
    end
  end

  def to_sexagesimal(raDec, decDec)
      raH, raM, raS = calc_ra_hms(raDec.to_f)
      decH, decM, decS = calc_dec_hms(decDec.to_f)
      return [raH, raM, raS, "#{decH > 0 ? "+" : "-"}#{decH}", decM, decS]
  end

  def to_decimal(raH, raM, raS, decD, decM, decS)
    raDD = (raH) * 15.0 + (raM/4.0 + raS/240.0)
    decDD = (decD.abs + decM/60 + decS/3600 ) * (decD >= 0 ? 1.0 : -1.0)
    return raDD, decDD
  end

  def calc_ra_hms(ra_deg)
    hour = (ra_deg/ 15.0).floor
    hour_diff = (ra_deg/15.0) - hour
    minute = (hour_diff * 60.0).floor
    second = ((hour_diff * 60.0) - minute) * 60.0
    return hour, minute, second
  end

  def calc_dec_hms(dec_deg)
    hour = dec_deg.floor
    minute = ((dec_deg - hour) * 60.0).floor
    second = (((dec_deg - hour) * 60.0).abs - minute) * 60.0
    return hour, minute, second
  end
end
