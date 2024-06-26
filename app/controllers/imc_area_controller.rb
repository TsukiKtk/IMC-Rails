class ImcAreaController < ApplicationController
  def index
    @height = nil
    @weight = nil

  end

  def very_low_weight

  end

  def low_weight

  end

  def normal_weight

  end

  def overweight

  end

  def obesityI
  end

  def obesityII
  end

  def obesityIII
    #
  end


  def calculo
    @height = params[:height].to_f # altura
    @weight = params[:weight].to_f # peso

    if @height && @weight > 0
      imc = @weight / ( @height ** 2 )
      imc = imc.ceil(1)

      if imc < 16.9
        redirect_to  imc_area_very_low_weight_path
        flash[:imc] = "Seu imc é de: #{imc}"
        flash[:situacao] = "Você está muito abaixo do peso!"

      elsif imc > 17 && imc < 18.4
        redirect_to imc_area_low_weight_path
        flash[:imc] = "Seu imc é de: #{imc}"
        flash[:situacao] = "Você está abaixo do peso!"

      elsif imc > 18.5 && imc < 24.9
        redirect_to imc_area_normal_weight_path
        flash[:imc] = "Seu imc é de: #{imc}"
        flash[:situacao] = "Você está com peso normal!"

      elsif imc > 25 && imc < 29.9
        redirect_to imc_area_overweight_path
        flash[:imc] = "Seu imc é de: #{imc}"
        flash[:situacao] = "Você está acima do peso!"

      elsif imc > 30 && imc < 34.9
        redirect_to imc_area_obesityI_path
        flash[:imc] = "Seu imc é de: #{imc}"
        flash[:situacao] = "Obesidade grau I!"

      elsif imc > 35 && imc < 40
        redirect_to imc_area_obesityII_path
        flash[:imc] = "Seu imc é de: #{imc}"
        flash[:situacao] = "Obesidade grau II!"

      elsif imc > 40
        redirect_to imc_area_obesityIII_path
        flash[:imc] = "Seu imc é de: #{imc}"
        flash[:situacao] = "Obesidade grau III!"

      end
    end
  end
end
