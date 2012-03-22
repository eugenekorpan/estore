ActiveAdmin.register Product do
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :name
      f.input :description
      f.input :price
      f.input :image, :as => :file
      f.input :showrooms
      f.input :publish_at
    end
    f.buttons
  end

  index do
    column :image do |product|
      image_tag(product.image.url(:thumb))
    end
    column :name
    column :price, :sortable => :price do |product|
      div :class => "price" do
        number_to_currency product.price
      end
    end
    column :publish_at
    column "Showrooms" do |product|
      product.showrooms.map(&:title).join("<br /> ").html_safe
    end
    default_actions
  end

  show do
    div :class => "panel" do
      h3 product.name
      div :class => "panel_contents" do
        div :class => "attributes_table" do
          table do
            tr do
              td "Price"
              td number_to_currency(product.price)
            end
            tr do
              td "Image"
              td image_tag(product.image.url)
            end
            tr do
              td "Publish at"
              td product.publish_at
            end
            tr do
              td "Showrooms"
              td product.showrooms.map(&:title).join("<br /> ").html_safe
            end
          end
        end
      end
    end
  end

end
