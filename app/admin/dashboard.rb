ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.news') }

  content title: proc { I18n.t('active_admin.news') } do
    # render news
  end
end
