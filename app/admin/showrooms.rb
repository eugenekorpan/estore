ActiveAdmin.register Showroom do
  form  do |f|
    f.inputs "Details" do
      f.input :title
      f.input :products
    end
    f.buttons
  end

  index do
    column :title
    column :products, :sortable => :products_count do |showroom|
      showroom.products.size
    end
    default_actions
  end

end
