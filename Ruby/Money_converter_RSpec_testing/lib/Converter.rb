class Converter
  TO_EURO = {
    usd: 0.77818,
    gbp: 1.27341,
    cad: 0.70518,
    aud: 0.69052
  }

  FROM_EURO = {
    usd: 1.28356,
    gbp: 0.78478,
    cad: 1.41613,
    aud: 1.44651
  }

  def self.convert(amount, from_currency, to_currency)
    result = 0
    if from_currency == 'eur'
      FROM_EURO.each do |key,value|
        if key.to_s.include?(to_currency)
          result += amount * value
        end
      end
    elsif to_currency == 'eur'
      TO_EURO.each do |key,value|
        if key.to_s.include?(from_currency)
          result += amount * value
        end
      end
    else
      TO_EURO.each do |key,value|
        if key.to_s.include?(from_currency)
          result += amount * value
        end
      end
    end
    result
  end

  def self.from_other_to_other(amount, from_currency, to_currency)
    other_result = 0
    FROM_EURO.each do |key,value|
      if key.to_s.include?(to_currency)
        other_result += (convert(amount, from_currency, to_currency)) * value
      end
    end
    return other_result
  end
end
