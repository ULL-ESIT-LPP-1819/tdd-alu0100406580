class Tabla
    attr_reader :grasas, :grasasSat, :hidratos, :azucares, :proteinas, :sal, :valEnerKJ, :valEnerKcal
    attr_accessor :grasasMonoinsaturadas, :grasasPoli, :poliAlcoholes, :almidon, :fibra, :vitaminas, :minerales
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

    def initialize(grasas, grasasSat, hidratos, azucares, proteinas, sal)
        @grasas, @grasasSat, @hidratos, @azucares, @proteinas, @sal = grasas, grasasSat, hidratos, azucares, proteinas, sal
        @valEnerKJ = ((@grasas*37)+(@hidratos*17)+(@proteinas*17))
        @valEnerKcal = ((@grasas*9)+(@hidratos*4)+(@proteinas*4))
        @valEnerKJTotal = ((@grasas*37)+(@hidratos*17)+(@proteinas*17)+(@sal*25)+(grasasMonoinsaturadas*37)+(grasasPoli*37)+(poliAlcoholes*10)+(almidon*17)+(fibra*8))
        @valEnerKcalTotal = ((@grasas*9)+(@hidratos*4)+(@proteinas*4)+(@sal*6)+(grasasMonoinsaturadas*9)+(grasasPoli*9)+(poliAlcoholes*2.4)+(almidon*4)+(fibra*2))
    end
   

    def porcion(porcion)

    end


end
