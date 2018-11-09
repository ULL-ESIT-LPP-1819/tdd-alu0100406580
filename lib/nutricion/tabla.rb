class Tabla
    attr_reader :grasas, :grasasSat, :hidratos, :azucares, :proteinas, :sal, :valEnerKJ, :valEnerKcal
    attr_accessor :grasasMonoinsaturadas, :grasasPoli, :poliAlcoholes, :almidon, :fibra, :vitaminas, :minerales

    def initialize(grasas, grasasSat, hidratos, azucares, proteinas, sal)
        @grasas, @grasasSat, @hidratos, @azucares, @proteinas, @sal = grasas, grasasSat, hidratos, azucares, proteinas, sal
        @valEnerKJ = ((@grasas*37)+(@hidratos*17)+(@proteinas*17))
        @valEnerKcal = ((@grasas*9)+(@hidratos*4)+(@proteinas*4))
        @valEnerKJTotal = ((@grasas*37)+(@hidratos*17)+(@proteinas*17)+(@sal*25)+(grasasMonoinsaturadas*37)+(grasasPoli*37)+(poliAlcoholes*10)+(almidon*17)+(fibra*8))
        @valEnerKcalTotal = ((@grasas*9)+(@hidratos*4)+(@proteinas*4)+(@sal*6)+(grasasMonoinsaturadas*9)+(grasasPoli*9)+(poliAlcoholes*2.4)+(almidon*4)+(fibra*2))
    end

    def grasasMonoinsaturadas
        @grasasMonoinsaturadas ||= 0
    end

    def grasasPoli
        @grasasPoli ||= 0
    end

    def poliAlcoholes
        @poliAlcoholes ||= 0
    end

    def almidon
        @almidon ||= 0
    end

    def fibra
        @fibra ||= 0
    end

    def vitaminas
        @vitaminas ||= 0
    end

    def minerales
        @minerales ||= 0
    end

    def to_s
        "El valor energético: #{@valEnerKJ}KJ/#{@valEnerKcal}Kcal\n Cantidad de grasas: #{@grasas}\n Cantidad de grasas saturadas: #{@grasasSat}\n Hidratos de carbono: #{@hidratos}\n Azúcares: #{@azucares}\n Proteínas: #{@proteinas}\n Sal: #{@sal}"
    end
   
    def porciones(porcion)
        valKJpor = ((@valEnerKJ * porcion) / 100)
        valKCpor = ((@valEnerKcal * porcion) / 100)
        grasaspor = ((@grasas * porcion) / 100)
        grasasSatpor = ((@grasasSat * porcion) / 100)
        hidratospor = ((@hidratos * porcion) / 100)
        azucarespor = ((@azucares * porcion) / 100)
        proteinaspor = ((@proteinas * porcion) / 100)
        salpor = ((@sal * porcion) / 100)
        return "cada porcion de #{porcion} tiene: Valor energetico:#{valKJpor}KJ/#{valKCpor}, grasas: #{grasaspor}, grasas saturadas: #{grasasSatpor}, hidratos de carbono: #{hidratospor}, azucares: #{azucarespor}, proteinas: #{proteinaspor}, sal: #{salpor}"
    end
 


end
