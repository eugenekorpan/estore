ActiveAdmin::Dashboards.build do

  section "Recent Products" do
    table_for Product.order("created_at desc").limit(5) do
      column :name do |product|
        link_to product.name, [:admin, product]
      end
    end
    strong { link_to "View All Products", admin_products_path }
  end

end
