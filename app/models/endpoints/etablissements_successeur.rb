class Endpoints::EtablissementsSuccesseur < Endpoint
  def initialize
    super
    @name = 'etablissements_successeur'
    @api_version = 2
    @api_name = 'apie'
    @parameter = '78414518700133'
    @options = { recipient: 'SGMAP', context: 'Ping' }
    @custom_url = endpoint_custom_url
  end

  private

  def endpoint_custom_url
    "/v2/etablissements/#{@parameter}/successeur?token=#{apie_token}&#{@options.to_param}"
  end

  def apie_token
    Rails.application.config_for(:watchdoge_secrets)['apie_token']
  end
end
