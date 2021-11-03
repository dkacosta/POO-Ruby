# Este programa es una lista de compras
class Lista
  attr_accessor :elementos, :menu

  def initialize
    @articulos = []
    @menu = ["Ver", "Agregar", "Checkear", "Eliminar", "Vaciar", "Salir"]
  end

  def menu
    titulo
    @menu.each_with_index do |valor, indice|
      puts "#{indice + 1} - #{valor}"
    end
    print "\nElige una opcion: "
    opcion = gets.chomp.to_i

    # Llamar a metodos

    case opcion
    when 1
      ver
    when 2
      agregar
    when 3
      checkear
    when 4
      eliminar
    when 5
      vaciar
    else
      salir
    end
  end

  private
    def titulo
      system("clear")
      puts "\nLista de compras"
      puts "\n"
    end

    def ver
      lista
      pause
      menu
    end

    def agregar
      while true
        lista
        print "Escribe el nombre del articulo\no escribe x si quieres volver al menu: "
        nombre = gets.chomp
        unless nombre == "x"
          @articulos << "[ ] " + nombre.capitalize
        else
          break
        end
      end
      menu
    end

    def checkear
      while true
        lista
        print "Indique el numero de articulo que quiere checkear\no escriba x si quieres volver al menu: "
        indice = gets.chomp.to_i
        if indice == 0
          break
        end
        @articulos[indice - 1] = @articulos[indice -1].sub("[ ]", "[X]")
      end
      menu
    end

    def eliminar
      while true
        lista
        print("Escribe el numero del articulo que desea eliminar\no escriba una x para volver al menu: ")
        indice = gets.chomp.to_i
        if @articulos[indice - 1]
          @articulos.delete_at(indice - 1)
        end
        break if indice == 0
      end
      menu
    end

    def vaciar
      lista
      print "Esta seguro que desea vaciar la lista?\nescriba 'yes' para confirmar o 'no' para salir: "
      respuesta = gets.chomp
      if respuesta == "yes"
        @articulos = []
      end
      menu
    end

    def salir
      system("clear")
    end

    def lista
      titulo
      puts "Lista vacia" if @articulos.empty?
      @articulos.each_with_index {|valor, indice| puts "#{indice + 1} #{valor}"}
      puts "\n"
    end

    def pause
      print "\nPresiona ENTER para volver al menu"
      gets
    end
end

compras = Lista.new
compras.menu
