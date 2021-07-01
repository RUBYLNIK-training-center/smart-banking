module Avatar
  def avatar_file_size
    return unless avatar.attached?

    errors.add(:avatar, 'is too big') unless avatar.byte_size <= 1.megabyte
  end

  def avatar_file_format
    return unless avatar.attached?

    acceptable_types = ['image/jpeg', 'image/png']
    errors.add(:avatar, 'must be a JPEG or PNG') unless acceptable_types.include?(avatar.content_type)
  end
end
