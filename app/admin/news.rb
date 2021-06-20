ActiveAdmin.register_page 'News' do
  menu priority: 1, label: proc { I18n.t('active_admin.news') }

  content title: proc { I18n.t('active_admin.news') } do
    columns do
      # render news
    end
  end
end
