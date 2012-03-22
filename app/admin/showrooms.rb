ActiveAdmin.register Showroom do
  index do
    column :title
    column :products, :sortable => :products_count do |showroom|
      showroom.products_count
    end
    default_actions
  end
end
