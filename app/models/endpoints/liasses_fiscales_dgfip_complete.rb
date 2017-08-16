class Endpoints::LiassesFiscalesDGFIPComplete < Endpoint
  def initialize
    super
    @name = 'liasses_fiscales_dgfip_complete'
    @api_version = 2
    @api_name = 'apie'
    @parameter = '301028346'
    @options = { recipient: 'SGMAP', context: 'Ping' }
    @custom_url = endpoint_custom_url
  end

  private

  def endpoint_custom_url
    "/v2/liasses_fiscales_dgfip/2016/complete/#{@parameter}?token=#{apie_token}&#{@options.to_param}"
  end

  def apie_token
    Rails.application.config_for(:watchdoge_secrets)['apie_token']
  end
end
