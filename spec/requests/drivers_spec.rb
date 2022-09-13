require 'swagger_helper'

RSpec.describe 'drivers', type: :request do
  path '/create_driver' do
    post 'Creates a Driver' do
      consumes 'application/json'

      parameter name: :driver, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string},
          licence_id: { type: :string}
        }
      }

      response '200', 'Driver created' do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test! do |response|
          data = JSON.parse(response.body)
        end
      end
    end
  end

  path '/drivers' do
    get('Drivers List') do
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/drivers/{id}/add_cards' do
    parameter name: 'id', in: :path, type: :string, description: 'driver_id'
    post 'Driver Card Details' do
      consumes 'application/json'
      parameter name: :card_detail, in: :body, schema: {
        type: :object,
        properties: {
          card_no: { type: :string },
          expiry_month: { type: :string },
          expiry_year: { type: :string },
          is_default: {type: :boolean}
        }
      }
      response '200', 'card created' do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test! do |response|
          data = JSON.parse(response.body)
        end
      end
    end
  end

  # path '/drivers/{id}/card_details' do
  #   parameter name: 'id', in: :path, type: :string, description: 'id'
  #   get('card_details list') do
  #     response(200, 'successful') do
  #       let(:id) { '123' }

  #       after do |example|
  #         example.metadata[:response][:content] = {
  #           'application/json' => {
  #             example: JSON.parse(response.body, symbolize_names: true)
  #           }
  #         }
  #       end
  #       run_test!
  #     end
  #   end
  # end

  path '/drivers/{id}/create_purchase_fuel' do
    parameter name: 'id', in: :path, type: :string, description: 'driver_id'
    post 'Purchase a fuel' do
      consumes 'application/json'

      parameter name: :purchase_fuel, in: :body, schema: {
        type: :object,
        properties: {
          amount: { type: :integer },
          payment_type: { type: :integer }
        }
      }
      response '200', 'Purchase fuel created' do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test! do |response|
          data = JSON.parse(response.body)
        end
      end
    end
  end

  path '/pay_later_amounts' do
    get('Pay Later Wallet') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/drivers/{id}/pay_later_transactions' do
    parameter name: 'id', in: :path, type: :string, description: 'driver_id'
    get 'Pay Later Transaction' do
      consumes 'application/json'
      response '200', 'Pay Later Transaction' do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test! do |response|
          data = JSON.parse(response.body)
        end
      end
    end
  end

  path '/drivers/{id}/is_paid_transaction' do
    parameter name: 'id', in: :path, type: :string, description: 'driver_id'

    patch 'Update Pay later Transactions to Paid' do
      consumes 'application/json'
      parameter name: :transaction, in: :body, schema: {
        type: :object,
        properties: {
          transaction_ids: { type: :string }        }
      }
      response '200', 'Mark Paid Transaction For Pay Later Transactions' do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test! do |response|
          data = JSON.parse(response.body)
        end
      end
    end
  end

end