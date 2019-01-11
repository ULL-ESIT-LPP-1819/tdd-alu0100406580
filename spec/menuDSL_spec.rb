RSpec.describe MenuDSL do

    before :each do
        #grasas, grasasSat, hidratos, azucares, proteinas, sal
        @menuFacil = MenuFacil.new("Lunes")do
            titulo      "Bajo en calorías"
            ingesta     :min => 30, :max => 35
            desayuno    :descripcion => "Pan de trigo integral",
                        :porcion => "1 rodaja",
                        :gramos => 100,
                        :grasas => 3.3,
                        :grasasSaturadas => 2.0,
                        :carbohidratos => 54.0,
                        :azucares => 2.3,
                        :proteinas => 11.0,
                        :sal => 0.06
            desayuno    :descripcion => "Actimel",
                        :porcion => "1 porción",
                        :gramos => 100,
                        :grasas =>  3.4,
                        :grasasSaturadas => 2.4,
                        :carbohidratos => 4.4,
                        :azucares => 9.8,
                        :proteinas => 3.6,
                        :sal => 0.05
            almuerzo    :descripcion =>  "Arroz",
                        :porcion => "1 taza",
                        :gramos => 100,
                        :grasas => 0.9,
                        :grasasSaturadas => 0.0,
                        :carbohidratos => 81.6,
                        :proteinas => 6.67,
                        :azucares => 1.4,
                        :sal => 0.04
            almuerzo    :descripcion => "Lentejas",
                        :porcion => "1/2 cucharón",
                        :gramos => 150,
                        :grasas => 0.4,
                        :grasasSaturadas => 0.0,
                        :carbohidratos => 20.0,
                        :azucares => 8.0,
                        :proteinas => 9.0,                        
                        :sal => 0.02
            almuerzo    :descripcion => "Naranja",
                        :porcion => "1 pieza",
                        :gramos => 100,
                        :grasas =>  0.12,
                        :grasasSaturadas => 0.0,
                        :carbohidratos => 11.75,
                        :azucares => 2.4,
                        :proteinas => 0.94,
                        :sal => 0.0
            cena        :descripcion => "Leche entera hacendado",
                        :porcion => "1 vaso",
                        :gramos => 100,
                        :grasas => 3.6,
                        :grasasSaturadas => 1.1,
                        :carbohidratos => 4.6,
                        :azucares => 3.6,
                        :proteinas => 3.1,
                        :sal => 0.13
            end
    end


    it "Creación de un objeto menuDSL" do
        expect(@menuFacil).not_to eq(nil)
      end
    
    it "Salida del menuDSL" do
        puts @menuFacil
        expect(@menuFacil.to_s).to be_a_kind_of(String)
        expect(@menuFacil.to_s).not_to eq(nil)
    end        
end