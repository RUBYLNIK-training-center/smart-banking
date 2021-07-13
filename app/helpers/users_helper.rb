module UsersHelper
  def user_fields_exist?(user)
    user.name.present? && user.surname.present? && user.passport_number.present?
  end
end
