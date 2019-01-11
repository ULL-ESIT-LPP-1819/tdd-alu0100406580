#
  # == Clase Tabla
  # Clase para definir una Tabla Nutricional
  # Contiene Enumerable(Este no se usa) y Comparable
  # * initialize
  # * grasasMonoinsaturadas
  # * grasasPoli
  # * poliAlcoholes
  # * almidon
  # * vitaminas
  # * minerales
  # * to_s
  # * porciones
  # * ingesta
  # * <=>
#

class Tabla

#
# @author Darío Afonso Rodríguez
# @abstract Clase Tabla Nutricional

    include Enumerable
    include Comparable

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
        return "El valor energético: #{@valEnerKJ}KJ/#{@valEnerKcal}Kcal Cantidad de grasas: #{@grasas} Cantidad de grasas saturadas: #{@grasasSat} Hidratos de carbono: #{@hidratos} Azúcares: #{@azucares} Proteínas: #{@proteinas} Sal: #{@sal}"
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
 
    def ingesta
        valKJing = ((@valEnerKJ * 100) / 8400)
        valKCing = ((@valEnerKcal * 100) / 2000)
        grasasing = ((@grasas * 100) / 70)
        grasasSating = ((@grasasSat * 20) / 20)
        hidratosing = ((@hidratos * 100) / 260)
        azucaresing = ((@azucares * 100) / 90)
        proteinasing = ((@proteinas * 100) / 50)
        saling = ((@sal * 100) / 6)

        return "Ingesta de referencia: Valor energético: #{valKJing}%KJ/#{valKCing}%Kcal, Grasa total: #{grasasing.round(2)}%, Ácidos grasos saturados: #{grasasSating}, Hidratos de carbono: #{hidratosing.round(2)}%, Azúcares: #{azucaresing}%, Proteínas: #{proteinasing}, Sal: #{saling.round(2)}"
    end

    def <=>(other)
        return nil unless other.instance_of? Tabla
        mayor = 0
        menor = 0

        mayor += 1 if self.grasas > other.grasas
        mayor += 1 if self.grasasSat > other.grasasSat
        mayor += 1 if self.hidratos > other.hidratos
        mayor += 1 if self.azucares > other.azucares
        mayor += 1 if self.proteinas > other.proteinas
        mayor += 1 if self.sal > other.sal
        mayor += 1 if self.valEnerKJ > other.valEnerKJ
        mayor += 1 if self.valEnerKcal > other.valEnerKcal

        menor += 1 if self.grasas < other.grasas
        menor += 1 if self.grasasSat < other.grasasSat
        menor += 1 if self.hidratos < other.hidratos
        menor += 1 if self.azucares < other.azucares
        menor += 1 if self.proteinas < other.proteinas
        menor += 1 if self.sal < other.sal
        menor += 1 if self.valEnerKJ < other.valEnerKJ
        menor += 1 if self.valEnerKcal < other.valEnerKcal


        return mayor <=> menor if ((mayor && menor) != 0)
        return 0 <=> 0
    end

end
