module TransferWise
  class Transfer < APIResource
    def self.fund(resource_id, params, opts = {})
      API_VERSION = 'v3'
      response = TransferWise::Request.request(:post, "#{resource_url(resource_id)}/payments", params, opts)
      convert_to_transfer_wise_object(response)
    end

    def self.transfer_requirements(params, opts = {})
      response = TransferWise::Request.request(:post,  "/#{API_VERSION}/transfer-requirements", params,  opts)
      convert_to_transfer_wise_object(response)
    end

    def self.cancel(resource_id,  opts = {})
      response = TransferWise::Request.request(:put, "#{resource_url(resource_id)}/cancel", {},  opts)
      convert_to_transfer_wise_object(response)
    end
  end
end
