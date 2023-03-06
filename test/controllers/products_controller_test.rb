require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
    test 'render a list of products' do
        get products_path
        assert_response :success
        assert_select '.product', 2
    end

    test 'render a detailed product page' do
        get product_path(products(:msi))
        assert_response :success
        assert_select '.title', 'MSI Laptop gaming'
        assert_select '.description', 'Laptop en excelentes condiciones para video juegos'
        assert_select '.price', '500$'
    end

    test 'render a create new product form' do
        get product_new_path
        assert_response :success
        assert_select 'form'
    end

end