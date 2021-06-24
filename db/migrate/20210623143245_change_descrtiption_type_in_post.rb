class ChangeDescrtiptionTypeInPost < ActiveRecord::Migration[6.1]
  def change
  	change_column(:posts,:description,:text,:null => false)
  end
end
