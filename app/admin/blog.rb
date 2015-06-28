ActiveAdmin.register Blog do
  permit_params :title, :content, :tag_list
  menu :priority => 6
  actions :all
  config.sort_order = "id_desc"

  index :download_links => false do
    selectable_column
    column :title
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :title
      row :content do |blog|
        simple_format(blog.content, {}, sanitize: false)
      end
      row :updated_at
    end
  end
end
