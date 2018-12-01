class Array
    def my_each(&prc)
        length.times do |i|
            prc.call(self[i])
        end

        self
    end

    def my_select(&prc)
        result = []
        my_each { |el| result << el if prc.call(el) }
        result
    end

    def my_reject(&prc)
        result = []
        my_each { |el| result << el unless prc.call(el) }
        result
    end

    def my_any?(&prc)
        my_each do |el|
            return true if prc.call(el)
        end

        false
    end

    def my_all?(&prc)
        my_each do |el|
            return false unless prc.call(el)
        end

        true
    end
end

class Array

    def my_flatten
        result = []
        self.each do |el|
            if el.is_a?(Array)
                result.concat(el.my_flatten)
            else
                result << el
            end
        end
        
        result
    end

    def my_zip(*args)
        result = []
        self.length.times do |i|
            merge = [self[i]]
            args.each do |arg|
                merge << arg[i]
            end

            result << merge
        end

        result
    end

    def my_rotate(offset = 1)
        shift = offset % self.length
        self.drop(shift) + self.take(shift)
    end

    def my_join(separator = "")
        result = ""

        length.times do |i|
            result += self[i]
            result += separator unless i == self.length-1
        end

        result
    end

    def my_reverse
        result = []

        self.each do |el|
            result.unshift(el)
        end

        result
    end
end


