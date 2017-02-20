module CoreExtensions
  module Array
    module Where
      def where(query)
        self.select do |hash|
          query.all? do |key, value|
            if hash[key].is_a?(String)
              hash[key].match(value)
            else
              hash[key] == value
            end
          end
        end
      end
    end
  end
end
