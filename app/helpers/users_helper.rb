module UsersHelper
	def user_fields_exist?
    current_user.name.present? && current_user.surname.present?  && current_user.passport_number.present?
  end
end
