module WalletsHelper
  def parse_wallet_number(number)
    wallet_number = number.to_s
    "#{wallet_number[0..3]} - #{wallet_number[4..7]} - #{wallet_number[8..11]} - #{wallet_number[11..14]}"
  end
  def user_fields_exist?
    current_user.name.present? && current_user.surname.present?  && current_user.passport_number.present?
  end
end
