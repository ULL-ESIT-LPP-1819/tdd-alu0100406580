RSpec.describe Funcional do

    before :each do

    end

    it "Prueba de si menus.to_s dan una cadena y si es un array y la lista de doblemente enlazada está con pacientes y bien" do
        expect(@menu3.is_a?(Array)).to eq(true)
        expect(@menu8.to_s).to be_a_kind_of(String)
        expect(@pacientes.is_a?(ListaDobleEnlazada)).to eq(true)
        expect(@pacientes.tamaño).to eq(10)
    end
end
