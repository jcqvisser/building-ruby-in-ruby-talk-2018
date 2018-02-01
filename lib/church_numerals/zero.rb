module ChurchNumerals
  class Zero
    def call(value, &action)
      value
    end

    def to_i
      0
    end
  end
end
