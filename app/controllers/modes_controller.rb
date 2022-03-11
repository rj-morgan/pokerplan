class ModesController < ApplicationController
  DEFAULT_THEME = 'lightmode'.freeze
  ALLOWED_THEME = %w[lightmode darkmode].freeze

  def update
    mode = params[:id]
    mode = DEFAULT_THEME unless ALLOWED_THEME.include?(mode)
    cookies[:thememode] = mode

    redirect_back(fallback_location: root_path)
  end
end
