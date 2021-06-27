module WalletsHelper
  def parse_wallet_number(number)
    string = number.to_s
    "#{string[0..3]} - #{string[4..7]} - #{string[8..11]} - #{string[11..14]}"
  end
end
