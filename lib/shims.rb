module Rails
  def self.env
    'production'
  end

  module VERSION
    MAJOR = 0
  end
end

class WickedPdf
  class Mime
    class Type
      def self.lookup_by_extension(var)
        true
      end
    end
  end
end
