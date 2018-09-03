class AnonsController < ApplicationController

  def new
    @anon = Anon.new
    @anon.objname = params[:objname]
  end

  def create
    @anon = Anon.new( params[:anon])
    if @anon.save
      redirect_to @anon.index_path, notice: 'Records was successfully imported.'
    else
      render 'new'
    end
  end

  private
    def set_anons_param
      anon_pars = params[:anon]
      anon_pars[:objname] = params[:objname]
      anon_pars
    end

    def url
      #url_for [:admin, params[:objname].to_sym], :action => 'index'
    end
end
